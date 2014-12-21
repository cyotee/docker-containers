### Set the base image to Fedora
FROM fedora:21

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Install Base Software
RUN yum install -y java-1.8.0-openjdk; yum clean all
RUN yum install -y unzip; yum clean all

### Install EAP 6.2.0
ADD installs/jboss-eap-6.2.0.zip /tmp/jboss-eap-6.2.0.zip
WORKDIR /opt
RUN unzip /tmp/jboss-eap-6.2.0.zip

### Set Environment
ENV EAP_HOME /opt/jboss-eap-6.2

### Create EAP User
RUN /opt/jboss-eap-6.2/bin/add-user.sh admin admin123! --silent

### Configure EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> /opt/jboss-eap-6.2/bin/standalone.conf

### Open Ports
EXPOSE 8080 8787 9990 9999

### Start EAP
ENTRYPOINT /opt/jboss-eap-6.2/bin/standalone.sh -c standalone-full-ha.xml

