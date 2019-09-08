cmake_minimum_required(VERSION 3.10)

project(项目名称 VERSION 0.0.0
    DESCRIPTION "项目说明")

include(~/rcfiles/cmake/xtools.cmake)
#include(~/rcfiles/cmake/FindIPP.cmake)

#set(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)
#set(CMAKE_BUILD_TYPE DEBUG)  # 开启此选择在QT IDE中调试
#set(CMAKE_BUILD_TYPE RELEASE)

# 安装位置
#set(CMAKE_INSTALL_PREFIX path_prefix)

# 子目录
#add_subdirectory(src)
#add_subdirectory(utest)
