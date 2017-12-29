#!/bin/sh

# echo all the commands invoked within this shell to STDOUT
# so we can see what is being run in the logs
set -x

# make sure we exit this wrapper script with a failure if any of the commands
# we invoke fail to return properly
set -e

# apply a default debug level of info if
# not overridden in the environment variables
DEBUG_LEVEL=${WORKER_DEBUG_LEVEL:-info}

# make sure we're in the correct local directory for celery to
# module load celery_conf within python...
cd /opt/app

# initiate the celery worker
/usr/bin/celery -A celery_conf worker -l ${DEBUG_LEVEL}
