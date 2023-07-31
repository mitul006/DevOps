FROM centos:latest
MAINTAINER MMIITTUULL006@GMAIL.COM  
RUN yum install -y httpd
RUN yum install -y zip
RUN yum install -y unzip -y
WORKDIR /var/www/html
RUN echo "hello" >> index.html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
