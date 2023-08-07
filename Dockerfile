FROM centos:7
MAINTAINER MMIITTUULL006@GMAIL.COM  
RUN yum install -y apache2
RUN systemctl start apache2
RUN systemctl enable apache2
RUN echo "hello " >> /var/www/html/index.html
WORKDIR /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
