FROM nginx:latest

RUN mkdir -p /var/www/html/activebodies
COPY activebodies-master /var/www/html/activebodies
COPY activebodies-master/activebodies.conf /etc/nginx/conf.d/default.conf
COPY activebodies-master/nginx.conf /etc/nginx/nginx.conf
