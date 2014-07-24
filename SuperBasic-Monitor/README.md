Super Basic Monitor
===========================================

This is a generic version of a monitor plugin.  You can use them in correlation rules.

-------------------

Installation
--------
- Copy .cfg to /etc/ossim/agent/plugins/
- Add SQL `cat [filename].sql | ossim-db`
- Add contents of .xml to your user.xml (You should edit it)
- Enable the plugin

What does it do?
---------
This basic example takes the destination IP of an event and matches it to the OTX Database.  Obviously this is redundant as USM already marks OTX Events.  You can use your own text file, IOCs, IPRep, blacklist, etc...

A look inside
----------

Let's look at the plugin:

```INI
[scan-match]
query="grep -c '{$to}' /etc/ossim/server/reputation.data"
sid=any
regexp="(\d+)"
result={$1}
```

Upon invocation this plugin will call grep, substituting the dest IP({to}).  We parse the results with the regex(regexp) and pass back the match as result.

This is then evaluated by the correlation engine.  Let's look at part of the xml:

```XML
<directive id="500001" name="Basic Monitor Match" priority="2">
   <rule type="detector" name="Whatever-Log-Cisco-ASA-Build" from="ANY" to="!HOME_NET" port_from="ANY" port_to="ANY" reliability="0" occurrence="1" plugin_id="1636" plugin_sid="302015">
      <rules>
         <rule type="monitor" name="Monitor-Match" from="1:SRC_IP" to="1:DST_IP" port_from="ANY" port_to="ANY" reliability="5" plugin_id="90050" plugin_sid="2" condition="gt" value="0" interval="2" time_out="2" absolute="true"/>
      </rules>
   </rule>
</directive>
```

A correlation directive can not begin with a monitor, so we start it off in this case with a cisco ASA event.  We can then call the monitor plugin.  Note the end of the rule:

```XML
condition="gt" value="0" interval="2" time_out="2" absolute="true"/>
```
This is where the plugin is evaluated.  This happens by:

```
eval ( [Script-Result] Condtion(gt) Value(0) )
```

If the script result is greater than zero the rule is a match and fires.  

> **Note:** The second rule does **not** have to alarm.  Furthermore the monitor plugin will output it's own event in addition to the correlation directive.  So you can apply policy or whatever.

---------------------
Final Notes
---
- You may need to add the plugin manually or via the cli setup menu.
- I would **not** call a monitor rule against a high rate event.  So be very granular when choosing the rule that causes the monitor to fire.
