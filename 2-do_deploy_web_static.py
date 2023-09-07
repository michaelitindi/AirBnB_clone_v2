#!/usr/bin/python3
#distributes an archive to your web servers

from fabric.api import run, put, env, local
from os.path import isfile
from datetime import datetime

env.hosts = ["54.82.222.1","54.172.57.214"]
env.user = 'ubuntu'
