FROM ubuntu

ARG USER
ENV USER ${USER:-docker}

RUN groupadd -g 60310 docker && \
      useradd -g 60310 -l -m -u 61000 $USER && \
      apt-get update && \
      apt-get -y install sudo zsh git curl locales && \
      locale-gen en_US.UTF-8 && \
      echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers && \
      echo 'Set disable_coredump false' >> /etc/sudo.conf && \
      rm -rf /var/cache/*

USER $USER

WORKDIR /home/$USER
CMD ["/bin/zsh", "--login"]
