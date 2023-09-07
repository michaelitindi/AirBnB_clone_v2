#!/usr/bin/python3
"""generates a .tgz archive from the contents of the web_static"""

from fabric.api import local
from datetime import datetime


def do_pack():
    """ Generate a .tgz archive from web_static directory."""
    local("mkdir -p versions")
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    archive_path = "versions/web_static_{}.tgz".format(timestamp)
    archive_command = "tar -czvf {} web_static".format(archive_path)
    result = local(archive_command)
    if result.failed:
        return None
    return archive_path
