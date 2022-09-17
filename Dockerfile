FROM ubuntu:22.04
MAINTAINER Ben K <ben@sudo.is>

RUN apt-get update -y && \
        apt-get install -y playonlinux && \
        dpkg --add-architecture i386 && \
        apt-get update && \
        apt-get install -y wine32 && \
        apt-get autoremove && \
        apt-get clean && \
        rm -rf /tmp/*

ARG UID=1000
ARG USER_NAME=player
RUN useradd -u ${UID} -G video,adm,sudo -ms /bin/bash ${USER_NAME}

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

ENV USER ${USER_NAME}
ENV HOME /home/${USER_NAME}

ENTRYPOINT ["playonlinux"]
CMD []
