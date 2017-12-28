#!/usr/bin/env python3

import os
from celery import Celery

# set username and password for broker, with overrides from environment variables
rabbitmq_user = os.environ.get('RABBITMQ_USERNAME','user')
rabbitmq_password = os.environ.get('RABBITMQ_USERNAME','bitnami')
rabbitmq_vhost = os.environ.get('RABBITMQ_VHOST','/')

# Get Kubernetes-provided address of the broker service
broker_service_host = os.environ.get('MESSAGE_QUEUE_SERVICE_HOST','message-queue')
# could also use DNS name: 'message-queue'|'message-queue.default.svc.cluster.local' for our default

broker_url = 'amqp://%s:%s@%s/%s' % (rabbitmq_user,
        rabbitmq_password, broker_service_host, rabbitmq_vhost)
app = Celery('tasks', broker=broker_url, backend='amqp')

@app.task
def add(x, y):
    return x + y
