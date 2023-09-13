Creación de una maquina virtual

- Crear directorio y fichero dockerfile
- en la carpeta ráiz del proyecto generar llaves ssh
  - `ssh-keygen -f remote-key`
- conectarse a la máquina:
  - `ssh name_user@name_hot`
  - mediante la clave que con anterioridad hemos copiado dentro del contendor `docker cp Server/remote-key jenkins_php:/tmp `
  - `ssh -i /tmp/remote-key remote_user@remote_host`
- Instalar plugin ssh en la interfaz de jenkins
  - Instalar ssh plugin
  - Añadir credenciales en administrar jenkins / credenciales
  - Añadir servicio ssh en administrar jenkins / sistemas

- Ejecutar jobs por ssh
  - 