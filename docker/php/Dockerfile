FROM php:8.3-fpm-alpine

LABEL MAINTAINER="TienHM" \
      "GitHub Link"="https://github.com/tienhm8" \
      "PHP Version"="8.3" \
      "Alpine Linux Version"="3.20"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install uploadprogress \
    && docker-php-ext-enable uploadprogress \
    # Install apcu
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    # Config GD
    # && docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/ \
    && apk del .build-deps $PHPIZE_DEPS \
    && chmod uga+x /usr/local/bin/install-php-extensions && sync \
    && install-php-extensions bcmath \
            bz2 \
            calendar \
            curl \
            exif \
            fileinfo \
            ftp \
            # Install GD
            gd \
            gettext \
            # Install Imagemagick
            imagick \
            imap \
            intl \
            ldap \
            mbstring \
            # Install mcrypt
            mcrypt \
            memcached \
            mongodb \
            mysqli \
            # Install OpCache
            opcache \
            # Install Xdebug
            xdebug \
            openssl \
            pdo \
            pdo_mysql \
            redis \
            soap \
            sodium \
            sysvsem \
            sysvshm \
            xmlrpc \
            xsl \
            zip \
    && cd ~ \
    # modify www-data user to have id 1000
    && apk add \
    --no-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
    --virtual .shadow-deps \
    shadow \
    && usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && apk del .shadow-deps

# Config xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Set working directory
WORKDIR /var/www/html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
