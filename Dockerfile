FROM jenkins/jenkins:2.387.2
WORKDIR /home
USER root
RUN curl -L -o jenkins-cli.jar https://github.com/maximilianoPizarro/jenkins-cli/raw/main/jenkins-cli.jar
RUN chmod 777 jenkins-cli.jar
RUN apt update
RUN apt install wget
RUN wget -O- https://raw.githubusercontent.com/maximilianoPizarro/jenkins-cli/main/google-chrome.list > /etc/apt/sources.list.d/google-chrome.list
RUN wget -O- https://dl.google.com/linux/linux_signing_key.pub |gpg --dearmor > /etc/apt/trusted.gpg.d/google.gpg
RUN apt update
RUN apt install google-chrome-stable -y
RUN apt install python -y
RUN apt install pip -y
RUN mkdir jobs
RUN chmod 777 jobs
ENV PATH=$PATH:/.local/bin
USER user
