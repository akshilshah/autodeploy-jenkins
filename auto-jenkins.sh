#!/bin/bash
# Install on ubuntu 18.0.4
# sudo add-apt-repository ppa:openjdk-r/ppa
# sudo apt-get update
# sudo apt-get install openjdk-8-jre

echo "Installing java repo"
echo Enter | sudo add-apt-repository ppa:webupd8team/java
sudo apt update
echo "installing default jdk"
echo Y | sudo apt install default-jre default-jdk
echo "get java version"
javac -version
echo "installing jenkins"
cd /tmp && wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "adding jenkins repo"
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list.d/jenkins.list
cd
apt update
echo y | apt install jenkins
echo "stopping jenkins service"
sudo systemctl stop jenkins.service
echo "starting jenkins service"
sudo systemctl start jenkins.service
echo "enabling jenkins"
sudo systemctl enable jenkins.service
# to verify jenkins
# sudo systemctl status jenkins
echo "configure firewall to open port"
sudo ufw allow 8080
sudo ufw allow 22
# check firewall status 
# sudo ufw status
echo "enable firewall"
echo y | sudo ufw enable
echo "JENKINS Setup Complete"
echo "Open url:8080"
echo "Jenkins password"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword