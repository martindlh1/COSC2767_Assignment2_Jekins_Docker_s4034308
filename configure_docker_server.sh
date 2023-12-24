#install docker
sudo yum install -y docker

#start docker
service docker start

#configure admindocker for jenkins
sudo useradd dockeradmin
sudo passwd dockeradmin << EOD
devops-jenkins
devops-jenkins
EOD
sudo usermod -aG docker dockeradmin

#authorize password authentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo service sshd reload
