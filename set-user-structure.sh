#!/bin/bash

group_names=("sales" "finance" "marketing" "public")

user_names_sales=("carlos" "maria" "joao")

user_names_finance=("debara" "sebastiana" "roberto")

user_names_marketing=("josefina" "amanada" "rogerio")

user_names=("carlos" "maria" "joao" "debara" "sebastiana" "roberto" "josefina" "amanada" "rogerio")

sudo mkdir /shared_group_directories

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
	echo "$username:DefaultPass123!" | sudo chpasswd
	sudo chage -d 0 $username
done