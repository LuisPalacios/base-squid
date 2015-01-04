# Introducción

Este repositorio alberga un *contenedor Docker* para montar un Servidor que realice proxy inverso usando "squid", está automatizado en el Registry Hub de Docker [luispa/base-squid](https://registry.hub.docker.com/u/luispa/base-squid/) conectado con el el proyecto en [GitHub base-squid](https://github.com/LuisPalacios/base-squid)

Consulta este [apunte técnico sobre varios servicios en contenedores Docker](http://www.luispa.com/?p=172) para acceder a otros contenedores Docker y sus fuentes en GitHub.

## Ficheros

* **Dockerfile**: Para crear un servidor basado en debian
* **sample**: Directorio con un ejemplo de lo que hay que añadir al principio del squid3.conf para que haga proxy inverso
* **init_squid.py**. Programa que se debe ejecutar al arrancar un contenedor basado en esta imagen

## Instalación de la imagen

Para usar la imagen desde el registry de docker hub

    totobo ~ $ docker pull luispa/base-squid


## Clonar el repositorio

Este es el comando a ejecutar para clonar el repositorio y poder trabajar con él directametne

    totobo ~ $ clone https://github.com/LuisPalacios/docker-squid.git

Luego puedes crear la imagen localmente con el siguiente comando

    $ docker build -t luispa/base-squid ./
