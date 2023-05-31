## Descripción
### Jenkins es open source y probablemente el software de automatización más usado de todos, escrito en Java y corre en JVM. Es muy conveniente al ser una herramienta extensible al tener un ecosistema de plugins que te permiten extenderlo, puedes escribir tus propios plugins con Java, pero ya la comunidad ha desarrollado un sinfín de ellos.

## Caracteristicas

- Es Open Source
- Escrito en java sobre JVM
- Mayormente se corre en Linux
- Es extensible
- Se puede escribir plugins en java
- La comunidad aporta tanto escribiendo un sin fin de Plugins.
- Jenkins es amigable y flexible por la cantidad de comunidad que tiene.
- Compañias enormes tiene un solo jenkins
- Jenkins puede crecer horizontalmente añadiendo más hardware porque soporta slaves.
- Jenkins es un servicio de automatización.
- CircleCI realiza lo mismo que jenkins.
- Actualmente se puede escribir tu job con código y no solo con la interfaz.


## Instalación

Doc <a href="https://www.jenkins.io/doc/" >Jenkins doc</a> 

` instalación en un servidor`
- sudo apt-get update
- sudo apt-get upgrade
- sudo apt-get install openjdk-8-jdk wget gnupg
- sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
- sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9B7D32F2D50582E6
- sudo apt-get update
- sudo apt-get install git jenkins
- ssh-keygen
- service jenkins start
- service jenkins status
- sudo cat /var/lib/jenkins/secrets/initialAdminPassword

`Instalación por medio de docker`
- Crear un docker-compose.yml como el adjunto

- Después desde un navegador ingresar a http://127.0.0.1:8080/

## Configuración
- entrar en el contenedor (docker exec -it jenkins bash ) y ejecutar 
- ejecutar cat /var/jenkins_home/secrets/initialAdminPassword
- copiar la clave y pegarla en la ventana del navegador
- seleccionar "install suggested plugins"
- Siguiente paso crear el admin-user
  - pass: 12345678
  - user: iportillo
  - email: ipp_1981@hotmail.com

## Crear usuarios
- Se pueden crear nuevos usuarios y asignarles diferentes permisos, esto con el fin de poder saber en todo momento, o auditorías quien hizo que…

- Lo ideal es no compartir mismos usuarios ni misma contraseña.

- La autenticación se puede dar por medio de login con Github o Google, esto con el uso de plugins.

Para crear, eliminar, editar un usuario:
Ir a Manage Jenkins/ Manage Users/ Create user (en caso de crear). Para editar o borrar solo se debe dar clic en user id deseado, después elegir opción Configurar o Borrar


## Jobs
- Lo más importante de Jenkins, los trabajos(Jobs) que ejecuta, puede correr varios de estos a la vez y es controlado por el Build Executor.
- Podemos tener Jobs de diferentes tipos como Freestyle project, Pipeline, folder, Multi-configuration project, etc.
- Cada vez que ocurre una ejecución de un Job se añade un número al Build History y sirve para tener auditorias de cuál trabajo fue el último success o fail.
- Por cada job, Jenkins crea un folder dentro de su workspace (/var/lib/jenkins/workspace/).

![Aquí la descripción de la imagen por si no carga](/Applications/Projects/jenkins/img.png)
<img src="public/image/img.png" width="900" height="300">