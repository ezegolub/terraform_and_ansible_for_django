#!/bin/bash
set -x
apt-get update -qq
apt-get install -yqq git-core python-dev python-virtualenv python-pip awscli build-essential libssl-dev libffi-dev
#update-ca-certificates --fresh
aws --region us-east-1 s3 cp s3://pycon-alpha-releases/devops/$(aws --region us-east-1 s3 ls s3://pycon-alpha-releases/devops/ | awk '{print $4}' | tail -n1) /tmp/devops.tar.gz
cd /tmp; tar -xzf devops.tar.gz
pip install -qr /tmp/devops/ansible/requirements.txt
cd /tmp/devops/ansible; EC2_INI_PATH="/tmp/devops/ansible/ec2.local.ini" ansible-playbook -i ec2.py site.yml --connection=local --limit `ec2metadata --local-ipv4`,localhost,127.0.0.1 -e user_data=yes
cd /tmp/devops/ansible; EC2_INI_PATH="/tmp/devops/ansible/ec2.local.ini" ansible-playbook -i ec2.py deploy.yml --connection=local --limit `ec2metadata --local-ipv4`,localhost,127.0.0.1 -e user_data=yes