# CMakeList.txt: 顶层 CMake 项目文件，在此处执行全局配置
# 并包含子项目。
#
cmake_minimum_required (VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

set(MY_PROJECT_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

project ("D3D12Learning")

# 包含子项目。
add_subdirectory ("Common")
add_subdirectory ("Chapter1-XMVector")
add_subdirectory ("Chapter2-Matrix Algebra")
add_subdirectory ("Chapter4-Direct3D Initialization")
add_subdirectory ("Chapter6-Drawing In Direct3D")
add_subdirectory ("Chapter7-Drawing In Direct3D PartⅡ")