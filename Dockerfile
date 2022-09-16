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
ARG USERNAME=player
RUN useradd -u ${UID} -G video,adm,sudo -ms /bin/bash ${USERNAME}

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENV USER ${USERNAME}
ENV HOME /home/${USERNAME}

ENTRYPOINT ["playonlinux"]
CMD []
