# CMakeList.txt: Chapter1 的 CMake 项目，在此处包括源代码并定义
# 项目特定的逻辑。
#

# 将源代码添加到此项目的可执行文件。

add_executable (tol "tol.cpp")
add_executable (VectorOps     "VectorOps.cpp")
add_executable (InitFunctions "InitFunctions.cpp")
add_executable (xmvec3 "xmvec3.cpp")

if (CMAKE_VERSION VERSION_GREATER 3.12)
  set_property(TARGET tol PROPERTY CXX_STANDARD 20)
  set_property(TARGET VectorOps PROPERTY CXX_STANDARD 20)
  set_property(TARGET InitFunctions PROPERTY CXX_STANDARD 20)
  set_property(TARGET xmvec3 PROPERTY CXX_STANDARD 20)
endif()

# TODO: 如有需要，请添加测试并安装目标。
