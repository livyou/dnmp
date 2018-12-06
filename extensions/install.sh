#!/bin/bash

echo "============================================"
echo "Building extensions for $PHP_VERSION"
echo "============================================"


function phpVersion() {
    [[ ${PHP_VERSION} =~ ^([0-9]+)\.([0-9]+)\.([0-9]+) ]]
    num1=${BASH_REMATCH[1]}
    num2=${BASH_REMATCH[2]}
    num3=${BASH_REMATCH[3]}
    echo $[ $num1 * 10000 + $num2 * 100 + $num3 ]
}


version=$(phpVersion)
cd /tmp/extensions


# Use multicore compilation if php version greater than 5.4
if [ ${version} -ge 50600 ]; then
    export mc="-j$(nproc)";
fi


# Mcrypt was DEPRECATED in PHP 7.1.0, and REMOVED in PHP 7.2.0.
if [ ${version} -lt 70200 ]; then
    apt install -y libmcrypt-dev \
    && docker-php-ext-install $mc mcrypt
fi


if [ "${PHP_REDIS}" != "false" ]; then
    mkdir redis \
    && tar -xf redis-${PHP_REDIS}.tgz -C redis --strip-components=1 \
    && ( cd redis && phpize && ./configure && make $mc && make install ) \
    && docker-php-ext-enable redis
fi


# swoole require PHP version 5.5 or later.
if [ "${PHP_SWOOLE}" != "false" ]; then
    mkdir swoole \
    && tar -zxf swoole-${PHP_SWOOLE}.tar.gz -C swoole --strip-components=1 \
    && ( cd swoole && phpize && ./configure && make $mc && make install ) \
    && docker-php-ext-enable swoole
fi

if [ "${PHP_YAF}" != "false" ]; then
    mkdir yaf \
    && tar -xf yaf-${PHP_YAF}.tgz -C yaf --strip-components=1 \
    && ( cd yaf && phpize && ./configure && make $mc && make install ) \
    && docker-php-ext-enable yaf
fi
