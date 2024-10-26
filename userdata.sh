#!/bin/bash
# User data script for installing SonarQube

# Update the system
yum update -y

# Install necessary tools
yum install wget unzip -y

# Create directory for SonarQube
mkdir /opt/sonarqube
cd /opt

# Download and unzip SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.6.92038.zip
unzip sonarqube-9.9.6.92038.zip -d /opt/
mv /opt/sonarqube-9.9.6.92038   /opt/sonarqube

chmod +x   /opt/sonarqube/sonarqube-9.9.6.92038/bin/linux-x86-64/sonar.sh

# Install Java 17 Amazon Corretto
yum install java-17-amazon-corretto-devel -y
java -version

# Create sonar user
useradd sonar

# Ensure correct permissions
chown -R sonar:sonar /opt/sonarqube
chmod -R 755 /opt/sonarqube

# Reload systemd to recognize the new service
systemctl daemon-reload

# Start the SonarQube service as the sonar user
su - sonar -c "/opt/sonarqube/sonarqube-9.9.6.92038/bin/linux-x86-64/sonar.sh start"
