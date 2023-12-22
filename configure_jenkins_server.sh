#install java
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo amazon-linux-extras install -y java-openjdk11

#install jenkins
sudo yum install -y jenkins

#install git
yum install -y git

#install maven
yum install -y maven

#display initila jenkins password to connect to dashboard
echo -n "Initial Jenkins Password: "
cat /var/lib/jenkins/secrets/initialAdminPassword

#display address of jenkins dashboard
echo -e "Access Jenkins Dashboard here: http://$(dig +short myip.opendns.com @resolver1.opendns.com):8080"
