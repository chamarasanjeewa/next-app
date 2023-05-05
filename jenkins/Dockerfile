FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    curl -s https://api.github.com/repos/docker/compose/releases/latest \
      | grep browser_download_url \
      | grep docker-compose-Linux-x86_64 \
      | cut -d '"' -f 4 \
      | wget -qi - && \
    chmod +x docker-compose-Linux-x86_64 && \
    mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
USER jenkins