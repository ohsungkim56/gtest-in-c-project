

MODULE_NAME:=API_TEST

$(MODULE_NAME)_SRCS:=api_test.cpp
$(MODULE_NAME)_INCS:=$(BASE_PATH)/api/inc \
			$(BASE_PATH)/external_api/inc

$(MODULE_NAME)_SRCS:=$(addprefix $(BASE_PATH)/test/api/,$($(MODULE_NAME)_SRCS))

$(MODULE_NAME) : MODULE_NAME:=$(MODULE_NAME)
$(MODULE_NAME) : $($(MODULE_NAME)_SRCS)
	g++ -o $(BUILD_OUTPUT_PATH)/api_test.o $(addprefix -I,$($(MODULE_NAME)_INCS)) -c $< $(LCOV_FLAGS)
