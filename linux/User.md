- user1
  -> passwd (/etc/) = user location
  -> group (/etc/) = group location

from
ec2-user:x:1000:1000:EC2 Default User:/home/ec2-user:/bin/bash
1st - username
2nd - represent password
3rd - userid
4rd - group id of that group where user is stored
5th - comment
6th - loc of the dir
7th - name of the shell

Become Root user
useradd user1
passwd user1 

chage -l user1
chage user1

--- 
root-
    passwd - changed the passwd for the login user
    passwd username - set or changed the passwd for user

user2 - set a comment - test user\
    - make user2 part of wheel group as secondary group

usermod -c "testuser"
usermod -G wheel user2

- -c = modify comments
- -g = modify primary group
- -G = modify secondary group