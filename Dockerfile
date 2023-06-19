# Imagen base
FROM wordpress:latest

# Instalar paquetes adicionales
RUN apt-get update && \
    apt-get install -y nginx


# Copiar archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/conf.d/
#variables#
ENV WORDPRESS_DB_HOST databasewordpress-instance-1.cdufmw0hwyde.us-east-1.rds.amazonaws.com
ENV WORDPRESS_DB_USER admin 
ENV WORDPRESS_DB_PASSWORD Duoc.2022 
ENV WORDPRESS_DB_NAME nginx
ENV WORDPRESS_TABLE_PREFIX wp_
# Exponer el puerto HTTP
EXPOSE 80

# Comando para iniciar Nginx y el servidor web de WordPress al ejecutar el contenedor
CMD ["apache2-foreground"]
