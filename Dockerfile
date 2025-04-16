FROM lmsysorg/sglang:latest
#CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sleep", "30000000"]
CMD ["python3", "-m", "http.server"]
