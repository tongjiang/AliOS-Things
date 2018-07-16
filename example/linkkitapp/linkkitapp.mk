NAME := linkkitapp
$(NAME)_SOURCES := linkkit_sample_single.c \
                   linkkit_entry.c

$(NAME)_COMPONENTS += framework/protocol/iotx-rhino/iotx-sdk-c \
                      framework/protocol/iotx-rhino/hal \
                      framework/netmgr \
                      framework/common \
                      framework/ywss4linkkit \
                      utility/cjson \

GLOBAL_DEFINES += MQTT_DIRECT \
                  ALIOT_DEBUG \
                  IOTX_DEBUG \
                  USE_LPTHREAD \
                  CONFIG_DM_DEVTYPE_SINGLE \
                  TEST_ALCS 

                 

ifeq ($(LWIP),1)
$(NAME)_COMPONENTS  += protocols.net
no_with_lwip := 0
endif

ifeq ($(print_heap),1)
$(NAME)_DEFINES += CONFIG_PRINT_HEAP
endif


ifneq ($(HOST_MCU_FAMILY),esp8266)
$(NAME)_COMPONENTS  += cli
GLOBAL_DEFINES += CONFIG_AOS_CLI
else
GLOBAL_DEFINES += FOTA_RAM_LIMIT_MODE
GLOBAL_DEFINES += ESP8266_CHIPSET
endif

