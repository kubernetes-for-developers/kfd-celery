FROM alpine
# load any public updates from Alpine packages
RUN apk update
# upgrade any existing packages that have been updated
RUN apk upgrade
# add/install python3 and related libraries
# https://pkgs.alpinelinux.org/package/edge/main/x86/python3
RUN apk add python3
# make a directory for our application
RUN mkdir -p /opt/app
# move requirements file into the container
ADD celery_conf.py /opt/app/celery_conf.py
ADD run_tasks.py /opt/app/run_tasks.py
ADD requirements.txt /opt/app/requirements.txt
# install the library dependencies for this application
RUN pip3 install -r /opt/app/requirements.txt
WORKDIR /opt/app
CMD ["/bin/sh","-c","/usr/bin/celery -A celery_conf worker -l info"]
