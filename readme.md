# ComfyUI on Cloud


[![Tutorial](https://img.youtube.com/vi/PZwnbBaJH3I/0.jpg)](https://www.youtube.com/watch?v=PZwnbBaJH3I)

The main goal of this repository is to provide a quick and easy method for individuals interested in stable diffusion to set up their own comfyUI server application with GPU support. This application can be accessed from any device capable of running a browser, including ARM-based Macs, iPads, and even smartphones, without concerns about performance, speed, or privacy issues.

> **NOTE:** As we use the spot VM feature to minimize costs, there may be times when GCP refuses to start the VM instance. To prevent this, it's possible to switch from a spot VM to a standard VM, but be aware that this will result in an approximate 60% increase in total costs.

## Cost Efficiency

Normally, a full month's usage of a T4 GPU with 6 VCPU cores, 16 GB RAM, and 100GB SSD amounts to approximately 150 dollars on Google Cloud Platform (GCP). However, by automating the VM's shutdown and startup processes and assuming an average usage of 3 hours per day, the cost is reduced to around 35 dollars per month.

| Avg Usage  | SSD   | RAM  | Number of VCPU Cores | Monthly Cost (Estimation) |
|------------|-------|------|----------------------|---------------------------|
| 3h per day | 100GB | 16GB | 6                    | 35$                       |
| 6h per day | 100GB | 16GB | 6                    | 52$                       |


---

# Table of contents
1. [How to Install?](#installation )
2. [How to Use?](##usage)
3. [How can I get my images?](#get_images)
4. [How can download new models?](#new_models)
5. [Explanation of Files](#explanation_of_files)
6. [Instruction details](#instruction_details)
7. [Troubleshooting](#troubleshooting)



## How to Install? (Takes only 15 mins!) <a name="installation"></a>

1. Create a GCP compute engine instance(VM) and Install the google CLI on your local machine(***details below***).
2. Log in to your VM and execute the following commands:

    ```bash
    git clone https://github.com/karaposu/comfyui-on-cloud
    chmod +x ./comfyui-on-cloud/src/install.sh
    chmod +x ./comfyui-on-cloud/src/virgin_vm.sh
  
    ./comfyui-on-cloud/src/virgin_vm.sh # run this only for new VM. This will install miniconda, cuda 11.8, torch.  
    source ~/.bashrc 
    ./comfyui-on-cloud/src/install.sh
    ```

    This will set up comfyUI, install popular extensions and model checkpoints, and include an automation script that automatically starts the comfyvm server whenever the VM is booted.


## How to Use?<a name="usage"></a>


1. To start comfyUI server, open your terminal in your local machine and run the command below.

   ```bash
    gcloud compute instances start comfyvm
    ```
   (Or if you are on your ipad, go to https://console.cloud.google.com/compute/instances and click start)

    Now you can access comfyUI through any browser by browsing:
[http://[external-ip-of-your-vm]:8188 ](http://[external-ip-of-your-vm]:8188 )
   
2. To shut down the server and avoid unnecessary CPU and GPU usage costs during idle times, run:

    ```bash
    gcloud compute instances stop comfyvm
    ```
---
##  How can I get my images?<a name="get_images"></a>  
### Get them through ComfyUI 
You can right click on generated image and click "save image". This will download it to your local.
if you wanna download past generated images you can click view history and load past image and then do "save image"
### Bulk download them to your local with gcloud scp
1. Find out the full path of your ComfyUI output folder. Mine is `/home/ns/ComfyUI/output`.
2. Create a new folder in your local machine and cd into that directory through terminal
3. run this command (change "ns" with your username inside comfyvm and also change the output directory path accordingly  )
```gcloud compute scp --recurse ns@comfyvm:/home/ns/ComfyUI/output ./``` 
This will download the images into your local. 


##  How can I download new models? <a name="new_models"></a>  
- Option 1: You can use ComfyUI Nanager to download them. Just open the Manager and click
```install models```
- Option 2: Find a model you like in CivitAI. When you are in the model page, check your link and find the model id number. 
Civitai links looks like this:

   ```https://civitai.com/models/139562/realvisxl-v40```

   here ```139562``` is the model id we need. modify the code line below with modelid number you want 

   ```wget https://civitai.com/api/download/models/134084 --content-disposition -P ./models/checkpoints/``` 

   Now, all you need to do is login to your server and then enter your ComfyUI folder with ```cd ComfyUI``` and paste the line above. 
   Once installation finished you can use reboot your server and you can use the model. 
   And some models requires login. And to download them, follow instructions in this link :

   https://education.civitai.com/civitais-guide-to-downloading-via-api/

## Explanation of Files for manual usage and debugging <a name="explanation_of_files"></a>

Feel free to inspect all files or ask for clarification to ensure safety and suggest any improvements.

- **Installer:** `install.sh` script manages the installation and setup process.
- **Installer for Official ComfyUI repo:** `install_comfyui.sh`
- **Checkpoint Installer:** `install_checkpoints.sh`
- **Extensions Installer:** `install_extension.sh`
- **We are also dynamically creating `run_the_server.sh`** file and adding it to the systemd services to ensure comfyUI starts on boot: `/etc/systemd/system/comfyui.service`

## Detailed Tutorial   <a name="instructions_details"></a>

### 1. Creating a Linux VM with GPU Support and Authenticating Your Local Machine

1. **Create a Google Cloud Platform account** and activate the compute engine. 
2. **Upgrading to a paid account** (Search "billing accounts")
3. **Increase GPU quota** from 0 to 1 via Quotas & System Limits (search GPUs (all regions) inside the Quotas & System Limits )
4. **Create an Ubuntu 20.04 VM** with T4 GPU and add a TCP firewall rule for port 8188. (name your instance comfyvm, choose zone as europe-central2-b and make sure add your firewall port8188 tag in the network section  )
5. **Open terminal in your local machine and Install the gcloud CLI**:

    ```bash
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-461.0.0-darwin-arm.tar.gz
    tar -xzvf google-cloud-cli-461.0.0-darwin-arm.tar.gz
    ./google-cloud-sdk/install.sh
    # for windows simply download the gcloud from the link below and run it
    # https://cloud.google.com/sdk/docs/install#windows
    ```

    If there are issues with the `gcloud` command, add the following to your `~/.bash_profile`, adjusting the paths as necessary:

    ```bash
    if [ -f '/Users/your_username/projects/google-cloud-sdk/path.bash.inc' ]; then . '/Users/your_username/projects/google-cloud-sdk/path.bash.inc'; fi
    if [ -f '/Users/your_username/projects/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/your_username/projects/google-cloud-sdk/completion.bash.inc'; fi
    ```

6. **Authenticate using gcloud** on your local machine:

    ```bash
   gcloud auth login
    gcloud init
    ```

7. **Generate new SSH key pairs** on your local machine:

    ```bash
    ssh-keygen -t rsa -b 2048 -C "comfy_vm_key" -f ~/.ssh/comfy_vm_key
    # for windows, run the below commands instead:
    # mkdir "$HOME\.ssh"
    # ssh-keygen -t rsa -b 2048 -C "comfy_vm_key" -f "$HOME\.ssh\comfy_vm_key"
    ```
     
    This creates `.ssh/comfy_vm_key.pub` and `.ssh/comfy_vm_key` files.

8. **Authenticate the VM with your SSH key pairs** and log in from your local machine to the VM:

    ```bash
    cd ~/.ssh
    gcloud compute os-login ssh-keys add --key-file=comfy_vm_key.pub
    gcloud compute ssh comfyvm --zone europe-central2-b
    #  if you got error and try running this line  "gcloud compute config-ssh "   and then run "gcloud compute ssh comfyvm"
    #  if this doesnt work too, run "gcloud compute config-ssh --remove" and "rm ~/.ssh/authorized_keys" and run "gcloud init" and try to connect again
    ```
### 2.Setting up ComfyUI Server

1. Log in to the VM:

    ```bash
    gcloud compute ssh comfyvm --zone europe-central2-b
    
    ```

2. Clone the repo for ComfyUI installation scripts and execute them:

    ```bash
    git clone https://github.com/karaposu/comfyui-on-cloud
    chmod +x ./comfyui-on-cloud/src/install.sh
    chmod +x ./comfyui-on-cloud/src/virgin_vm.sh
  
    ./comfyui-on-cloud/src/virgin_vm.sh # run this only for new VM. This will install miniconda, cuda 11.8, torch.  
    source ~/.bashrc 
    ./comfyui-on-cloud/src/install.sh
    ```

    This process will automatically install a startup runner for the server and start the server. You can verify the installation by accessing `[external-ip-of-your-vm]:8188` in your browser to check if everything is working correctly.


 
##  TroubleShooting  <a name="troubleshooting"></a>
### If Installation finished but server doesnt start
1. Try to login to the VM using  ```gcloud compute ssh comfyvm```. If you cant login, run 
```gcloud compute instances stop comfyvm``` and wait couple of minutes. And then run 
```gcloud compute instances start comfyvm``` and again wait couple of minutes. ANd then try to login again. 

2. If there is no problem with logining your VM, then run ```systemctl stop comfyui.service``` to stop comfyui.service. After this ```cd``` to ComfyUI directory and run 
```python main.py --listen```. Check the terminal output and make sure comfyui starts without problem. 

3. If there are no problems when running the comfyui manually then lets check why automatic startup fails. Inside your server type this 
``journalctl -u comfyui.service`` and check if it shows any errors. 
4. if there are no errors encountered for above steps, then the problem is about firewall permissions. Go and check firewall rule for port8188 and make sure in this firewall rule setting page you see comfyvm. If not then you must edit comfyvm and add port8188 tag in network settings section. 


### if comfyvm throws error when running through "python main.py --listen"
1. Make sure conda is activated. 
2. Make sure GPU is attached by running "nvidia-smi"
3. Make sure Torch sees the GPU by running these lines
```bash
    echo -e "import torch\nprint(torch.cuda.is_available())\nprint(torch.cuda.get_device_name(0))" > test_cuda.py 
    python test_cuda.py
```

### if you want to stop starting at reboot feature :
```bash

sudo systemctl disable comfyui.service
```

### if you want to stop the service for that moment :
```bash
sudo systemctl stop comfyui.service
```


