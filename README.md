# kfd-celery
example celery worker and deployment specs for Kubernetes for Developers

To create images for this example:

docker build -t quay.io/kubernetes-for-developers/celery-worker:0.4.0 .
docker build -t quay.io/kubernetes-for-developers/celery-worker:latest .
docker push quay.io/kubernetes-for-developers/celery-worker