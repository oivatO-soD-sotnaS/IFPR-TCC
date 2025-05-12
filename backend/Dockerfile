FROM omegapeixe/tcc-intellecta:backend-1.1

WORKDIR /var/www/api.intellecta

# habilita o mod_rewrite do apache
RUN a2enmod rewrite
# Copia os arquivos do fileserver
COPY ./files /var/www/files.intellecta
# Copia as dependências do composer
COPY ./api/composer.json ./api/composer.lock* /var/www/api.intellecta/
# Instala as dependências do composer
RUN composer install --no-interaction --prefer-dist --optimize-autoloader
# Copia o resto da aplicação para o container
COPY ./api /var/www/api.intellecta

EXPOSE 80