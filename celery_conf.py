#!/usr/bin/env python3

import os
from celery import Celery

# Get Kubernetes-provided address of the broker service
broker_service_host = os.environ.get('MESSAGE_QUEUE_SERVICE_HOST')
# could also use DNS name: 'message-queue'|'message-queue.default.svc.cluster.local' for our default

app = Celery('tasks', broker='amqp://user@%s//' % broker_service_host, backend='amqp')

@app.task
def add(x, y):
    return x + y
