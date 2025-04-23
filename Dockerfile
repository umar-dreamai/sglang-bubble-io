FROM lmsysorg/sglang:latest
EXPOSE 30000
CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "30000"]


# #docker run --gpus all \
# docker run  \
#     --shm-size 32g \
#     -p 30000:30000 \
#     -v ~/.cache/huggingface:/root/.cache/huggingface \
#     --env HF_TOKEN="secret" \
#     --env CUDA_VISIBLE_DEVICES="-1" \
#     --ipc=host \
#     lmsysorg/sglang:latest \
#     python3 -m sglang.launch_server --model-path meta-llama/Llama-3.1-8B-Instruct --host 0.0.0.0 --port 30000
