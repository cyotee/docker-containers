### Set the base image to Fedora
FROM jboss/base-jdk:7

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install EAP 6.1.1
ADD installs/jboss-eap-6.1.1.zip /tmp/jboss-eap-6.1.1.zip
RUN unzip /tmp/jboss-eap-6.1.1.zip

### Set Environment
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.1

### Create EAP User
RUN $JBOSS_HOME/bin/add-user.sh admin admin123! --silent

### Configure EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

### Open Ports
EXPOSE 8080 9990 9999

### Start EAP
ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-full-ha.xml

