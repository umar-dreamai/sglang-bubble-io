#FROM lmsysorg/sglang:v0.4.5.post1-cu125
#FROM python:3.12
#EXPOSE 8000
#CMD ["python3", "-m", "sglang.launch_server", "--model-path", "meta-llama/Llama-3.1-8B-Instruct", "--host", "0.0.0.0", "--port", "8000"]
#CMD ["sleep", "300000"]
#CMD ["python3", "-m", "http.server", "8000"]


FROM nginx:1.25-alpine

# 1. Create healthcheck endpoint
RUN echo "OK" > /usr/share/nginx/html/healthcheck

# 2. Override default config with healthcheck endpoint
RUN echo 'server { \
    listen 80; \
    location = /healthcheck { \
      return 200 "OK"; \
      add_header Content-Type text/plain; \
    } \
    location / { \
      root /usr/share/nginx/html; \
    } \
  }' > /etc/nginx/conf.d/default.conf

# 3. Container-level health verification
HEALTHCHECK --interval=5s --timeout=3s \
  CMD curl -f http://localhost/healthcheck || exit 1

EXPOSE 80
