FROM centos:latest
MAINTAINER hk98ahr@gmail.com
RUN yum install httpd \
  zip \
 unzip
ADD https://www/free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/ [ ADD <Link-of-free-website> /var/www/html ]
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf __MACOSX markup-kindle kindle.zip
CMD ["/usr/sbin/httpd", "-D", "FOREFROUND"]
EXPOSE 80
