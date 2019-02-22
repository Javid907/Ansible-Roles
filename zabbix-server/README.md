Role Name
=========

This role will be install Zabbix Server in your server with HTTPS.

Also if your server join to FreeIPA HTTPS certificate will be generate from IPA server 

Will be install 
--------------
Zabbix 4.0.4
MariaDB
PHP 7.2
Apache

Role Variables
--------------
All variables in folder vars.
Here I posted without encription.

I recomend use ansible-vault



Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

GNU

