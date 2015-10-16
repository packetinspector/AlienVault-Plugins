##File Auditing with NxLog+USM

- Author: PacketInspector ([@pkt_inspector](https://twitter.com/pkt_inspector))

####Plugin Install:

```
copy nxlog-audit.cfg to /etc/ossim/agent/plugins/
cat nxlog-audit.sql | ossim-db
dpkg-reconfigure alienvault-cpe
```

####NxLog

```
Install NxLog
Use Conf: ([here on github too](https://github.com/packetinspector/random/blob/master/nxlog-windows-security-audit.conf))
Change IP to your USM Sensor
```

####File Auditing

```
Enable Auditing
Pick Directories to Monitor
```

#####Audit Setup

![perms](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/perms.png)

#####Choose Plugin

![plugin](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/plugin.png)

#####Sample

![events](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/events.png)