#!/bin/bash

systemctl restart zabbix-agent

cat /var/log/audit/audit.log | grep zabbix_agentd | grep denied | audit2allow -M zabbix_agent_setrlimit

semodule -i zabbix_agent_setrlimit.pp

systemctl restart zabbix-agent

ausearch -c 'zabbix_agent' --raw | audit2allow -M my-zabbixagent  

semodule -i my-zabbixserver.pp

systemctl restart zabbix-agent

