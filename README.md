# kfd-celery

example celery worker and deployment specs for Kubernetes for Developers

# Experimenting with the base image

To experiment within this image using Kubernetes:

    kubectl run -i --tty \
    --image quay.io/kubernetes-for-developers/celery-worker:0.4.0 \
    --restart=Never --image-pull-policy=Always --rm testing /bin/sh

## to rebuild all the container images

(this may need to be done to resolve any underlying image issues, such
as security updates or vulnerabilities found and resolved in Alpine)

The container images associated with this repo are available for review at
https://quay.io/repository/kubernetes-for-developers/celery-worker?tab=tags

    git checkout 0.4.0
    docker build -t quay.io/kubernetes-for-developers/celery-worker:0.4.0 .
    #git checkout master
    docker build -t quay.io/kubernetes-for-developers/celery-worker:latest .
    docker push quay.io/kubernetes-for-developers/celery-worker

_Note_:

you will need to have previously invoked "docker login quay.io" to connect to
quay to send it images...

