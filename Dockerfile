FROM ubuntu
COPY init.sh /
RUN chmod +x /init.sh
RUN  apt-get update \
  && apt-get install -y openssh-server git python3-pip npm zsh tmux curl vim fzf cargo pkg-config locales
RUN pip install IPython
RUN npm install --global http-server wetty prettier
ENV LANG=en_US.UTF-8
RUN sed -i -e "s/# $LANG.*/$LANG UTF-8/" /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=$LANG
EXPOSE 22
CMD [ "/init.sh" ]
