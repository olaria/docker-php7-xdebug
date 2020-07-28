FROM olaria/php7:7.4-alpine

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

ENV XDEBUG_INI_DIR /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=on" >> $XDEBUG_INI_DIR \
    && echo "xdebug.remote_autostart=off" >> $XDEBUG_INI_DIR \
    && echo "xdebug.remote_port=9001" >> $XDEBUG_INI_DIR