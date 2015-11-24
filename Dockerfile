FROM quay.io/stacks/base-np
RUN sed 's/^CheckSpace/#CheckSpace/g' -i /etc/pacman.conf &&\
    pacman --noconfirm -Syu radicale-git &&\
    sed 's/^#CheckSpace/CheckSpace/g' -i /etc/pacman.conf
VOLUME ["/data"]
RUN mkdir -p /data ; chown daemon:daemon /data
USER daemon
WORKDIR  /data
ENV HOME /data
EXPOSE 5232
CMD ["radicale", "-C", "/data/config"]
