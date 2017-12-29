#1/bin/sh
set -x
set -e
# apply a default debug level of info if
# not overridden in the environment variables
DEBUG_LEVEL=${WORKER_DEBUG_LEVEL:-info}
# make sure we're in the correct local directory for celery to
# module load celery_conf within python...
cd /opt/app
# initiate the celery worker
/usr/bin/celery -A celery_conf worker -l ${DEBUG_LEVEL}
