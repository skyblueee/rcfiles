set(CMAKE_EXPORT_COMPILE_COMMANDS ON)  # 生成clangd分析依赖文件
enable_testing()  # 单元测试

# 编译器选择设置
add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

set(CMAKE_CXX_STANDARD 14)
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU" OR
        "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(CXX_FLAGS "-Wall -Wextra")
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    set(CXX_FLAGS "/Zc:__cplusplus /std:c++latest")
endif()
set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} ${CXX_FLAGS})

# 自定义工具库目录
if(WIN32)
    file(TO_CMAKE_PATH $ENV{USERPROFILE} XHOME)
else()
    set(XHOME $ENV{HOME})
endif(WIN32)
include_directories(${XHOME}/bin/include)
link_directories(${XHOME}/bin/lib)
set(CMAKE_INSTALL_PREFIX ${XHOME}/bin)
message("[XTOOLS] include_directories(${XHOME}/bin/include)")
message("[XTOOLS] link_directories(${XHOME}/bin/lib)")
message("[XTOOLS] set(CMAKE_INSTALL_PREFIX ${XHOME}/bin)")
install(FILES CHANGELOG.md DESTINATION .)

# 更改默认生成TARGET位置
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/arch)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# CPack
find_package(Git)
if(GIT_FOUND)
    # 使用最新 commit Hash的前6位作为VERSION_REVISION
    execute_process(COMMAND ${GIT_EXECUTABLE} describe --abbrev=6 --always
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE VERSION_REVISION
        OUTPUT_STRIP_TRAILING_WHITESPACE)
    # 获取最新 commit 日期，YYYY-MM-DD
    execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --format=%cd --date=short
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE VERSION_DATE
        OUTPUT_STRIP_TRAILING_WHITESPACE)
    set(PACK_VERSION ${PROJECT_VERSION}.${VERSION_REVISION}@${VERSION_DATE})
else(GIT_FOUND)
    set(PACK_VERSION ${PROJECT_VERSION})
endif(GIT_FOUND)
set(CPACK_PACKAGE_VERSION ${PACK_VERSION})
set(CPACK_PACKAGE_DIRECTORY ${PROJECT_SOURCE_DIR}/pack)
set(CPACK_SOURCE_IGNORE_FILES
    ${PROJECT_SOURCE_DIR}/build
    ${PROJECT_SOURCE_DIR}/msbuild
    ${CPACK_PACKAGE_DIRECTORY}
    ${PROJECT_SOURCE_DIR}/.idea
    ${PROJECT_SOURCE_DIR}/.clangd
    ${PROJECT_SOURCE_DIR}/.git
    ${PROJECT_SOURCE_DIR}/.gitignore
    ${PROJECT_SOURCE_DIR}/compile_commands.json
    ${PROJECT_SOURCE_DIR}/.vscode)
set(CPACK_SOURCE_GENERATOR "ZIP")
set(CMAKE_INSTALL_UCRT_LIBRARIES TRUE)
include(InstallRequiredSystemLibraries)
if(WIN32)
    set(CPACK_GENERATOR "ZIP")
endif(WIN32)
include(CPack)

## { 工具函数

# add_pyc_target
function(add_pyc_target tgt file install_dir)
    set(Python_ADDITIONAL_VERSIONS 3.6)
    find_package(PythonInterp 3.6 REQUIRED)

    if(${file} MATCHES ".*\.py")
        set(OUT ${CMAKE_CURRENT_BINARY_DIR}/${file}c)
        add_custom_command(OUTPUT ${OUT}
            COMMAND ${PYTHON_EXECUTABLE} -B -c "import py_compile;py_compile.compile('${CMAKE_CURRENT_SOURCE_DIR}/${file}','${OUT}')" VERBATIM
            DEPENDS ${file})
    else()
        message("${file} is not a python file.")
    endif()

    add_custom_target(${tgt} ALL DEPENDS ${OUT})
    install(FILES ${OUT} DESTINATION ${install_dir})
endfunction()

# add_cp_target(TARGET name DEPENDS files IDIRS install_dirs)
function(add_cp_target)
    cmake_parse_arguments(CPTGT "" "TARGET" "DEPENDS;IDIRS" ${ARGN})
    foreach(file ${CPTGT_DEPENDS})
        set(OUT ${CMAKE_CURRENT_BINARY_DIR}/${file})
        list(APPEND OUT_FILES ${OUT})
        add_custom_command(OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${file}
            COMMAND cmake -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${file} ${OUT}
            DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${file})
    endforeach()
    add_custom_target(${CPTGT_TARGET} ALL DEPENDS ${OUT_FILES})

    foreach(dir ${CPTGT_IDIRS})
        install(FILES ${OUT_FILES} DESTINATION ${dir})
    endforeach()
endfunction(add_cp_target)

# add_cctest(TARGET name SOURCES a.cpp b.cpp LIBS Qt5::Widgets Qt5::Charts m PTHREAD CMD utest_cmd_str)
function(add_cctest)
    cmake_parse_arguments(CCTEST "PTHREAD" "TARGET;CMD" "SOURCES;LIBS" ${ARGN})
    add_executable(${CCTEST_TARGET} ${CCTEST_SOURCES})
    if(${CCTEST_PTHREAD} AND (NOT WIN32))
        list(APPEND CCTEST_LIBS pthread)
    endif()
    target_link_libraries(${CCTEST_TARGET} ${CCTEST_LIBS})

    string(REGEX MATCHALL "[^ ]+" CMD_ARGS ${CCTEST_CMD})
    add_test(NAME "${CCTEST_TARGET}" COMMAND ${CMD_ARGS} WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

    install(TARGETS ${CCTEST_TARGET} DESTINATION demo)
endfunction(add_cctest)

# add_pytest
function(add_pytest)
    cmake_parse_arguments(PYTEST "" "TARGET;CMD" "DEPS" ${ARGN})
    foreach(file ${PYTEST_DEPS})
        set(OUT ${PROJECT_BINARY_DIR}/${file})
        list(APPEND OUT_FILES ${OUT})
        add_custom_command(OUTPUT ${OUT}
            COMMAND cmake -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${file} ${OUT}
            DEPENDS ${file})
    endforeach()
    add_custom_target(${PYTEST_TARGET} ALL DEPENDS ${OUT_FILES})

    string(REGEX MATCHALL "[^ ]+" CMD_ARGS ${PYTEST_CMD})
    add_test(NAME ${PYTEST_TARGET} COMMAND ${CMD_ARGS} WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

    install(FILES ${OUT_FILES} DESTINATION demo)
endfunction(add_pytest)

# build_doc
function(build_doc)
    find_package(Doxygen REQUIRED dot OPTIONAL_COMPONENTS mscgen dia)
    if(DOXYGEN_FOUND)
        set(DOXYGEN_PROJECT_NAME ${CMAKE_PROJECT_NAME})
        set(DOXYGEN_PROJECT_BRIEF ${CMAKE_PROJECT_DESCRIPTION})
        set(DOXYGEN_PROJECT_NUMBER ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH})
        set(DOXYGEN_EXCLUDE ${PROJECT_SOURCE_DIR}/src/easylogging)
        set(DOXYGEN_EXCLUDE_SYMBOLS *::*Imp)
        set(DOXYGEN_TOC_INCLUDE_HEADINGS 3)
        set(DOXYGEN_ENABLE_PREPROCESSING YES)
        set(DOXYGEN_MACRO_EXPANSION YES)
        set(DOXYGEN_EXPAND_ONLY_PREDEF YES)
        set(DOXYGEN_PREDEFINED __cplusplus)
        set(DOXYGEN_DOT_FONTNAME Arial)
        set(DOXYGEN_USE_MDFILE_AS_MAINPAGE ${PROJECT_SOURCE_DIR}/README.md)
        doxygen_add_docs(doc_doxygen ${PROJECT_SOURCE_DIR}/README.md ${PROJECT_SOURCE_DIR}/src ALL
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            COMMENT "Generating API documentation with Doxygen"
            VERBATIM)

        file(GLOB images *.png *.gif)
        file(COPY ${images} DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/html/doc)

        install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html/ DESTINATION doc)
    else(DOXYGEN_FOUND)
        message("Doxygen need to be installed to generate the doxygen documentation")
    endif(DOXYGEN_FOUND)
endfunction(build_doc)

# add_bin_target 接收参数
# add_bin_target(TARGET name SOURCES a.cpp b.cpp PTHREAD SYSLIBS m SELFLIBS my USEQT QTCOMPONENTS Widgets Charts)
# PTHREAD: 开关参数，如果没有用到多线程，不设。
# TARGET: 目标名称。
# SOURCES: 源代码清单。
# SELFLIBS: 在自定义库中的库文件，前面不加lib，后面不加后缀。这个库会随打包一同发布。
# SYSLIBS: 系统库文件，不随打包一并发布。
# USEQT: 开关参数，如果用到QT，要加这个参数，必须与QTCOMPONENTS同时设置。
# QTCOMPONENTS: 用到的QT组件，如Widgets, Charts，必须同时设置USEQT。
# 前面一般需要如下设置，否则cmake generate报错
#   set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)
#   set(CMAKE_BUILD_TYPE RELEASE)
macro(add_bin_target)  # 不能是function，否则Qt找不到库
    cmake_parse_arguments(FUNCARGS "PTHREAD;USEQT" "TARGET" "SOURCES;SELFLIBS;SYSLIBS;QTCOMPONENTS" ${ARGN})
    if(${FUNCARGS_USEQT})
        set(CMAKE_AUTOMOC ON)
        set(CMAKE_AUTORCC ON)
        cmake_policy(SET CMP0074 NEW)
        find_package(Qt5 COMPONENTS ${FUNCARGS_QTCOMPONENTS} REQUIRED)
        foreach(COM ${FUNCARGS_QTCOMPONENTS})
            list(APPEND ALLLIBS Qt5::${COM})
        endforeach()
    endif()

    add_executable(${FUNCARGS_TARGET} ${FUNCARGS_SOURCES})  # 这个要在findQt之后
    if(${FUNCARGS_PTHREAD} AND (NOT WIN32))
        list(APPEND ALLLIBS pthread)
    endif()
    foreach(LIB0 ${FUNCARGS_SELFLIBS})
        list(APPEND ALLLIBS ${LIB0})
    endforeach()
    foreach(LIB0 ${FUNCARGS_SYSLIBS})
        list(APPEND ALLLIBS ${LIB0})
    endforeach()
    foreach(LIB0 ${ALLLIBS})
        message("Link Libs: ${FUNCARGS_TARGET} - ${LIB0}")
    endforeach()
    target_link_libraries(${FUNCARGS_TARGET} ${ALLLIBS})

    # 部署
    install(TARGETS ${FUNCARGS_TARGET} DESTINATION bin)
    foreach(LIB0 ${FUNCARGS_SELFLIBS})  # 部署自定义库
        if(WIN32)
            install(FILES ${CMAKE_INSTALL_PREFIX}/bin/${LIB0}.dll DESTINATION bin)
        else()
            install(FILES ${CMAKE_INSTALL_PREFIX}/lib/lib${LIB0}.so DESTINATION lib)
        endif(WIN32)
    endforeach()
    if(WIN32)  # 在Windows平台自动部署所需的QT动态库
        include(~/rcfiles/cmake/Windeployqt.cmake)
        windeployqt(${FUNCARGS_TARGET} bin)
    endif(WIN32)
endmacro(add_bin_target)
## } 工具函数
