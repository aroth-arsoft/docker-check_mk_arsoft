#!/bin/bash
ARPY_VERSION="$1"

if [ -z "$ARPY_VERSION" ]; then
    echo "No version for arsoft-python specified."
    exit 1
fi

curl -L -q -o /tmp/arsoft-python.tar.gz https://github.com/aroth-arsoft/arsoft-python/archive/v${ARPY_VERSION}.tar.gz
mkdir /root/arpy-src
tar xfz /tmp/arsoft-python.tar.gz --directory /root/arpy-src
mkdir /root/arpy-dist
pushd /root/arpy-src/arsoft-python-${ARPY_VERSION}/
python2 ./setup.py install --root /root/arpy-dist
popd

mkdir -p /etc/nagios-plugins/config
cp -a /root/arpy-dist/etc/nagios-plugins/config/* /etc/nagios-plugins/config

cp -a /root/arpy-dist/usr/share/check_mk/checks/* /opt/omd/versions/default/share/check_mk/checks
cp -a /root/arpy-dist/usr/share/check_mk/special/* /opt/omd/versions/default/share/check_mk/agents/special/
cp -a /root/arpy-dist/usr/share/check_mk/agents/plugins/* /opt/omd/versions/default/share/check_mk/agents/plugins/
cp -a /root/arpy-dist/usr/lib/python2.7/site-packages/arsoft /opt/omd/versions/default/lib/python
