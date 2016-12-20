#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

cat > /etc/php/7.1/mods-available/xdebug.ini << EOF
zend_extension=xdebug.so
xdebug.remote_enable=on
xdebug.remote_autostart=off
xdebug.remote_port=9000
xdebug.remote_connect_back=On
xdebug.remote_handler=dbgp
EOF

ln -s /etc/php/7.1/mods-available/xdebug.ini /etc/php/7.1/cli/conf.d/20-xdebug.ini
