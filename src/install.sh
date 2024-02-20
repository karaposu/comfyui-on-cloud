#!/bin/bash

USER_NAME=$(whoami)
USER_HOME=$(eval echo ~$USER_NAME)


echo "Current directory: $(pwd)"
script_dir=$(dirname "$(realpath "$0")")
echo "script_dir : $script_dir"
parent_dir=$(dirname "$script_dir")
echo "parent_dir Directory: $parent_dir"
parentparent_dir=$(dirname "$parent_dir")
echo "parentparent_dir Directory: $parentparent_dir"
comfy_ui_dir="$parentparent_dir/ComfyUI"
echo "ComfyUI Directory: $comfy_ui_dir"

PYTHON_PATH="${USER_HOME}/miniconda3/bin/python"
BASHRC_PATH="${USER_HOME}/.bashrc"
COMFYUI_RUNNER_PATH="${comfy_ui_dir}/main.py"
COMFYUI_PATH=$comfy_ui_dir


cp comfyui-on-cloud/src/install_comfyui.sh .

chmod +x install_comfyui.sh
./install_comfyui.sh

echo " "
echo " ---------------- comfyui installed "
echo " "

cp comfyui-on-cloud/src/install_extensions.sh ComfyUI
cp comfyui-on-cloud/src/install_checkpoints.sh ComfyUI

echo " "
echo " ---------------- automation scripts copied to comfyui directory "
echo " "

cd ComfyUI

chmod +x install_extensions.sh
chmod +x install_checkpoints.sh
./install_extensions.sh

echo " "
echo " ---------------- extensions installed "
echo " "
./install_checkpoints.sh
#./install_checkpoints_big.sh

echo " "
echo " ---------------- checkpoints installed "
echo " "


# Dynamically creating run_the_server.sh

# Create the run_the_server.sh file
echo "#!/bin/bash" > run_the_server.sh
echo "" >> run_the_server.sh
echo "BASHRC_PATH=\"$BASHRC_PATH\"" >> run_the_server.sh
echo "PYTHON_PATH=\"$PYTHON_PATH\"" >> run_the_server.sh
echo "COMFYUI_RUNNER_PATH=\"${COMFYUI_PATH}/main.py\"" >> run_the_server.sh
echo "" >> run_the_server.sh
echo "# Source the bashrc file" >> run_the_server.sh
echo "source \$BASHRC_PATH" >> run_the_server.sh
echo "" >> run_the_server.sh
echo "# Start ComfyUI using the defined paths" >> run_the_server.sh
echo "if ! sudo -u $USER_NAME \$PYTHON_PATH \$COMFYUI_RUNNER_PATH --listen; then" >> run_the_server.sh
echo "    echo \"Error: Failed to start ComfyUI\" >&2" >> run_the_server.sh
echo "fi" >> run_the_server.sh

# Make the script executable
chmod +x run_the_server.sh
cp run_the_server.sh ComfyUI

echo " "
echo " ---------------- custom run_the_server.sh created "
echo " "



SERVICE_FILE_CONTENT="[Unit]
Description=ComfyUI Server

[Service]
Type=simple
ExecStart=${comfy_ui_dir}/run_the_server.sh



[Install]
WantedBy=multi-user.target"

# Create the systemd service file
echo "$SERVICE_FILE_CONTENT" | sudo tee /etc/systemd/system/comfyui.service > /dev/null

# Reload systemd to recognize the new service
sudo systemctl daemon-reload
sudo systemctl enable comfyui.service
sudo systemctl start comfyui.service

echo " "
echo " ---------------- setup completed "
echo " "
echo -e " ---------------- For health check go to this address $(curl -s httpbin.org/ip | jq -r .origin):8188 in your browser"

