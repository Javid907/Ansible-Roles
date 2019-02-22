#!/bin/bash

systemctl restart zabbix-server

cat /var/log/audit/audit.log | grep zabbix_agentd | grep denied | audit2allow -M zabbix_agent_setrlimit

semodule -i zabbix_agent_setrlimit.pp

cat /var/log/audit/audit.log | grep zabbix_server | grep denied | audit2allow -M zabbix_server_setrlimit

semodule -i zabbix_server_setrlimit.pp

systemctl restart zabbix-server 

ausearch -c 'zabbix_server' --raw | audit2allow -M my-zabbixserver
semodule -i my-zabbixserver.pp

systemctl restart zabbix-server

ausearch -c 'zabbix_agent' --raw | audit2allow -M my-zabbixagent  
semodule -i my-zabbixserver.pp

systemctl restart zabbix-agent

