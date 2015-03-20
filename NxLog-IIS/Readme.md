##NxLog + IIS

- Author: PacketInspector ([@pkt_inspector](https://twitter.com/pkt_inspector))

####Installation:

- nxlog.conf on windows box
- plugin file in /etc/ossim/agent/plugins/
- add SQL for plugin awareness

```
cat iis-nxlog.sql | ossim-db
```

####Asset Screen:
![ScreenShot](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/NxLog-IIS/Screenshots/Screenshot_35.png)

####Recommended View:
![ScreenShot](https://raw.githubusercontent.com/packetinspector/AlienVault-Plugins/NxLog-IIS/Screenshots/Screenshot_36.png)

####Notes:
This is based off the stock W3C format.  This should work for IIS 7.x and 8.x
If you use advanced logging (you should) then you'll have to modify the plugin


