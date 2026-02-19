#Command for host laravel Projects on Server

#installing the nginx web server
Sudo apt install nginx -y

#Now you can see weather nginx is running or not by using the below command
Sudo systemctl status nginx

#Now Check the nginx version by using the below command
Sudo nginx -v

#now move to install all the dependencies for Laravel project

Sudo apt update && sudo apt upgrade -y # To update and upgrade the system 

#installing the PHP and its dependencies
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.2 php8.2-fpm php8.2-mysql php8.2-xml php8.2mbstring php8.2-bcmatch php8.2-curl php8.2-zip php8.2-tokenizer php8.2-json unzip curl git
sudo apt install php8.3-cli

#Now you can check the PHP version by using the below command
php -v


#noe install composer globally by using the below command
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo apt install composer

#Now you can check the composer version by using the below command
composer -v


#now install mysql server by using the below command
sudo apt install -y mysql-server
sudo mysql_secure_installation # for thi some question have been Asked you just answer them by yes and set the password for root user

# Validate password component?        → N
# New password for root?              → Enter a strong password (remember it!)
# Re-enter password?                  → Same password again
# Remove anonymous users?             → Y
# Disallow root login remotely?       → Y
# Remove test database?               → Y
# Reload privilege tables?            → Y



#verify the mysql server is running or not by using the below command
sudo systemctl status mysql

#for accessing mysql server use the below command
sudo mysql #you in mysql terminal now and you can make Database and table as  development need.


#now Create a Database named " laravel_db"

CREATE DATABASE laravel_db;


#for exit from mysql terminal use the below command
exit; #or 
Ctrl + D


#install node js and npm by using the below command
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
node --version && npm --version





