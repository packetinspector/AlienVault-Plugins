##File Auditing with NxLog+USM

- Author: PacketInspector ([@pkt_inspector](https://twitter.com/pkt_inspector))
- Tested on Win10, likely only works on 2008+...You tell me, eventIDs keep changing.

####Plugin Install:

```
cp nxlog-audit.cfg to /etc/ossim/agent/plugins/
cat nxlog-audit.sql | ossim-db
dpkg-reconfigure alienvault-cpe
/etc/init.d/ossim-server restart
...
(choose asset and enable plugin)
```

####NxLog

```
Install NxLog
Change IP to your USM Sensor
```
Use Conf: ([here on github too](https://github.com/packetinspector/random/blob/master/nxlog-windows-security-audit.conf))

####File Auditing

```
Enable Auditing
Pick Directories to Monitor
Enable Settings per Example
```

#####Audit Setup

![perms](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/perms.png)

#####Choose Plugin

![plugin](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/plugin.png)

#####Sample

![events](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/master/NxLog-FileAudit/events.png)
