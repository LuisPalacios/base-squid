#
# Squid container by Luispa, Nov 2014
#
# -----------------------------------------------------
#

# Desde donde parto...
#
FROM debian:latest

#
MAINTAINER Luis Palacios <luis@luispa.com>

# Pido que el frontend de Debian no sea interactivo
ENV DEBIAN_FRONTEND noninteractive

# Actualizo e instalo
RUN apt-get update && \
    apt-get -y install locales        \
                       sudo           \
                       squid3         \
                       python

#                      openssh-server \
                              
# Preparo locales
#
RUN locale-gen es_ES.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Preparo el timezone para Madrid
#
RUN echo "Europe/Madrid" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

# Permito que root pueda entrar mientras hago pruebas
#
#RUN echo 'root:docker2014' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#RUN mkdir /var/run/sshd

# Set the cache directory
#
RUN echo "maximum_object_size 1024 MB" >> /etc/squid3/squid.conf
RUN echo "cache_dir ufs /var/cache/squid3 5000 16 256" >> /etc/squid3/squid.conf

# Create and change permissions (cache directory)
#
RUN mkdir -p /var/cache/squid3
RUN chown -R proxy:proxy /var/cache/squid3

# Copio el comando que se debe ejecutar al arrancar
#
ADD init_squid.py /init_squid.py
RUN chmod +x /init_squid.py
