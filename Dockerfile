FROM php:8.2-apache

# Instalar extensões necessárias para MySQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Ativar mod_rewrite (já estava no seu)
RUN a2enmod rewrite

# Copiar arquivos do projeto
COPY . /var/www/html/

# Dar permissão (evita erros de escrita em alguns hosts)
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
