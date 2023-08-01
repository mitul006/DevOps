FROM centos:7
MAINTAINER MMIITTUULL006@GMAIL.COM  
RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* . 
RUN rm -rf __MACOSX markups-kindle.zip
RUN rm -rvf /var/www/html/kindle.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
