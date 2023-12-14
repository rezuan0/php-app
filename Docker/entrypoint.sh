#!/bin/bash

# if [ ! -f "vendor/autoload.php" ]; then
#     composer install --no-progress --no-interaction
# fi


php artisan migrate
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan serve --port=8000 --host=0.0.0.0 --env=.env