#!/bin/sh

# Start PHP-FPM
php-fpm &

# Start Supervisor
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
