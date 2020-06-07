#! /bin/bash

# Update existing packages
yum update -y

# Install Docker
yum install docker -y

# Install Python 3
cd /usr/bin
yum install python36-virtualenv.noarch -y
ln -sfn python3.6 python
ln -sfn pip-3.6 pip
export PATH="/usr/local/bin:${PATH}"
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
jupyter notebook --generate-config
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
echo "c.NotebookApp.port = 8888" >> jupyter_notebook_config.py

# Create Spark bed
mkdir /root/spark_bed
chmod 777 /root/spark_bed
cd /root/spark_bed

# Trigger jupyter server
nohup jupyter notebook --allow-root &
