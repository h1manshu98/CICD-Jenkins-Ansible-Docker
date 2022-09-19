FROM centos:latest
MAINTAINER hk98ahr@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page280/sungla.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip sungla.zip
RUN cp -rvf html/* .
RUN rm -rf html sungla.zip
CMD ["/usr/sbin/httpd", "-D", "FOREFROUND"]
EXPOSE 80
