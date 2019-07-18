# use_git_version
function(use_git_version)
    find_package(Git)
    if(GIT_FOUND)
        execute_process(COMMAND ${GIT_EXECUTABLE} describe --abbrev=6 --always
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE VERSION_REVISION
            OUTPUT_STRIP_TRAILING_WHITESPACE)
        set(PROJECT_VERSION_REVISION ${VERSION_REVISION} PARENT_SCOPE)
        execute_process(COMMAND ${GIT_EXECUTABLE} log -1 --format=%cd --date=short
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE VERSION_DATE
            OUTPUT_STRIP_TRAILING_WHITESPACE)
        set(PROJECT_VERSION_DATE ${VERSION_DATE} PARENT_SCOPE)
    else(GIT_FOUND)
        message("Git need to be installed")
    endif(GIT_FOUND)
endfunction()

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

# add_cctest
function(add_cctest)
    cmake_parse_arguments(CCTEST "PTHREAD" "TARGET;CMD" "SOURCES;LIBS" ${ARGN})
    add_executable(${CCTEST_TARGET} ${CCTEST_SOURCES})
    if(${CCTEST_PTHREAD} AND (NOT WIN32))
        list(APPEND CCTEST_LIBS pthread)
    endif()
    target_link_libraries(${CCTEST_TARGET} ${CCTEST_LIBS})

    string(REGEX MATCHALL "[^ ]+" CMD_ARGS ${CCTEST_CMD})
    add_test(NAME "${CCTEST_TARGET}" COMMAND ${CMD_ARGS} WORKING_DIRECTORY ${PROJECT_BINARY_DIR})

    install(TARGETS ${CCTEST_TARGET} DESTINATION ${RELEASE_DIR}/demo)
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

    install(FILES ${OUT_FILES} DESTINATION ${RELEASE_DIR}/demo)
endfunction(add_pytest)

# build_doc
function(build_doc)
    find_package(Doxygen REQUIRED dot OPTIONAL_COMPONENTS mscgen dia)
    if(DOXYGEN_FOUND)
        set(DOXYGEN_PROJECT_NAME ${CMAKE_PROJECT_NAME})
        set(DOXYGEN_PROJECT_BRIEF "Library for Wide Band Signal Detecting and Net Singal Indentifing")
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

        install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/html/ DESTINATION ${RELEASE_DIR}/doc)
    else(DOXYGEN_FOUND)
        message("Doxygen need to be installed to generate the doxygen documentation")
    endif(DOXYGEN_FOUND)
endfunction(build_doc)
