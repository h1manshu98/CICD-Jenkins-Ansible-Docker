FROM centos:latest
MAINTAINER hk98ahr@gmail.com
RUN yum install httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/sungla.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip sungla.zip
RUN cp -rvf html/* .
CMD ["/usr/sbin/httpd", "-D", "FOREFROUND"]
EXPOSE 80
