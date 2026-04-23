FROM runpod/worker-comfyui:5.8.5-base

# Install latest Lightricks ComfyUI-LTXVideo nodes
RUN git clone https://github.com/Lightricks/ComfyUI-LTXVideo /comfyui/custom_nodes/ComfyUI-LTXVideo && \
    cd /comfyui/custom_nodes/ComfyUI-LTXVideo && \
    pip install -r requirements.txt

# Install ComfyUI-VideoHelperSuite for audio/video muxing
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    cd /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    pip install -r requirements.txt

# Add extra_model_paths.yaml so ComfyUI finds models on the network volume
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
