FROM debian:11-slim

# Instalar apenas os pacotes necessários
RUN apt-get update && apt-get install -y --no-install-recommends \
      chromium \
      chromium-driver \
      python3 \
      python3-pip \
      python3-selenium && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar o script principal para o container
COPY main.py .

# Definir o ponto de entrada do container
ENTRYPOINT ["python3", "main.py"]