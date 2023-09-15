FROM httpd:2.4
 
# Sample index.html for test 
COPY index.html /usr/local/httpd/htdocs/
 
# Port and set entry point for container 
EXPOSE 80
