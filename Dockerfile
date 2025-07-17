FROM ubuntu:24.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl npm unzip p7zip-full p7zip-rar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /files && \
    mkdir -p /app
COPY DevOps /files/DevOps

RUN TERM=xterm bash -c "$(curl -fsSL https://php.new/install/linux/8.4)" -- --yes

RUN echo '#!/bin/bash' > /entrypoint.sh && \
    echo "export PATH='/root/.config/herd-lite/bin:$PATH'" >> /entrypoint.sh && \
    echo "export PHP_INI_SCAN_DIR='/root/.config/herd-lite/bin:$PHP_INI_SCAN_DIR'" >> /entrypoint.sh && \
    echo "/root/.config/herd-lite/bin/laravel new laravel-project" >> /entrypoint.sh && \
    echo "cp -r /files/DevOps /app/" >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

WORKDIR /app
CMD ["/bin/bash", "/entrypoint.sh"]
