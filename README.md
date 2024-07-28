Project-6-Deploy-Application-Using-Tomcat-Docker-Kubernetes

steps: 
****************************************Setup CI/CD with Github, Jenkins, Maven and Tomcat*********************************
1- Setup Jenkins

2- Setup and configure Maven and Git

3- Setup Tomcat Server

4- Integrate Github, Maven, Tomcat Server with Jenkins

5- Create CI/CD job

6- Test the deployment



***********************connect the instance to the terminal*********************
sudo su -
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
amazon-linux-extras install epel
amazon-linux-extras install java-openjdk11
yum install jenkins
systemctl status jenkins
systemctl enable --now jenkins
yum install git
git -v


Login to jenkins server using public ip of jenkins server through port 8080
/var/lib/jenkins/secrets/initialAdminPassword

***********Next step is to integrate git with jenkins.*************
install below plugins
git github and all related to github
Maven Integration
Deploy to container


****************Next step is to Configure Jenkins.*****************
Jenkins -> Manage Jenkins -> Tools -> Git ->
name: Default
path to git executable: git
Apply -> Save.


**************Next step is to install Maven on the Jenkins server.**************

cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
tar -xvzf apache-maven-3.9.4-bin.tar.gz
mv apache-maven-3.9.4 maven
cd maven/bin
./mvn -v
cd ~
vim .bash_profile
    M2_HOME=/opt/maven
    M2=/opt/maven/bin
    JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.19.0.7-1.amzn2.0.1.x86_64
    PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2
            (save it)
			
source .bash_profile
echo $PATH
mvn -v

*********Need to install maven plugins in jenkins.*******


Lets configure.

Manage Jenkins -> Tools -> JDK -> Add JDK -> give name java-11 and enter Java home 
path -> /usr/lib/jvm/java-11-openjdk-11.0.19.0.7–1.amzn2.0.1.x86_64
{check this path according to your machine}

add maven also
name: maven-3.8.3
MAVEN_HOME: /opt/maven
Apply -> Save.


**************add Webhook for github************
go to git and add jenkins webhook

**********************************************Setup Tomcat Server.*********************************
connect tomcat machine

sudo su -
amazon-linux-extras install java-openjdk11
java --version
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
tar -xvzf apache-tomcat-9.0.78.tar.gz 
mv apache-tomcat-9.0.78 tomcat
cd tomcat/bin
./startup.sh


Lets access the tomcat server using public ip through port 8080. {tomcatip:8080}

cd /opt/tomcat
find / -name context.xml
vim /opt/tomcat/webapps/host-manager/META-INF/context.xml
vim /opt/tomcat/webapps/manager/META-INF/context.xml

from both files comment {<!--valve to 0:1 -->} like this

cd /opt/tomcat/bin
  ./shutdown.sh
  ./startup.sh
  
cd /opt/tomcat/conf
  vim tomcat-users.xml
  
  
 remove <!-- rolename section -->
  and add below code:
  
 <role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
<user username="deployer" password="deployer" roles="manager-script"/>
<user username="tomcat" password="s3cret" roles="manager-gui"/>
  
 **********now lets goto command line and create link files for tomcat startup.sh and shutdown.sh**********
 
ln -s /opt/tomcat/bin/startup.sh /usr/local/bin/tomcatup
ln -s /opt/tomcat/bin/shutdown.sh /usr/local/bin/tomcatdown
echo $PATH
tomcatdown
tomcatup

Now we can access the tomcat server manager app using the credentails that we have updated in the tomcat-users.xml file

go to manager app on webpage and login by credentials given below
username : tomcat
password: s3cret




***********************Lets Configure.******************

Jenkins -> Manage Jenkins -> Credentials -> System ->
 Global Credentials -> Add Credentials -> 
 Lets add the credentials that we have updated.

kind: Username with password

username : deployer

password: deployer

id: tomcat_deployer

descripton: tomcat_deployer
Click Create.


**************Lets create the job for deploying our code to Tomcat server.******************

Jenkins -> Dashboard -> New Item -> give a name -> 
select Maven Project -> Click OK -> 
Give a description -> Source Code Management 
-> Select Git -> Enter the Github url (https://github.com/Pratik-Pardeshi/Project-6-DevOps-Deploy-Application-Using-Tomcat-Docker-Kubernetes.git


Goto Build section -> 
Goals and options : clean install

Goto Post-build Actions section -> Add post build action 
→ select Deploy war/ear to a container ->
in WAR/EAR Files write this : **/*.war 
-> Add Container -> Tomcat 8 x Remote -> 
select the Credentials -> add your existing tomcat credentials
Tomcat URL : http://<public-ip>:8080 
-> Apply -> Save

********************now build the job*********
tomcatip:8080/webapp/



Now lets enable automatic build triggering by configuring the system to 
initiate builds whenever changes occur in the source code.**********************

Jenkins -> select the job -> Configure -> Source code management -> 
Build Triggers -> Select Poll SCM -> enter this ( * * * * * ) -> Apply -> Save.

