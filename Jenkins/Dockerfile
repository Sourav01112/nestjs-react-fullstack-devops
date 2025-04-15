FROM node:20

USER root

RUN apt-get update && \
    apt-get install -y docker.io git openjdk-17-jdk curl && \
    apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

  
USER node

#  named node-java-dev context for jenkins pipeline for OWASP, sonarqube
