FROM php:7.4-apache

# Install composer for PHP dependencies
#RUN cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

MAINTAINER Michael Chiumya <michaelchiumya@gmail.com>

# disable interactive functions.
ENV DEBIAN_FRONTEND noninteractive

COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
#COPY start-apache /usr/local/bin
RUN a2enmod rewrite
#RUN service apache2 restart

# Copy application source
COPY www /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]




