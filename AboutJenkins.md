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


## Plugins

- Plugins: Son unidades que extienden a Jenkins
- Download now and install after restart
- Recomendado
  - Jenkins espera a que terminen todos los jobs
  - luego hace las instalaciones
  - Reinicia la máquina
  - No acepta otros trabajos hasta que esté de nuevo disponible

## Cadena de Jobs
Para conectar jobs podemos hacerlo de dos formas, básicamente:

1 - Que un job esté escuchando a otro, y en función de su estado success, fail etc. se ejecute -> (ejemplo de watchers)

2- Desde un job (padre), llamar a explicitamente a otro job (hijo) para esto es necesario agregar un build step de tipo Trigger/call build on other projects esta opcion tiene la potencialidad de que se puede pasar parametros del job padre al hijo

Primero instalamos el plugin Parameterized Trigger, igual cómo instalamos anteriormente y reiniciamos.

Luego vamos a crear 2 jobs nuevos:
watchers: En este job, vamos a "configure" y vamos a “Build after other projects are built” y escribimos y escribimos hello-platzi, sí hello-platzi es successful, quiero que se ejecute watchers.
Y en la parte de executed shell, escribimos: echo “Running after hello-world success” y guardamos.
"parameterized": Acepta parámetros cuando lo llamo. Marcamos la opción “This project is parameterized” y en el name escribimos ROOT_ID.
Y en el execute shell: echo “calle with $ROOT_ID” y guardamos.

Y en hello-world, en Downstream project, y estos se añaden cuando jenkins se da cuenta que su job tiene una dependencia con otro.
Vamos al "configure" de hello-world y en el execute shell escribimos:
echo “Hello world from $NAME”
Y añadir un build step que se llama: “Trigger/call build on other projects”, y en projects to build escribimos parameterized y le damos en añadir parámetros, luego parámetros predefinidos y escribimos:
ROOT_ID=$BUILD_NUMBER
BUILD_NUMBER es una variable de entorno, que es el valor de esta ejecución y guardamos.

Le damos en “build with parameters” y entramos al console output de parameterized y vemos que la ejecución número tal, fue la que ejecutó a parameterized.
Corre hello-platzi, él llama declarativamente a parameterized e indirectamente a watchers.

Corre los test para esta versión, cuando acabes, manda esta versión a producción le pasó el "id" del commit, y se lo pasó a mí job que hace deployment y cuando lo resuelvas me lo despliegas.
El sabe la cadena de ejecuciones que tuvo, y cuál fue el que inició este proceso.
El profe recomienda usar parameterized jobs en vez de watchers, porque cuando uso watchers solo tengo tres opciones mientras que con parameterized jobs tengo más opciones.


## Conectar con github
- Descargar el plugin de GitHub
- Crear un job proyecto GitHub
- Crear el webhook y asociarlo en GitHub

## Pipeline
Pipelines nos permiten configurar nuestros Jobs con código en lugar de hacerlo en la interfaz visual. 
En Jenkins los hay de dos maneras: Scripting y Declarative.

## Slaves
Los Slaves nos permiten correr Jobs distribuidamente. Se conecta al Jenkins master y este le delega trabajos al Slave como si fuese otra máquina.
Permiten escalar horizontalmente.

## Configurar slave

- cat .ssh/id_rsa.pub
- copy key
- Entrar en Jenkins master
- Añadimos usuarios (adduser jenkins) `adduser jenkins` and `apt-get update`
- Instalamos java última versión `apt-get install openjdk-8-jdk wget gnupg git vim`
- Creamos directorio de trabajo master y slave (/var/jenkins) `mkdir /var/jenkins/`
- sudo su jenkins `chown jenkins:jenkins /var/jenkins` and `sudo su jenkins`
- cd $ -> verificamos que exista .ssh sino `mkdir .ssh`
- Creamos archivo -> vim .ssh/authorized_keys `vim .ssh/authorized_keys`
- pegamos la key copiada anteriormente `paste key`
- Posteriormente en la interfaz de jenkins
- Manage jenkins
- Manage node
- New node
  - slave-1
  - description
  - executor similar al número de CPU disponibles
  - labels es para relacionar slaves con jobs que solo quiere se ejecute por ese slave

## Comandos docker

- copiar fichero dentro del contenedor ```docker cp scripts/byTest/hello_script.sh jenkins_php:/opt  ```
- entrar en contenedor como usuario root `docker exec -ti -u root jenkins_php bash`


## Ejecutar los scripts de forma remota por ssh
