
MODULE_NAME=APP
$(MODULE_NAME)_PATH=$(BASE_PATH)/app

SRCS = main.cpp

$(MODULE_NAME)_SRC_PATH=$($(MODULE_NAME)_PATH)/src/
#$(MODULE_NAME)_INC_PATH=$($(MODULE_NAME)_PATH)/inc/
$(MODULE_NAME)_INC_PATH = $($(MODULE_NAME)_PATH)/inc \
       			NW_interface/inc \
			external_api/inc

$(MODULE_NAME)_OBJECTS := main.o
$(MODULE_NAME)_OBJECTS := $(addprefix $(OBJECT_PATH)/,$($(MODULE_NAME)_OBJECTS))

$(MODULE_NAME) : MODULE_NAME:=$(MODULE_NAME)

$(MODULE_NAME) : $($(MODULE_NAME)_OBJECTS)

$($(MODULE_NAME)_OBJECTS) : $(addprefix $($(MODULE_NAME)_SRC_PATH), $(SRCS))
	$(info [*]compiling $(MODULE_NAME))
	g++ $(addprefix -I, $($(MODULE_NAME)_INC_PATH)) -c $< -o $@

