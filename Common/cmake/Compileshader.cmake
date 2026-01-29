function(compile_hlsl_shaders TARGET_NAME)
	find_program(DXC_EXECUTABLE dxc REQUIRED)

	set(INDEX 0)
	list(LENGTH ARGN LIST_LEN)

	while(INDEX LESS LIST_LEN)
		list(GET ARGN ${INDEX} SHADER_FILE)
		math(EXPR TYPE_INDEX "${INDEX} + 1")
		list(GET ARGN ${TYPE_INDEX} SHADER_TYPE)
		math(EXPR ENTRY_INDEX "${INDEX} + 2")
		list(GET ARGN ${ENTRY_INDEX} SHADER_ENTRY)

		get_filename_component(FILE_NAME_WE ${SHADER_FILE} NAME_WE)
		set(OUTPUT_CSO "${CMAKE_CURRENT_BINARY_DIR}/${FILE_NAME_WE}_${SHADER_TYPE}.cso")
		set(INPUT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/Shaders/${SHADER_FILE}")
		
		set(PROFILE "${SHADER_TYPE}_6_5")

		add_custom_command(
			OUTPUT ${OUTPUT_CSO}
			COMMAND ${DXC_EXECUTABLE} -T ${PROFILE} -E ${SHADER_ENTRY} -Fo ${OUTPUT_CSO} ${INPUT_PATH}
			DEPENDS ${INPUT_PATH}
			COMMENT "Compiling ${PROFILE} Shader : ${SHADER_FILE}" 
			VERBATIM
		)

		target_sources(${TARGET_NAME} PRIVATE ${OUTPUT_CSO})

		math(EXPR INDEX "${INDEX} + 3")
	endwhile()
endfunction()
