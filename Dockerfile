FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y docker.io curl && \
    curl -LO "https://dl.k8s.io/release/v1.32.2/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

# ⚠️ Force docker group GID to match /var/run/docker.sock (GID 0)
RUN groupadd -g 0 docker || true && \
    usermod -aG docker jenkins

USER jenkins




# docker Create docker group matching host’s docker group ID
# Jenkins pipelines are executed by the jenkins user, even when the container starts as root.
# So even if you run the container with -u root, Jenkins spawns agents and shells using the non-root jenkins user.
# That user still doesn’t have permission to access /var/run/docker.sock.


# docker build -t jenkins-with-docker-group-k8s .


# docker run -d \                                    
#   --name jenkins \
#   -u root \
#   -p 8080:8080 -p 50000:50000 \
#   -v jenkins_data:/var/jenkins_home \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   -v $HOME/.kube:/root/.kube \
#   -v /usr/local/bin/kubectl:/usr/local/bin/kubectl \
#   -v /usr/local/bin/docker:/usr/local/bin/docker \
#   jenkins-with-docker-group


#  AFTER adding docker group and kubectl inside DockerFile, below is the new command to run jenkins

# This `docker run` command is creating and running a Docker container based on the image `jenkins-with-docker-group-k8s`. Here is a breakdown of the options used in the command:



# docker run -d \
#   --name jenkins \
#   -p 8080:8080 -p 50000:50000 \
#   -v jenkins_data:/var/jenkins_home \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   -v /usr/local/bin/docker:/usr/local/bin/docker \
#   -v $HOME/.kube:/root/.kube \
#   --user root \
#   jenkins-with-docker-group-k8s
