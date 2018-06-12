include $(RDI_MAKEROOT)/top.mk
include $(RDI_MAKEROOT)/subdir.mk

MYINCLUDES := \
 $(RDI_INCLUDE_DIR)/ocl/runtime_src/driver/common_em \
 $(RDI_SRCROOT)/products/sdx/ocl/src/runtime_src/driver/include \
 $(RDI_SRCROOT)/products/sdx/ocl/src/runtime_src/driver/hw_em/generic_pcie_hal2

MAJOR_VER := 1
MINOR_VER := 0
MYCFLAGS := -Wall -fvisibility=hidden -DXCLHAL_MAJOR_VER=$(MAJOR_VER) -DXCLHAL_MINOR_VER=$(MINOR_VER) -DUSE_HAL2
MYCFLAGS += -DOSNAME="Linux" -DLINUX -DPOSIX
OBJS_PROPAGATE := no
include $(RDI_MAKEROOT)/objs.mk

include $(RDI_SRCROOT)/products/sdx/ocl/rdi/static_stdcpp.mk
MYFINALLINK := $(STATIC_STDCPP)
MYFINALLINK += -Wl,-Bsymbolic
LIBRARY_NAME := hw_em
SHLIBRARIES := ext/rdizlib
STLIBRARIES := \
 products/sdx/rdi_pic_schema_static \
 products/sdx/rdi_common_em_static \
 products/sdx/sdx_lmx6.0_static \
 ext/protobuf_static
include $(RDI_MAKEROOT)/shlib.mk

RELEASE_LIBS_DIR := data/emulation/unified/hw_em/generic_pcie/driver
RELEASE_LIBS := $(LIBRARY_NAME)
RELEASE_TYPE := customer nostrip
include $(RDI_MAKEROOT)/release.mk

include $(RDI_MAKEROOT)/bottom.mk