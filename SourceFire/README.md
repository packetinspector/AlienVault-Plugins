SourceFire DefenseCenter
===========
This plugin will work for DefenseCenter 5.x and stand-alone 4.x sensors.

Install:
- Plugin in plugin dir
```ShellSession
alienvault:~#cp sourcefire.cfg /etc/ossim/agent/plugins/
```
- add sourcefire.sql to the db and restart ossim-server....
```ShellSession
alienvault:~#cat sourcefire.sql | ossim-db
alienvault:~#service ossim-server restart
```
- [optional] add recent SID sql to the db [restart ossim-server]
- You can add this plugin via the Asset Method(recommended) or the legacy way

Notes:
- DC defaults to UTC, so does this plugin.  If you changed the TZ change it here too
- DC often uses names in its logs.  BE SURE THESE ARE IN DNS, HOST FILE, or ASSET DB!!!!!
- This plugin has some IDM features, like OS and MAC address.  You'll like it.
- SourceFire events will be labeled as Snort, DC events will be labeled as SfDC

----
This is a first pass at DC itself.  While the sensor/IDS logs are easy parse and normalize, the rest is rather messy.  
DC seems to have no standardized log format and it comes from multiple sources internally.  So best effort has been made to capture info
that is relevant to the SIEM.
