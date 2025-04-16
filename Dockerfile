#FROM lmsysorg/sglang:v0.4.5.post1-cu125
FROM python:3.12

EXPOSE 8000

#CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "8000"]
CMD ["sleep", "300000"]
#CMD ["python3", "-m", "http.server", "8000"]
