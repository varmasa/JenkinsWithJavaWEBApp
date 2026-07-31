FROM tomcat:9.0-jdk17-temurin

# Change Tomcat ports
RUN sed -i 's/port="8005"/port="8006"/' /usr/local/tomcat/conf/server.xml && \
    sed -i 's/port="8080"/port="8085"/' /usr/local/tomcat/conf/server.xml

# Enable AccessLogValve and send access logs to stdout
RUN sed -i '/<\/Host>/i\
        <Valve className="org.apache.catalina.valves.AccessLogValve"\
        directory="/proc/self/fd"\
        prefix="1"\
        suffix=""\
        fileDateFormat=""\
        rotatable="false"\
        pattern="%h %l %u %t &quot;%r&quot; %s %b %D"/>' \
        /usr/local/tomcat/conf/server.xml

# Remove default applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Download OpenTelemetry Java Agent
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar /opt/opentelemetry-javaagent.jar

# Copy application
COPY target/hello-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Configure Tomcat to load the OpenTelemetry Java Agent
ENV CATALINA_OPTS="-javaagent:/opt/opentelemetry-javaagent.jar"

EXPOSE 8085

CMD ["catalina.sh", "run"]
