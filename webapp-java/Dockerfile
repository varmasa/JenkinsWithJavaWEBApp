FROM tomcat:9.0-jdk17-temurin

# Change only shutdown and HTTP ports
RUN sed -i 's/port="8005"/port="8006"/' /usr/local/tomcat/conf/server.xml && \
    sed -i 's/port="8080"/port="8085"/' /usr/local/tomcat/conf/server.xml
    
# Remove default applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR
COPY target/hello-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose the new HTTP port
EXPOSE 8085

CMD ["catalina.sh", "run"]
