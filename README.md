# project-new

# I. MAVEN INSTALLATION
yum -y install java-11-openjdk

cd /usr/local/src

wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz

tar -xvzf apache-maven-3.8.4-bin.tar.gz
cd

 vim /etc/profile.d/maven.sh
 # add this an maven.sh file  to export the path
export M2_HOME=/usr/local/src/apache-maven-3.8.4
export PATH=${M2_HOME}/bin:${PATH}

source /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh
sh /etc/profile.d/maven.sh

# II. add the slave on master node

--> Master  private-ip:  12.0.2.101
--> Slave  private ip: 12.0.2.30

# Slave:
useradd jenkins-slave
su jenkins-slave
ssh-keygen -t rsa -N "" -f /home/jenkins-slave/.ssh/id_rsa
cd .ssh
cat id_rsa.pub > authorized_keys
chmod 700 authorized_keys

# master

mkdir -p /var/lib/jenkins/.ssh
cd /var/lib/jenkins/.ssh
cat   known_hosts
ssh-keyscan -H 12.0.2.30 >>/var/lib/jenkins/.ssh/known_hosts
chown jenkins:jenkins known_hosts
chmod 700 known_hosts
cat known_hosts
chmod 777 .ssh 

# Add node-on console: [ plugin - maven integration ]

slave's pvt-ip: 12.0.2.30 
username: jenkins-slave 
slave's id_rsa key

manage jenkins --> new node -->name-executor-HOME-/home/jenkins-slave  - launch via ssh-host key verification  -->add credentials --> # tools --> maven add.





