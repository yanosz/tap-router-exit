#!/bin/bash

# Ansible generated file - Role: tap-router-exit.

# this is example notify script that can be invoked on a server side
# This script will be called by dibbler-server with a single parameter
# describing operation (add, update, delete, expire)
#
# Many parameters will be passed as environment variables

LOGFILE=/var/log/dibbler-delegate.log

date >> $LOGFILE

# uncomment this to get full list of available variables

echo "Prefix ${PREFIX1} (operation $1) to client $REMOTE_ADDR on inteface $IFACE/$IFINDEX" >> $LOGFILE

case $1 in
  add)
     ip -6 route replace $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE
     ip -6 route replace $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE table 66
     ;;
  update)
     ip -6 route replace $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE
     ip -6 route replace $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE table 66
    ;;
  delete)
     ip -6 route del $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE
     ip -6 route del $PREFIX1/$PREFIX1LEN via $REMOTE_ADDR dev $IFACE table 66
    ;;
  *)
    echo "Unkown Operation $1" >> $LOGFILE
    ;;
esac

exit 0;
