FROM httpd:latest
 
MAINTAINER Raymond
LABEL Remarks="Simple webpage with httpd for Not bad ltd"
 
# Install httpd with less
RUN yum -y update && \
yum -y install httpd && \
systemctl start httpd && \
systemctl enable httpd && \
yum clean all
 
# Sample index.html for test 
COPY index.html /usr/local/httpd/htdocs/
 
# Port and set entry point for container 
EXPOSE 80
