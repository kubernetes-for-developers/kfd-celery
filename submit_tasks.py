#!/usr/bin/env python3

import random
import syslog
import time

from celery_conf import add
from celery_conf import dump_context

while True:
    x = random.randint(1, 10)
    y = random.randint(1, 10)
    res = add.delay(x, y)
    dump_context.apply_async(args=[x, y])
    time.sleep(5)
    if res.ready():
        res.get()