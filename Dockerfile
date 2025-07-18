FROM php:8.4-cli-alpine

# Install Alpine dependencies
RUN apk add --no-cache \
    curl \
    npm \
    unzip \
    bash \
    git

# Set up folders
RUN mkdir -p /files /app
COPY DevOps /files/DevOps

# Install Laravel globally
RUN curl -s https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer global require laravel/installer && \
    ln -s /root/.composer/vendor/bin/laravel /usr/local/bin/laravel

# Entry script
RUN echo '#!/bin/sh' > /entrypoint.sh && \
    echo "laravel new laravel-project" >> /entrypoint.sh && \
    echo "cp -r /files/DevOps /app/" >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

WORKDIR /app
CMD ["/entrypoint.sh"]
