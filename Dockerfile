FROM ubuntu:16.04
RUN \
 apt-get update && \
 apt-get install -yq \
  apache2 \
  libapache2-mod-php \
  php-mysql \
  php-xml \
  unzip \
 && \
 rm -rf /var/lib/apt/lists/* && \
 rm -rf /app
ADD https://download.revive-adserver.com/revive-adserver-4.1.0.zip /app/revive-adserver.zip
RUN \
 cd /app && \
 unzip revive-adserver.zip && \
 mv ./revive-adserver-*/* /var/www/html/ && \
 rm -f /var/www/html/index.html && \
 chown -R www-data:www-data /var/www/html
CMD /usr/sbin/apache2ctl -D FOREGROUND
