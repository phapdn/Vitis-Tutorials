#!/bin/bash

# Copyright 2020 Xilinx Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Mark Harvey, Xilinx Inc

# This shell script compiles the quantized model and generates an .elf to
# be executed by the DPU.

ARCH=/opt/vitis_ai/compiler/arch/DPUCZDX8G/ZCU102/arch.json


compile() {
  vai_c_tensorflow \
    --frozen_pb  ${QUANT_DIR}/deploy_model.pb \
    --arch       ${ARCH} \
    --output_dir ${COMPILE_ZCU102} \
    --net_name   ${NET_NAME}
}

echo "-----------------------------------------"
echo "COMPILE STARTED.."
echo "-----------------------------------------"

conda activate vitis-ai-tensorflow

rm -rf ${COMPILE_ZCU102}
mkdir -p ${COMPILE_ZCU102}

compile | tee ${LOG}/${COMP_LOG_ZCU102}

echo "-----------------------------------------"
echo "COMPILE FINISHED"
echo "-----------------------------------------"


