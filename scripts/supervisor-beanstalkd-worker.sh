#!/usr/bin/env bash

worker="[program:worker-1]
command=php /home/vagrant/app/ra/artisan queue:work beanstalkd --sleep=10 --daemon --quiet --tries=3 --env=production --queue="default"

process_name=%(program_name)s_%(process_num)02d
startsecs=0
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=vagrant
numprocs=2
redirect_stderr=true
stdout_logfile=/home/vagrant/app/worker-1.log
"

echo "$worker" > "/etc/supervisor/conf.d/worker-1.conf"
sudo supervisorctl restart all
