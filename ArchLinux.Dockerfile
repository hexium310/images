FROM archlinux

ARG USER
ENV USER ${USER:-docker}

RUN groupadd -g 60310 docker && \
      useradd -g 60310 -l -m -u 61000 $USER && \
      pacman -Syu --noconfirm && pacman -S --noconfirm sudo zsh git && \
      echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers && \
      echo 'Set disable_coredump false' >> /etc/sudo.conf && \
      rm -rf /var/cache/*

USER $USER

WORKDIR /home/$USER
CMD ["/bin/zsh", "--login"]
