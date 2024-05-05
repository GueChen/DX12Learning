
file(GLOB_RECURSE HEADER_FILES "inc/*.h" "inc/*.hpp")
file(GLOB_RECURSE SOURCE_FILES "src/*.c" "src/*.cpp")

add_library(D3D12Util STATIC ${HEADER_FILES} ${SOURCE_FILES})

set_property(TARGET D3D12Util PROPERTY LINKER_LANGUAGE CXX)
set_property(TARGET D3D12Util PROPERTY CXX_STANDARD 20)

target_include_directories(D3D12Util PUBLIC inc)
target_compile_definitions(D3D12Util PUBLIC UNICODE)