FROM nginx:latest

RUN mkdir -p /var/www/html/activebodies
COPY html /var/www/html/activebodies
COPY activebodies.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
