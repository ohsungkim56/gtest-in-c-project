

MODULE_NAME:=NW_INTERFACE_TEST

$(MODULE_NAME)_SRCS:=nw_interface_test.cpp
$(MODULE_NAME)_INCS:=$(BASE_PATH)/NW_interface/src \
			$(BASE_PATH)/NW_interface/inc \
			$(BASE_PATH)/EXTERNAL_NW_API/inc

$(MODULE_NAME)_SRCS:=$(addprefix $(BASE_PATH)/test/NW_interface/,$($(MODULE_NAME)_SRCS))

$(MODULE_NAME) : MODULE_NAME:=$(MODULE_NAME)
$(MODULE_NAME) : $($(MODULE_NAME)_SRCS)
	g++ -c -o $(OBJECT_PATH)/nw_interface_test.o $(addprefix -I,$($(MODULE_NAME)_INCS)) $< $(LCOV_FLAGS)
