# Imagen base
FROM wordpress:latest

# Instalar paquetes adicionales
RUN apt-get update && \
    apt-get install -y nginx


# Copiar archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/conf.d/

# Exponer el puerto HTTP
EXPOSE 80

# Comando para iniciar Nginx y el servidor web de WordPress al ejecutar el contenedor
CMD ["apache2-foreground"]
