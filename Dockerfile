#FROM lmsysorg/sglang:v0.4.5.post1-cu125
#FROM python:3.12
#EXPOSE 8000
#CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sleep", "300000"]
#CMD ["python3", "-m", "http.server", "8000"]




FROM python:3.12-slim

# Create and switch to a non-root user
RUN useradd -m appuser && \
    mkdir -p /app && \
    chown appuser:appuser /app
WORKDIR /app
USER appuser

# Server must listen on 0.0.0.0 (not just localhost)
# Use PORT environment variable (Bubble provides this)
CMD ["sh", "-c", "python -m http.server ${PORT:-8000} --bind 0.0.0.0"]
