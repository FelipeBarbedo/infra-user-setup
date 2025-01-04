# Script for Creating User Structures, Directories, and Permissions

This repository provides a Bash script for automating the creation of users, groups, and directory structures, along with configuring permissions in a Linux environment. It is designed to simplify user management and enforce consistency using an Infrastructure as Code (IaC) approach.

## Features

- Create user accounts with predefined settings.
- Define and manage groups for organizing users.
- Set up directory structures with appropriate permissions.
- Easily customizable for different environments or use cases.

## Prerequisites

-  Linux-based operating system (e.g., Ubuntu)
-  Sudo privileges for executing administrative commands.
-  Bash shell (default on most Linux distributions).

## Usage

1. Clone the Repository:

    `$ git clone [repository-url]`

    `$ cd create-users-groups`

2. Review and Edit the Script:

    Open `create-users-groups.sh` to customize user and group details according to your requirements.

3. Run the Script with sudo privile:

    `$ sudo ./create-users-groups.sh`

## Script Overview

If you want to assign a specific group to the user, you can use the '-g' flag on the 'useradd' command. The group must exist before using it in the 'useradd' command. For this let's first create a group using the 'groupadd' commnand:

    $ sudo groupadd {groupname}

After creating a group using the 'groupadd' command you can optionally create a shared folder for the group using the 'mkdir' command on the '/shared' directory

    $ sudo mkdir /shared/{groupname_directory}

With the shared folder created it makes sense to change the ownership of the folder to the group it'll use the folder

    $ sudo chown :{groupname} /shared/{groupname_directory}

Now we can set the permissions for the shared directory so that all the group members can access and modify it's contents.

	$ sudo chmod 2760 /shared/{groupname_directory}

After creating a group you can set the users using the 'useradd' command. 

    $ sudo useradd -m -s /bin/bash -c "User's Full Name" -g {groupname} {username}

The 'useradd' command is a basic command that directly modifies system files to create a user.

The flag '-m' creates the user's home directory if it does not already exits.

The flag '-s /bin/bash' sets the default shell for the user.

The flag '-c {user's full name}' adds a comment to the user account, typically used for the user's full name.

The flag '-g {groupname}' sets the user's primary group. Every user must belong to one **primery group**. The group must exist before using it in the 'useradd' command.

The flag '-G sudo' adds the user to a supplementary group such as 'sudo', granting administraive privileges.

The flag '-e 2024-12-31' specifies and account expiration date. After this date, the account is automatically disabled.

Finally we can define a temporary password for each user using the 'chpasswd' command passing the password with the 'echo' command.

    $ echo "{username}:DefaultPass123!" | sudo chpasswd
	$ sudo chage -d 0 {username}

The 'chage' command forces the user to change the password on first login.

And that's how the script is mainly structured.