FROM centos:7
MAINTAINER MMIITTUULL006@GMAIL.COM  
RUN yum install -y httpd
RUN systemctl start httpd
RUN systemctl enable httpd
RUN echo "hello " >> /var/www/html/index.html
WORKDIR /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
