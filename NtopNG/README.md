NtopNG Plug-in
===================================

http://www.ntop.org/products/ntop/

Installation
-------

Like most plug-ins:

- cat ntopng.sql | ossim-server
- restart ossim-server
- copy ntopng.cfg to /etc/ossim/agent/plugins/
- enable plugin via AV-Center

Rsyslog Config
-------

NtopNG Server:

```ShellSession
root@ntopng:/etc/rsyslog.d# more ntop.conf
if $programname == 'ntopng' then /var/log/ntop-ng.log
& @[AlienVault-Sensor-IP-Address]
& ~
```

AlienVault Sensor:

```ShellSession
alienvault:/etc/rsyslog.d# more ntop.conf
if $programname == 'ntopng' then /var/log/ntop-ng.log
& ~
```
