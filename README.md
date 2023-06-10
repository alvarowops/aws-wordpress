Contenedor con Wordpress y Base de datos aurora(MySQL compatible)

#clonar repositorio github#

git clone https://github.com/alvarowops/ev2-3-alvaronavarro.git

#ir a la carpeta del repo#

cd ev2-3-alvaronavarro/

#empaquetizar el contenedor y crear imagen#

docker build -t nombreimagen .

#antes de correr el contenedor debemos ir al grupo de seguridad de la instancia y editar reglas de entrada#

1. agregar tcp puerto 80 en origen elegir anywhere ipv4

#correr contenedor en --name= podemos elegir el nombre a eleccion#

docker run -d -p 80:80 --name=nombrecontenedor nombreimagen

#crear base de datos aurora es igual a mysql solo que de amazon#

1. Ir a Amazon RDS

2. Hacer click en crear base de datos

3. Seleccionar Creación estándar

4. en tipo de motor seleccionar Aurora(MySQL Compatible)

5. En plantillas elegir desarrollo y pruebas

6. Identificador del clúster de base de datos debemos escribir un nombre a eleccion 

7. En credenciales elegir el nombre de usuario maestro(como es test dejaremos admin)

8. Contraseña maestra elegir una  debe tener al menos 8 caracteres(esto se utilizara para conectarnos a la bd luego)

9. En Cluster storage configuration elegir Aurora Standard(esto es para los costos bajos)

10. En Configuración de la instancia elegir Clases con ráfagas e elegir la que consideremos apropiada la small es una bd con 2GB de memoria algo para un sitio estandar con no tanto requisito o flujo de usuario

11. En Disponibilidad y durabilidad si deseo crear algo resilente a fallos elegir crear nodo si no es el caso y es solo test elegir No crear una péplica de Aurora

12. En Conectividad elegir Conectarse a un recurso informático de EC2 esto es para establecer una conexion interna con nuestra instancia ec2 con el contenedor(todas las demas opciones dejar por defecto)

13. En Autenticación de bases de datos elegir Autenticación con contraseña

14. dejar todo lo demas por defecto y hacer click en crear base de datos

#instalar mysql en server ec2 para usar comandos mysql#

sudo yum install mariadb105-server-utils.x86_64

#conectarse a mysql aurora para dar privilegios al usuario en esa bd que creamos#

mysql -h puntodeconexioninstancia -P 3306 -u admin -p

#mostrar bd#

show databases;

#dar privilegios al usuario admin en la bd#

GRANT ALL PRIVILEGES ON wordpress.* TO admin

"confirmar los cambios de privilegios#

FLUSH PRIVILEGES;

#conectar la base de datos con contenedor abrimos la pagina de wordpress con la ip publica de nuestro servidor ec2 donde esta el docker y añadir puerto 80 al final la URL deberia quedar asi ippublica:80#

1. elegir idioma de instalacion

2. dar los strings de conexiones que solicita wordpress

3. nombre de bd se saca con los pasos anteriores 

4. nombre de usuario es el usuario maestro entonces es admin y su password

5. necesitamos cambiar locahost por el punto de conexión de la instancia de base de datos

6. nos dirigimos a amazon RDS y en bases de datos seleccionamos la instancia

7. en el punto de enlace y puerto copiamos solo el punto de enlace que es algo asi nombreinstancia.cdufmw0hwyde.us-east-1.rds.amazonaws.com

# se instalo wordpress de manera correcta#


