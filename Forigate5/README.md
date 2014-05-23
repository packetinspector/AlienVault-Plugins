## Fortigate 5.x

This plugin is for Fortinet UTM devices running FortiOS 5.x

The SIDS were parsed from 5.0MR6.  Logs tested from several devices. 

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



