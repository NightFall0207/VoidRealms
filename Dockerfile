FROM php:8.2-apache

# Instala as dependências necessárias do MySQL
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libpng-dev \
    libonig-dev \
    libzip-dev \
    zip \
    unzip

# Instala a extensão PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Ativar mod_rewrite
RUN a2enmod rewrite

# Copiar arquivos do projeto
COPY . /var/www/html/

# Permissões
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
