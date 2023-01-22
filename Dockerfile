FROM ubuntu
COPY init.sh /
RUN chmod +x /init.sh
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y git
RUN apt-get install -y npm
RUN apt-get install -y zsh
RUN apt-get install -y tmux
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN npm install --global http-server
RUN service ssh start
EXPOSE 22

CMD [ "/init.sh" ]
