FROM ubuntu
COPY init.sh /
RUN chmod +x /init.sh
RUN  apt-get update \
  && apt-get install -y openssh-server git npm zsh tmux curl vim
RUN npm install --global http-server
RUN service ssh start
EXPOSE 22
CMD [ "/init.sh" ]
