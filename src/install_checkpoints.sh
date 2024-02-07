#!/bin/bash

mkdir -p ./models/clip/
mkdir -p ./models/ipadapter/

#sd_xl and refiner
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -P ./models/checkpoints/
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -P ./models/checkpoints/

#sd_xl_base_1.0_0.9vae
wget https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0_0.9vae.safetensors -P ./models/checkpoints/


# v1-5-pruned
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/blob/main/v1-5-pruned.safetensors -P ./models/checkpoints/

# v1-5-pruned-emaonly
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors -P ./models/checkpoints/

# realisticVisionV51_v51VAE
wget https://huggingface.co/frankjoshua/realisticVisionV51_v51VAE/resolve/main/realisticVisionV51_v51VAE.safetensors -P ./models/checkpoints/

# turbovision xl
wget https://huggingface.co/akshitapps/TurboVisionXL/resolve/main/turbovisionxlSuperFastXLBasedOnNew_tvxlV431Bakedvae.safetensors -P ./models/checkpoints/

# Absolute Reality 1.8.1
wget https://huggingface.co/digiplay/AbsoluteReality_v1.8.1/resolve/main/absolutereality_v181.safetensors -P ./models/checkpoints/


# Absolute Reality 1.8.1.INPAINTING
wget https://civitai.com/api/download/models/134084 --content-disposition -P ./models/checkpoints/

# dreamshaper 8
wget https://huggingface.co/autismanon/modeldump/resolve/main/dreamshaper_8.safetensors -P ./models/checkpoints/

# dreamshaper xl
wget https://civitai.com/api/download/models/251662 --content-disposition -P ./models/checkpoints/

# perfectdeliberate
wget ttps://civitai.com/api/download/models/253055 --content-disposition -P ./models/checkpoints/

# ipadapters
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors -P ./models/ipadapter/


# ControlNets
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11e_sd15_ip2p_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11e_sd15_shuffle_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_canny_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1p_sd15_depth_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_lineart_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_mlsd_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_normalbae_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_openpose_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_scribble_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_seg_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_softedge_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15s2_lineart_anime_fp16.safetensors -P ./models/controlnet/
wget https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11u_sd15_tile_fp16.safetensors -P ./models/controlnet/

# ControlNet SDXL
wget https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-canny-rank256.safetensors -P ./models/controlnet/
wget https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-depth-rank256.safetensors -P ./models/controlnet/
wget https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-recolor-rank256.safetensors -P ./models/controlnet/
wget https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank256/control-lora-sketch-rank256.safetensors -P ./models/controlnet/
wget -O ./models/controlnet/depth-sdxl-1.0-diffusion_pytorch_model.bin https://huggingface.co/diffusers/controlnet-depth-sdxl-1.0-mid/resolve/main/diffusion_pytorch_model.bin

#vae
wget https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.ckpt -P ./models/vae/
wget -O ./models/controlnet/vae_sdxl-1.0-inpainting-0.1.safetensors https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/vae/diffusion_pytorch_model.safetensors


 # clip vision
wget https://huggingface.co/comfyanonymous/clip_vision_g/resolve/main/clip_vision_g.safetensors -P ./models/clip/
# wget https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/model.safetensors -P ./models/clip/
wget -O ./models/clip/CLIP-ViT-H-14.safetensors https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/model.safetensors


