#FROM lmsysorg/sglang:v0.4.5.post1-cu125
#FROM python:3.12
#FROM python:3.12
#EXPOSE 8000
#CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sleep", "3000000"]
#CMD ["python3", "-m", "http.server", "8000"]




FROM lmsysorg/sglang:v0.4.5.post1-cu125 AS builder

# Install only essentials
RUN pip install --no-cache-dir torch transformers

# Copy only necessary files (use .dockerignore)
COPY ./app /app

# Switch to a smaller runtime image if possible (e.g., Alpine)
FROM python:3.12-slim
COPY --from=builder /app /app
EXPOSE 8000
CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct"]
