FROM ubuntu
COPY init.sh /
RUN chmod +x /init.sh
RUN  apt-get update \
  && apt-get install -y openssh-server git python3-pip npm zsh tmux curl vim fzf
RUN npm install --global http-server
RUN service ssh start
EXPOSE 22
CMD [ "/init.sh" ]
