FROM php:8.2-apache

# Instala extensões necessárias
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Ativa o mod_rewrite do Apache
RUN a2enmod rewrite

# Copia os arquivos do projeto
COPY . /var/www/html/

# Ajusta permissões (opcional, mas recomendado)
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
