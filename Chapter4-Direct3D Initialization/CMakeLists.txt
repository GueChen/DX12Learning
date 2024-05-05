set(CMAKE_WIN32_EXECUTABLE ON)

add_executable(InitD3D "InitDirect3DApp.cpp")

set_target_properties(InitD3D 
	PROPERTIES
	CXX_STANDARD 20
)

target_link_libraries(InitD3D PRIVATE D3D12Util)