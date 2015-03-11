#!/bin/bash

set -e
umask 022

. /lib/lsb/init-functions

case "$1" in
start)
	SSHD_OPTS="--ip=0.0.0.0 --no-browser --notebook-dir=/home/vagrant/Tutorials"
	log_daemon_msg "Starting Notebook" || true
		if /sbin/start-stop-daemon --background --start --quiet --oknodo --pidfile /var/run/notebook.pid --exec /home/vagrant/anaconda/bin/ipython notebook -- $SSHD_OPTS; then
		    log_end_msg 0 || true
		else
		    log_end_msg 1 || true
		fi
	;;
stop)
    log_daemon_msg "Stopping Notebook" || true
    if /sbin/start-stop-daemon --stop --quiet --oknodo --pidfile /var/run/notebook.pid.pid; then
        log_end_msg 0 || true
    else
        log_end_msg 1 || true
    fi
    ;;
esac


exit 0