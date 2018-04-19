FROM vinaocruz/php-7

RUN apt-get update && apt-get install autoconf pkg-config libssl-dev -y \
    && pecl channel-update pecl.php.net && pecl install channel://pecl.php.net/geospatial-0.2.0 \
    && pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)\n" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on\n" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off\n" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9001\n" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN rm -rf /tmp/pear

USER www-data
