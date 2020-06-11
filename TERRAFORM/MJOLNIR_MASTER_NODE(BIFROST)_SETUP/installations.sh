#! /bin/bash

# Update existing packages
yum update -y

# Install git
yum install git -y

# Install Docker
yum install docker -y
service docker start
usermod -a -G docker ec2-user
chkconfig docker on

# Install Docker-Compose
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Getting the Concourse-Ansible-POC-repo
mkdir ~/Mjolnir
cd ~/Mjolnir
git clone https://github.com/mjolnir-repo/cicd.git
cd cicd
git pull origin MJ-38
service docker start

# Install Python 3
cd /usr/bin
yum install python36-virtualenv.noarch -y
ln -sfn python3.6 python
ln -sfn pip-3.6 pip
pip install --upgrade pip

# Install Spark
cd /root
yum install java-1.8.0-openjdk-devel -y
java -version
wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm
yum install scala-2.11.8.rpm -y
scala -version
/usr/local/bin/pip install py4j
wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz
cd spark-2.4.5-bin-hadoop2.7
/usr/local/bin/pip install findspark

# Install and configure Jupyter
/usr/local/bin/pip install jupyter
/usr/local/bin/jupyter notebook --generate-config
cd /root
mkdir certs
cd certs/
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem -subj "/C=IN/ST=Not Available/L=Not Available/O=Not Available/OU=INot Available/CN=not.available@baddomain.com"
ls -lrt
cd /root/.jupyter/

# Create jupyter config
echo "c = get_config()" > jupyter_notebook_config.py
echo "c.NotebookApp.certfile = u'/root/certs/mycert.pem'" >> jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> jupyter_notebook_config.py
echo "c.NotebookApp.port = ${v_jupyter_port}" >> jupyter_notebook_config.py
echo "c.NotebookApp.token = 'CaputDraconis'" >> jupyter_notebook_config.py

# Create Spark bed
mkdir /root/spark_bed
chmod 777 /root/spark_bed
cd /root/spark_bed

# Trigger jupyter server
nohup /usr/local/bin/jupyter notebook --allow-root &
