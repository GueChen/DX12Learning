set(CMAKE_WIN32_EXECUTABLE ON)

list(APPEND CMAKE_MODULE_PATH "${MY_PROJECT_ROOT}/common/cmake")
include(Compileshader)

#find_program(DXC_EXECUTABLE dxc)

set(SHADER_SRC "${CMAKE_CURRENT_SOURCE_DIR}/Shaders")
set(SHADER_SOURCE "color.hlsl")
set(SHADER_BINARY_NAME "vs.cso")
set(SHADER_BINARY "${CMAKE_CURRENT_BINARY_DIR}/${SHADER_BINARY_NAME}")

#if(DXC_EXECUTABLE)
#	message(STATUS "FOUND DXC : ${DXC_EXECUTABLE}")
#	add_custom_command(
#		OUTPUT ${SHADER_BINARY}
#		COMMAND ${DXC_EXECUTABLE} -T vs_6_5 -E VS -Fo ${SHADER_BINARY} ${SHADER_SRC}/${SHADER_SOURCE}
#		COMMENT "Compiling HLSL shader : ${SHADER_SOURCE}"
#	)
#endif()

add_executable(ShapesApp "ShapesApp.cpp" "FrameResource.h" "FrameResource.cpp")

set_target_properties(ShapesApp PROPERTIES 
	LINKER_LANGUAGE CXX
	CXX_STANDARD 20
)

add_custom_command(TARGET ShapesApp POST_BUILD 		
	COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/Shaders" "$<TARGET_FILE_DIR:ShapesApp>/Shaders"
)

target_link_libraries(ShapesApp PRIVATE D3D12Util)

target_compile_definitions(
	ShapesApp PRIVATE
	SHADER_VS_BIN="color_vs.cso"
	SHADER_PS_BIN="color_ps.cso"
)

compile_hlsl_shaders(ShapesApp
	"color.hlsl" vs "VS"
	"color.hlsl" ps "PS"
)