FROM archlinux:base-devel

ENV DEV_USER=dev


RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
  git \
  go \
  python

# Create less privileged user
RUN groupadd --gid 1000 ${DEV_USER} \
  && useradd --uid 1000 --gid ${DEV_USER} --shell /bin/bash --create-home ${DEV_USER}

RUN usermod -a -G wheel ${DEV_USER}

RUN echo '%wheel ALL=(ALL:ALL) ALL' >> /etc/sudoers

RUN echo "dev:guest" | chpasswd

RUN echo "${DEV_USER} ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers

USER ${DEV_USER}

WORKDIR /home/${DEV_USER}

RUN git clone https://aur.archlinux.org/yay.git

WORKDIR /home/${DEV_USER}/yay

RUN makepkg -si --noconfirm

WORKDIR /home/${DEV_USER}

RUN rm -rf yay

USER root

COPY mirrorlist /etc/pacman.d/mirrorlist
