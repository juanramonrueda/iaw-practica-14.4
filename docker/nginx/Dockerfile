# Uso de Nginx como base para el contenedor
FROM nginx:latest

# Segunda capa del contenedor, para actualizar e instalar GIT
RUN apt update && apt install git -y 

# Tercera capa del contenedor, clona el directorio y lo mueve al directorio de Nginx
RUN git clone https://github.com/josejuansanchez/2048.git /tmp/2048 \
    && mv /tmp/2048/* /usr/share/nginx/html

# Exposición del puerto 80 del contenedor, opcional
EXPOSE 80

# Comando que se va a ejecutar en el contenedor
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]