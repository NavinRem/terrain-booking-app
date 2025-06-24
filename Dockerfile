FROM php:8.2-fpm

# Install required packages
RUN apt-get update && apt-get install -y \
    nginx \
    git \
    unzip \
    zip \
    curl \
    openssh-server \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip bcmath

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy Laravel app (assuming you already cloned it)
COPY . /var/www/html

WORKDIR /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Copy default nginx config
COPY nginx-default.conf /etc/nginx/sites-available/default

# Start script to run both PHP and NGINX
COPY docker-start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
