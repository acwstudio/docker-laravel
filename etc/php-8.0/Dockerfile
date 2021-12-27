FROM php:8.0-fpm-alpine

WORKDIR /var/www/html

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache \
    coreutils \
    gettext \
    php8-fpm \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-gd \
    php8-iconv \
    php8-json \
    php8-intl \
    php8-fileinfo\
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-mysqli \
    php8-xml \
    php8-xsl \
    php8-zlib \
    php8-phar \
    php8-tokenizer \
    php8-session \
    php8-simplexml \
    php8-zip \
    php8-xmlwriter \
    php8-sodium \
    php8-pecl-apcu \
    php8-redis \
    php8-pcntl \
    php8-exif \
    php8-sockets \
    make \
    nano \
    curl

# Enable php8-xdebug if $PHP_XDEBUG_MODE is not empty
#ARG PHP_XDEBUG_MODE=off
#ARG PHP_XDEBUG_CLIENT_PORT=5902
#ARG PHP_XDEBUG_CLIENT_HOST=host.docker.internal
#COPY xdebug.ini  /etc/php8/conf.d/xdebug.ini.template
#RUN if [[ "$PHP_XDEBUG_MODE" != "" ]]; then \
#        apk add --no-cache php8-pecl-xdebug; \
#        export PHP_XDEBUG_MODE=$PHP_XDEBUG_MODE; \
#        export PHP_XDEBUG_CLIENT_PORT=$PHP_XDEBUG_CLIENT_PORT; \
#        export PHP_XDEBUG_CLIENT_HOST=$PHP_XDEBUG_CLIENT_HOST; \
#        envsubst < /etc/php8/conf.d/xdebug.ini.template > /etc/php8/conf.d/xdebug.ini; \
#    fi
#RUN rm -f /etc/php8/conf.d/xdebug.ini.template

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd xdebug pdo_mysql sockets exif pcntl redis imagick

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apk add --update nodejs npm \
    && npm install --global yarn

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
RUN apk add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# Change current user to www
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000

# Run php-fpm
CMD ["php-fpm"]