set(CMAKE_WIN32_EXECUTABLE ON)

add_executable(BoxApp "BoxApp.cpp")

set_target_properties(BoxApp PROPERTIES 
	LINKER_LANGUAGE CXX
	CXX_STANDARD 20
)

add_custom_command(TARGET BoxApp POST_BUILD 		
		COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/Shaders" "$<TARGET_FILE_DIR:BoxApp>/Shaders"
)

target_link_libraries(BoxApp PRIVATE D3D12Util)