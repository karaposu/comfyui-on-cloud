#!/bin/bash

mkdir -p ./models/clip/
mkdir -p ./models/ipadapter/
mkdir -p ./models/upscale_models/



#sd_xl and refiner
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -P ./models/checkpoints/
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -P ./models/checkpoints/
wget -c https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0_0.9vae.safetensors  -P ./models/checkpoints/

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
wget https://civitai.com/api/download/models/253055 --content-disposition -P ./models/checkpoints/

#CyberRealistic 4.1
wget https://civitai.com/api/download/models/256915 --content-disposition -P ./models/checkpoints/

#CyberRealistic 4.1 inpainting
wget https://civitai.com/api/download/models/256955 --content-disposition -P ./models/checkpoints/

# epiCPhotoGasm-X photoreal
wget https://civitai.com/api/download/models/132632 --content-disposition -P ./models/checkpoints/


#epicrealism naturalSin
wget https://huggingface.co/misri/epicrealism_naturalSin/resolve/main/epicrealism_naturalSin.safetensors -P ./models/checkpoints/

# ipadapters
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors -P ./models/ipadapter/
wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors -P ./models/ipadapter/

#wget https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors -P ./models/clip/
wget -O ./models/clip_vision/IPAdapter_image_encoder.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors
wget -O ./models/clip_vision/IPAdapter_SDXL_image_encoder.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors



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
wget https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/OpenPoseXL2.safetensors -P ./models/controlnet/

#vae
wget https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.ckpt -P ./models/vae/
wget -O ./models/controlnet/vae_sdxl-1.0-inpainting-0.1.safetensors https://huggingface.co/diffusers/stable-diffusion-xl-1.0-inpainting-0.1/resolve/main/vae/diffusion_pytorch_model.safetensors
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors -P ./models/vae/

 # clip

 # clip vision
 ## SDXL
wget -O  ./models/clip_vision/SDXL_CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors   https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors
## SD1.5
wget -O  ./models/clip_vision/SD15_CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors   https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors
wget -O  ./models/clip_vision/clip-vit-large-patch14.bin   https://huggingface.co/openai/clip-vit-large-patch14/resolve/main/pytorch_model.bin
wget https://huggingface.co/comfyanonymous/clip_vision_g/resolve/main/clip_vision_g.safetensors -P ./models/clip_vision/
wget -O  ./models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors   https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/model.safetensors


# upscale_models

wget https://huggingface.co/uwg/upscaler/resolve/main/ESRGAN/4x_NickelbackFS_72000_G.pth ./models/upscale_models/
wget https://civitai.com/api/download/models/125843 --content-disposition -P ./models/upscale_models/





# segment anything
## GroundingDINO_SwinT_OGC
wget https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/GroundingDINO_SwinT_OGC.cfg.py -P ./models/grounding-dino/
wget https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/groundingdino_swint_ogc.pth  -P ./models/grounding-dino/
##GroundingDINO_SwinB
wget https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/GroundingDINO_SwinB.cfg.py -P ./models/grounding-dino/
wget https://huggingface.co/ShilongLiu/GroundingDINO/resolve/main/groundingdino_swinb_cogcoor.pth -P ./models/grounding-dino/
#
##sam_vit_h
wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth -P ./models/sams/
###sam_vit_l
wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_l_0b3195.pth -P ./models/sams/
###  sam_vit_b
wget https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth -P ./models/sams/
### sam_hq_vit_h
wget https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_h.pth -P ./models/sams/
### sam_hq_vit_l
wget https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_l.pth -P ./models/sams/
###sam_hq_vit_b
wget https://huggingface.co/lkeab/hq-sam/resolve/main/sam_hq_vit_b.pth -P ./models/sams/
###mobile_sam
wget https://github.com/ChaoningZhang/MobileSAM/blob/master/weights/mobile_sam.pt -P ./models/sams/


#wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1-UvJabG-p51zHOR0djWlbBKusU2Boaie' -O morgan.safetensors


## SVD related

wget https://huggingface.co/stabilityai/stable-video-diffusion-img2vid-xt/resolve/main/svd_xt.safetensors -P ./models/checkpoints/


