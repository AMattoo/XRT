include_directories(
  ${XRT_SRC_DIR}/include/1_2
  ${DRM_INCLUDE_DIRS}
  ${BOOST_FILESYSTEM_INCLUDE_DIRS}
  ${BOOST_SYSTEM_INCLUDE_DIRS}
  )

set(XRT_XOCL_API_DIR       "${CMAKE_CURRENT_SOURCE_DIR}/api")
set(XRT_XOCL_CORE_DIR      "${CMAKE_CURRENT_SOURCE_DIR}/core")
set(XRT_XOCL_XCLBIN_DIR    "${CMAKE_CURRENT_SOURCE_DIR}/xclbin")

include_directories(
  ${XRT_XOCL_API_DIR}
)

file(GLOB XRT_XOCL_API_FILES
  "${XRT_XOCL_API_DIR}/*.h"
  "${XRT_XOCL_API_DIR}/*.cpp"
  "${XRT_XOCL_API_DIR}/detail/*.h"
  "${XRT_XOCL_API_DIR}/detail/*.cpp"
  "${XRT_XOCL_API_DIR}/icd/*.cpp"
  "${XRT_XOCL_API_DIR}/khronos/*.h"
  "${XRT_XOCL_API_DIR}/khronos/*.cpp"
  "${XRT_XOCL_API_DIR}/xlnx/*.h"
  "${XRT_XOCL_API_DIR}/xlnx/*.cpp"
  "${XRT_XOCL_API_DIR}/printf/*.h"
  "${XRT_XOCL_API_DIR}/printf/*.cpp"
  "${XRT_XOCL_API_DIR}/plugin/xdp/*.h"
  "${XRT_XOCL_API_DIR}/plugin/xdp/*.cpp"
  )

file(GLOB XRT_XOCL_CORE_FILES
  "${XRT_XOCL_CORE_DIR}/*.h"
  "${XRT_XOCL_CORE_DIR}/*.cpp"
  )

file(GLOB XRT_XOCL_XCLBIN_FILES
  "${XRT_XOCL_XCLBIN_DIR}/*.h"
  "${XRT_XOCL_XCLBIN_DIR}/*.cpp"
  )

#source_group(XRT_XOCL_API_FILES FILES ${XRT_XOCL_API_FILES})
#source_group(XRT_XOCL_CORE_FILES FILES ${XRT_XOCL_CORE_FILES})
#source_group(XRT_XOCL_XCLBIN_FILES FILES ${XRT_XOCL_XCLBIN_FILES})

set(XRT_XOCL_ALL_SRC
  ${XRT_XOCL_API_FILES}
  ${XRT_XOCL_CORE_FILES}
  ${XRT_XOCL_XCLBIN_FILES}
  )

add_library(xocl OBJECT ${XRT_XOCL_ALL_SRC})
