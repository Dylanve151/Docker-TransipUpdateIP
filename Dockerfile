FROM debian
RUN apt-get update && apt-get install -y \
  php \
  php-json \
  openssl \
  composer \
  cron \
  dnsutils \
  && apt-get clean
RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');" && \
php -r "if (hash_file('sha384', '/tmp/composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('/tmp/composer-setup.php'); } echo PHP_EOL;" && \
php /tmp/composer-setup.php --install-dir /usr/bin --filename composer && \
php -r "unlink('/tmp/composer-setup.php');" && \
composer self-update --2
WORKDIR /root/api
RUN composer init --name 'transip/api' --description 'Transip API' --require 'transip/transip-api-php:^6' -n && \
composer install
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /verbs
ENV domainName domainname
ENV dnsEntryNames *
ENV dnsEntryExpire 300
ENV dnsEntryType A
ENV TransipUsername user
ENV WhitelistIPonly false
ENV PrivateKey privatekey
COPY addcronjob.bash ..
COPY startup.sh ..
COPY Authenticate.php .
COPY UpdateDNSentry.php .
RUN touch log.log
RUN chmod 755 /root/startup.sh
RUN chmod 755 /root/addcronjob.bash
RUN chmod 755 *.php
RUN chmod 755 *.sh
CMD [ "/root/startup.sh" ]
