.SUFFIXES : .c .o
.SUFFIXES : .cpp .o

.PHONY : .READY test

include module.options

all : .READY APP EXTERNAL_API API
	$(info [*]Linking start)
	g++ -o $(BUILD_OUTPUT_PATH)/app $(BUILD_OUTPUT_PATH)/main.o $(BUILD_OUTPUT_PATH)/api.o $(BUILD_OUTPUT_PATH)/external_api.o $(LDFLAG)

.READY:
	@if [ ! -d $(BUILD_OUTPUT_PATH) ]; then mkdir $(BUILD_OUTPUT_PATH); fi

test : API_TEST
	g++ -o $(BUILD_OUTPUT_PATH)/api_test $(BUILD_OUTPUT_PATH)/api_test.o $(LD_FLAGS) $(LCOV_FLAGS)
	$(BUILD_OUTPUT_PATH)/api_test
	lcov --capture --directory ./ --output-file $(BUILD_OUTPUT_PATH)/api_test.info
	lcov -o $(BUILD_OUTPUT_PATH)/api_test.info --remove $(BUILD_OUTPUT_PATH)/api_test.info \
		'/usr/*' \
		'*/test/*'
	genhtml $(BUILD_OUTPUT_PATH)/api_test.info --output-directory $(BUILD_OUTPUT_PATH)/lcov_out
clean :
	@rm -rf $(BUILD_OUTPUT_PATH)/*

include app/module.mk
include api/module.mk
include external_api/module.mk
include test/module.mk
