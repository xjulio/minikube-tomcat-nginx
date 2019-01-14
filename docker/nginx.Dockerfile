FROM nginx:latest
LABEL author="xjulio@gmial.com"
LABEL version="1.0"
RUN echo "hello world" > /usr/share/nginx/html/index.html
