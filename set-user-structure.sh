#!/bin/bash

group_names=("sales" "finance" "marketing" "public")

user_names_sales=("carlos" "maria" "joao")

user_names_finance=("debora" "sebastiana" "roberto")

user_names_marketing=("josefina" "amanda" "rogerio")

user_names=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

sudo mkdir /shared_group_directories

sudo touch users_password.txt

sudo chmod 700 users_password.txt

echo "Initial passwords defined for system users:" >> users_password.txt

for groupname in "${group_names[@]}"; do
	sudo groupadd $groupname
	sudo mkdir /shared_group_directories/$groupname
	sudo chown :$groupname /shared_group_directories/$groupname
	sudo chmod 2770 /shared_group_directories/$groupname
done

for username in "${user_names_sales[@]}"; do
	sudo useradd -m -s /bin/bash -g  sales $username
done

for username in "${user_names_finance[@]}"; do
	sudo useradd -m -s /bin/bash -g  finance $username
done

for username in "${user_names_marketing[@]}"; do
	sudo useradd -m -s /bin/bash -g  marketing $username
done

for username in "${user_names[@]}"; do
	sudo usermod -aG  public $username
done

for username in "${user_names[@]}"; do
	user_password=$(python3 PasswordGenerator.py)
	echo "$username:$user_password" >> users_password.txt
	echo "$username:$user_password" | sudo chpasswd
	sudo chage -d 0 $username
done