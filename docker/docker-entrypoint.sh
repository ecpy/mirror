#!/bin/sh
set -e

# The container process might be started with a UID or GID for which there is
# no user or group inside the container.
# In that case we create a corresponding user and group.
if ! (getent passwd "$(id -u)" >/dev/null); then
  useradd -u "$(id -u)" "user$(id -u)"
fi
if ! (getent group "$(id -g)" >/dev/null); then
  groupadd -g "$(id -g)" "group$(id -g)"
fi

export JAVA_OPTS="-Xms1024m -Xmx1024m -Xss512K -XX:PermSize=256m -XX:MaxPermSize=256m $JAVA_OPTS -Dfile.encoding=UTF-8"

exec /opt/mirror/mirror "$@"
