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


# evaluate graph
eval_graph() {
  graph=$1
  python eval_graph.py \
    --graph       $graph \
    --input_node  ${INPUT_NODES} \
    --output_node ${OUTPUT_NODES} \
    --batchsize   ${BATCHSIZE} \
    --gpu         ${CUDA_VISIBLE_DEVICES} 
}


echo "-----------------------------------------"
echo "EVALUATING QUANTIZED GRAPH.."
echo "-----------------------------------------"

conda activate vitis-ai-tensorflow

eval_graph ${QUANT_DIR}/quantize_eval_model.pb | tee ${LOG}/${EVAL_Q_LOG}

echo "-----------------------------------------"
echo "EVALUATION FINISHED"
echo "-----------------------------------------"

