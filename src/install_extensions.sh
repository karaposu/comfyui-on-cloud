#!/bin/bash

# make sure you are in comfyui installation folder

#COMFY MANAGER

git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager
pip install -r custom_nodes/ComfyUI-Manager/requirements.txt


#controlnet_aux
git clone https://github.com/Fannovel16/comfyui_controlnet_aux custom_nodes/comfyui_controlnet_aux
pip install -r custom_nodes/comfyui_controlnet_aux/requirements.txt


#IPADAPTER
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus custom_nodes/ComfyUI_IPAdapter_plus


# reactor
git clone https://github.com/Gourieff/comfyui-reactor-node custom_nodes/comfyui-reactor-node
python custom_nodes/comfyui-reactor-node/install.py
wget -P ~/models/facerestore_models https://github.com/sczhou/CodeFormer/releases/download/v0.1.0/codeformer.pth
wget -P ~/models/facerestore_models https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/GFPGANv1.4.pth
