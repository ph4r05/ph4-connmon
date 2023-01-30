#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
set -ex

cd "${SCRIPT_DIR}"
mkdir -p /home/tunnel/mon/
cp config.json /home/tunnel/mon/mon-config.json
chmod 0640 /home/tunnel/mon/mon-config.json
chown tunnel:tunnel -R /home/tunnel/mon
chown tunnel:tunnel /home/tunnel/mon/mon-config.json

cp ph4connmon.sh /home/tunnel/mon
chmod 0755 /home/tunnel/mon/ph4connmon.sh

cp ph4connmon.service /etc/systemd/system/ph4connmon.service
systemctl daemon-reload

set +ex
echo "[+] DONE"

systemctl enable ph4connmon.service

# systemctl restart ph4upsmon.service
# systemctl restart nut-monitor.service
# pip install -U . && systemctl restart ph4upsmon.service
