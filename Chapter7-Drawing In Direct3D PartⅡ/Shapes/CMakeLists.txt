set(CMAKE_WIN32_EXECUTABLE ON)

add_executable(ShapesApp "ShapesApp.cpp" "FrameResource.h" "FrameResource.cpp")

set_target_properties(ShapesApp PROPERTIES 
	LINKER_LANGUAGE CXX
	CXX_STANDARD 20
)

add_custom_command(TARGET ShapesApp POST_BUILD 		
		COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/Shaders" "$<TARGET_FILE_DIR:ShapesApp>/Shaders"
)

target_link_libraries(ShapesApp PRIVATE D3D12Util)