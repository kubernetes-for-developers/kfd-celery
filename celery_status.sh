#!/bin/sh

# make sure we exit this wrapper script with a failure if any of the commands
# we invoke fail to return properly
set -e

# make sure we're in the correct local directory for celery to
# module load celery_conf within python...
cd /opt/app

# request status of celery
celery -A celery_conf status
