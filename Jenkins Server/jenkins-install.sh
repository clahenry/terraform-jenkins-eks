#!/bin/bash

# Install Updated packages on linux machine
sudo yum update
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
#sudo yum install jenkins java-1.8.0-openjdk-devel -y
#sudo amazon-linux-extras install java-openjdk11
#Java 17 installed and old Java versions commented out
sudo dnf install java-17-amazon-corretto-devel -y
sudo yum install git -y
sudo yum install nodejs npm -y
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
sudo update-alternatives --set java /usr/lib/jvm/java-17-amazon-corretto.x86_64/bin/java
sudo yum install jenkins -y
sudo sed -i -e 's/Environment="JENKINS_PORT=[0-9]\+"/Environment="JENKINS_PORT=8080"/' /usr/lib/systemd/system/jenkins.service
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo yum install unzip -y
sudo unzip awscliv2.zip  
sudo ./aws/install

# install git
#sudo yum install git -y

# install terraform

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

# install kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin