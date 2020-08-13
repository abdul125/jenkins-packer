#!/bin/bash
sudo apt update -y && sudo apt install -y curl vim jq git make docker.io
sudo usermod -aG docker ubuntu

# get the nginx working
sudo touch /etc/systemd/system/nginx.service
sudo chmod a+rw /etc/systemd/system/nginx.service
sudo docker pull nginx

cat <<EOF > /etc/systemd/system/nginx.service
[Unit]
Description=abdul nginx
After=docker.service
[Service]
Type=simple
ExecStart=sudo docker container run -d --name nginx2020 -p 80:80 --restart=always -v /home/ubuntu:/mywork nginx
[Install]
WantedBy=multi-user.target
EOF
ls -Alth
pwd
sudo chmod a-w /etc/systemd/system/nginx.service
sudo systemctl daemon-reload
sudo systemctl enable nginx
sudo systemctl start nginx
echo "done."
