FROM php:5.6.24-fpm-alpine

ENV APCU_VERSION 4.0.11
ENV MEMCACHED_VERSION 2.2.0

RUN apk upgrade --update && apk add \

      freetype-dev \
      libjpeg-turbo-dev \
      libmcrypt-dev \
      libmemcached-dev \
      libpng-dev \
      openssl-dev \
      zlib-dev \

      && docker-php-source extract \
      
      && pecl bundle -d /usr/src/php/ext apcu-$APCU_VERSION \
      && pecl bundle -d /usr/src/php/ext memcached-$MEMCACHED_VERSION \
      
      && docker-php-ext-configure apcu \
      && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
      && docker-php-ext-configure memcached --disable-memcached-sasl \

      && docker-php-ext-install \
        apcu \
        ctype \
        curl \
        dom \
        gd \
        iconv \
        json \
        mcrypt \
        memcached \
        mysql \
        openssl \
        pdo \
        pdo_mysql \
        pdo_sqlite \
        phar \
        sqlite3 \
        xml \
        zip \

      && docker-php-source delete \

      && rm -rf /tmp/pear \
      && rm -rf /var/cache/apk/*
