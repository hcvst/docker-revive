FROM ubuntu:trusty
RUN \
 apt-get update && \
 apt-get install -yq \
  apache2 \
  libapache2-mod-php5 \
  mysql-server \
  php5-mysql \
  pwgen \
  php-apc \
  php5-mcrypt \
  unzip \
 && \
 rm -rf /var/lib/apt/lists/* && \
 rm -rf /app
ADD http://download.revive-adserver.com/revive-adserver-3.1.0.zip /app/
RUN \
 cd /app && \
 unzip revive-adserver-3.1.0.zip && \
 mv ./revive-adserver-3.1.0/* /var/www/html/ && \
 rm -f /var/www/html/index.html && \
 chown -R www-data:www-data /var/www/html
CMD /usr/sbin/apache2ctl -D FOREGROUND
