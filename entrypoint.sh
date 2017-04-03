#!/bin/bash

if [ "$1" = 'start-service' ]; then
if [[ -f /home/appetite_user/.is_configured ]]; then
   echo "Already done"
else

# Install packages
yum clean all && \
yum install -y yum-plugin-ovl && \
yum install -y epel-release && \
yum install -y gcc libffi-devel python-devel openssl-devel && \
yum update -y && \
curl -fSL 'https://bootstrap.pypa.io/get-pip.py' | python

# Install and setup appetite
useradd appetite_user && \
mkdir /var/appetite && \
cd /apps/appetite/src/ && \
python setup.py install && \
chown -R appetite_user: /apps/appetite/ /var/appetite

# Added aliases and symlinks
ln -s /apps/appetite /home/appetite_user/appetite && \
echo 'export APPETITE_SERVER=1' >> /home/appetite_user/.bashrc && \
echo 'alias appetite_test="python /apps/appetite/tests/test.py"' >> /home/appetite_user/.bashrc

touch /home/appetite_user/.is_configured

fi 
tail -n 0 -f /apps/appetite/README.md &
   wait

fi
tail -n 0 -f /apps/appetite/README.md &
   wait
