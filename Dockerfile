FROM openjdk:8-jdk-alpine

WORKDIR /opt/payara
ENV INSTALL_DIR /opt/payara
ENV PAYARA_ARCHIVE payara-micro.jar

RUN mkdir -p $INSTALL_DIR/deployments2 && \
 mkdir -p $INSTALL_DIR/microdomain && \
 apk update && \
 apk add curl
 
ENV PAYARA_PKG "https://search.maven.org/remotecontent?filepath=fish/payara/extras/payara-micro/5.184/payara-micro-5.184.jar"

#download payara-micro to folder
RUN curl -o $INSTALL_DIR/$PAYARA_ARCHIVE $PAYARA_PKG

ENV PAYARA_HOME ${INSTALL_DIR}
ENV DEPLOYMENT_DIR ${PAYARA_HOME}

ENV DEPLOY_DIR $INSTALL_DIR/deployments2

# war to directory
COPY target/bankservice.war $DEPLOY_DIR
COPY postboot.txt $DEPLOY_DIR

EXPOSE 8080

CMD ["java", "-jar", "payara-micro.jar", \
     "--postbootcommandfile", "deployments2/postboot.txt", \
	 "--deploy", "deployments2/bankservice.war"]
