## Fortigate 5.x

This plugin is for Fortinet UTM devices running FortiOS 5.x

The SIDS were parsed from 5.0MR6.  Logs tested from several devices. 

Remember these devices can make a **lot** of logs.  Most of them will be traffic logs.  If you don't need them then filter them somehow, someway.  Save a CPU cycle.

I have included the header and SQL for this to work inside 4.7.  You can use this with the new asset plugin system, which I recommend.  You'll find the device listed under Fortinet, then FortiOS.  

This plugin uses a **new** ID of 90009, so if you have policy/correlation rules on the old plugin you'll need to updated them.  


I have used the userdata fields for:

Field | Data
----- | ------
userdata3 | hostname from urls or policy name
userdata4 | url or Source Country(traffic)
userdata5 | category description from webfilter or DST Country(traffic)
userdata6 | session duration
userdata7 | sent bytes
userdata8 | recvd bytes
userdata9 | Rule Matched



Installation:

* Copy .cfg to /etc/ossim/agent/plugins/
* Load SQL via "cat fortigate5.sql | ossim-db"
* Restart ossim-server and ossim-agent
* Load plugin via Asset or the old method
* Enjoy the well parsed logs


The perl script included was used to make the SIDS.  You do not need it.  
