# image PHP 7.4 et Apache
FROM php:7.4-apache-bullseye

# Mise à jour système et installation des paquets
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    wget \
    ffmpeg \
    lsb-release

# Installation des extensions
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets

# Installation de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.6.2

COPY . /app
WORKDIR /app

RUN composer install
