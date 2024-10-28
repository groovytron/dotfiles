FROM archlinux:base-devel

ENV DEV_USER=dev

COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm python

# Create less privileged user
RUN groupadd --gid 1000 ${DEV_USER} \
  && useradd --uid 1000 --gid ${DEV_USER} --shell /bin/bash --create-home ${DEV_USER}

RUN usermod -a -G wheel ${DEV_USER}

USER root
