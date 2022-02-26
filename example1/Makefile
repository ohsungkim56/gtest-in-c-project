.SUFFIXES : .c .o
.SUFFIXES : .cpp .o

.PHONY : .READY test

include makefile.options

all : .READY APP EXTERNAL_NW_API_LIB NW_INTERFACE
	$(info [*]Linking)
	g++ -o $(BINARY_PATH)/app $(OBJECT_PATH)/main.o $(OBJECT_PATH)/nw_interface.o $(LIB_PATH)/libEXTERNAL_NW_API.a $(LDFLAG)

.READY:
	@if [ ! -d $(BUILD_OUTPUT_PATH) ]; then mkdir $(BUILD_OUTPUT_PATH); fi
	@if [ ! -d $(LIB_PATH) ]; then mkdir $(LIB_PATH); fi
	@if [ ! -d $(OBJECT_PATH) ]; then mkdir $(OBJECT_PATH); fi
	@if [ ! -d $(BINARY_PATH) ]; then mkdir $(BINARY_PATH); fi

test : .READY NW_INTERFACE_TEST
	$(info [*] make test binary)
	g++ -o $(BINARY_PATH)/nw_interface_test $(OBJECT_PATH)/nw_interface_test.o $(LD_FLAGS) $(LCOV_FLAGS)
	$(info [*] run test bin)
	$(BINARY_PATH)/nw_interface_test
	$(info [*] run lcov)
	lcov --capture --directory ./ --output-file $(BUILD_OUTPUT_PATH)/nw_interface_test.info
	lcov -o $(BUILD_OUTPUT_PATH)/nw_interface_test.info --remove $(BUILD_OUTPUT_PATH)/nw_interface_test.info \
		'/usr/*' \
		'*/test/*'
	genhtml $(BUILD_OUTPUT_PATH)/nw_interface_test.info --output-directory $(BUILD_OUTPUT_PATH)/lcov_out
clean :
	@rm -rf $(BUILD_OUTPUT_PATH)

touch :
	find -name "*.cpp" -exec touch {} \;

include app/module.mk
include NW_interface/module.mk
include EXTERNAL_NW_API/module.mk
include test/module.mk
