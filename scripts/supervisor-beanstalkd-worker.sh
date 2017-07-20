#!/usr/bin/env bash

worker="[program:worker-1]
command=php /home/vagrant/app/ra/artisan queue:work beanstalkd --sleep=10 --daemon --quiet --env=production --queue="default"

autostart=true
autorestart=true
user=vagrant
redirect_stderr=true
stdout_logfile=/home/vagrant/app/worker-1.log
"

echo "$worker" > "/etc/supervisor/conf.d/worker-1.conf"
sudo supervisorctl restart all
