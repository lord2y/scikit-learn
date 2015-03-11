#!/bin/bash

IPYTHON="/home/vagrant/anaconda/bin/ipython"
set -e
umask 022

. /lib/lsb/init-functions

case "$1" in
start)
	NOTEBOOK_OPTS="--ip=0.0.0.0 --no-browser --notebook-dir=/home/vagrant/Tutorials"
	log_daemon_msg "Starting Notebook" || true
		if /sbin/start-stop-daemon --background --start --quiet --oknodo --pidfile /var/run/notebook.pid --exec $IPYTHON notebook -- $NOTEBOOK_OPTS; then
		    log_end_msg 0 || true
		else
		    log_end_msg 1 || true
		fi
	;;
stop)
    log_daemon_msg "Stopping Notebook" || true
    if /sbin/start-stop-daemon --stop --quiet --oknodo --name ipython; then
        log_end_msg 0 || true
    else
        log_end_msg 1 || true
    fi
    ;;
status)
        $IPYTHON notebook list && exit 0 || exit $?
        ;;
*)
	log_action_msg "Usage: $0 {start|stop|status}" || true
	exit 1		    
esac


exit 0