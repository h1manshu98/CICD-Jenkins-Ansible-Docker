FROM centos:latest
MAINTAINER hk98ahr@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN cd
RUN yum install httpd -y \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page282/metal.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip metal.zip
RUN cp -rvf metal-html/* .
RUN rm -rf metal-html metal.zip
ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
EXPOSE 80 
