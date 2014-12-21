### Set the base image to Fedora
FROM jboss/base-jdk:7

### File Author / Maintainer
MAINTAINER "Bryan Saunders" "bsaunder@redhat.com"

### Copy FSW 6.0.0
ENV HOME /opt/jboss
ADD installs/jboss-fsw-installer-6.0.0.GA-redhat-4.jar $HOME/jboss-fsw-installer-6.0.0.GA-redhat-4.jar
ADD InstallationScript.xml $HOME/InstallationScript.xml
ADD InstallationScript.xml.variables $HOME/InstallationScript.xml.variables

### Set File Permissions for Install Files
USER root
RUN chown jboss:jboss $HOME/jboss-fsw-installer-6.0.0.GA-redhat-4.jar
RUN chown jboss:jboss $HOME/InstallationScript.xml.variables
RUN chown jboss:jboss $HOME/InstallationScript.xml

### Set Environment
ENV JBOSS_HOME /opt/jboss/jboss-eap-6.1
RUN echo '%jboss ALL=(ALL) ALL' >> /etc/sudoers

### Install FSW 6.0.0
USER jboss
RUN java -jar $HOME/jboss-fsw-installer-6.0.0.GA-redhat-4.jar $HOME/InstallationScript.xml -variablefile $HOME/InstallationScript.xml.variables
RUN rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current

### Create EAP User
RUN $JBOSS_HOME/bin/add-user.sh admin admin123! --silent

### Configure EAP
RUN echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

### Open Ports
EXPOSE 22 3306 5432 8080 9990 27017 9999 4447

### Start EAP
ENTRYPOINT $JBOSS_HOME/bin/standalone.sh -c standalone-full-ha.xml

