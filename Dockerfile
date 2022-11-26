FROM ubuntu:18.04

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

RUN apt-get -y update \
    && apt-get -y install cmake python python-mako libnetcdf-dev libnetcdff-dev libmpich-dev libtool autoconf

COPY ./trunk /opt/trunk

RUN cd /opt/trunk \
    && ./autogen.sh \
    && ./configure --with-netcdf --with-mpi FCFLAGS=-I/usr/include \
    && make \
    && make install \
    && rm -rf /opt/trunk

RUN useradd -ms /bin/bash xbeach
USER xbeach
WORKDIR /mnt

CMD ["/bin/bash"]
