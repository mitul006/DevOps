FROM centos:7
MAINTAINER MMIITTUULL006@GMAIL.COM  
RUN yum install -y httpd /
zip \
unzip
RUN systemctl start httpd
RUN systemctl enable httpd
ADD https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip 2136_kool_form_pack.zip
RUN cp -rvf 2136_kool_form_pack/* .
RUN rm -rvf 2136_kool_form_pack.zip 2136_kool_form_pack
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
