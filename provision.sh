#!/bin/bash
sudo apt update -y && sudo apt install -y curl vim jq git make docker.io
sudo usermod -aG docker ubuntu


# Create directory to be served
sudo mkdir -p /home/ubuntu/api # if u only have this w/o the following lines, you ll get "cannot create /home/ubuntu/api/index.html: Permission denied"
sudo chmod a+rwx /home/ubuntu/api
sudo chown ubuntu:ubuntu /home/ubuntu/api

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
ExecStart=sudo docker container run -d --name nginx2020 -p 80:80 --restart=always -v /home/ubuntu/api/:/usr/share/nginx/html:ro nginx
[Install]
WantedBy=multi-user.target
EOF
ls -Alth
pwd
sudo chmod a-xw /etc/systemd/system/nginx.service
sudo systemctl daemon-reload
sudo systemctl enable nginx
sudo systemctl start nginx
echo "done."
