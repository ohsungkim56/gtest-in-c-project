
MODULE_NAME=APP
$(MODULE_NAME)_PATH=$(BASE_PATH)/app

SRCS = main.cpp

$(MODULE_NAME)_SRC_PATH=$($(MODULE_NAME)_PATH)/src/
#$(MODULE_NAME)_INC_PATH=$($(MODULE_NAME)_PATH)/inc/
$(MODULE_NAME)_INC_PATH = $($(MODULE_NAME)_PATH)/inc \
       			api/inc \
			external_api/inc

$(MODULE_NAME)_OBJECTS := main.o
$(MODULE_NAME)_OBJECTS := $(addprefix $(BUILD_OUTPUT_PATH)/,$($(MODULE_NAME)_OBJECTS))




$(MODULE_NAME) : MODULE_NAME:=$(MODULE_NAME)

$(MODULE_NAME) : $($(MODULE_NAME)_OBJECTS)
#	g++ -o $(BUILD_OUTPUT_PATH)/$(MODULE_NAME) $< $(LD_FLAGS)

$($(MODULE_NAME)_OBJECTS) : $(addprefix $($(MODULE_NAME)_SRC_PATH), $(SRCS)) #$(addprefix $($(MODULE_NAME)_INC_PATH), $(INCS))
	$(info compiling $(MODULE_NAME))
	g++ $(addprefix -I, $($(MODULE_NAME)_INC_PATH)) -c $< -o $@
	#g++ -I$($(MODULE_NAME)_INC_PATH) -c $<
