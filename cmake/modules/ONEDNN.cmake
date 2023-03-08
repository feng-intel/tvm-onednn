message(STATUS "Build with oneDNN support")
#include_directories(SYSTEM ${CUDA_CUDNN_INCLUDE_DIRS})
include_directories("/opt/intel/oneapi/dnnl/latest/cpu_dpcpp_gpu_dpcpp/include")
include_directories("/opt/intel/oneapi/dnnl/latest/cpu_dpcpp_gpu_dpcpp/examples")
tvm_file_glob(GLOB ONEDNN_RELAY_CONTRIB_SRC src/relay/backend/contrib/onednn/*.cc)
list(APPEND COMPILER_SRCS ${ONEDNN_RELAY_CONTRIB_SRC})
tvm_file_glob(GLOB CONTRIB_ONEDNN_SRCS src/runtime/contrib/onednn/*.cc)
list(APPEND RUNTIME_SRCS ${CONTRIB_ONEDNN_SRCS})
#list(APPEND TVM_RUNTIME_LINKER_LIBS ${CUDA_CUDNN_LIBRARY})
find_library(ONEDNN_LIBRARY dnnl "/opt/intel/oneapi/dnnl/latest/cpu_dpcpp_gpu_dpcpp/lib")
message(STATUS "ONEDNN_LIBRARY=" "${ONEDNN_LIBRARY}")
list(APPEND TVM_RUNTIME_LINKER_LIBS ${ONEDNN_LIBRARY})