INSERT IGNORE INTO plugin (id, type, product_type, name, description) VALUES (90020, 1,10, 'arkoon', 'Arkoon Firewall');

INSERT IGNORE INTO plugin_sid (plugin_id, sid, priority,reliability, name, subcategory_id, category_id) VALUES
(90020,1,1,1,'Arkoon: Accept: USERDATA1',75,3),
(90020,100,1,1,'Arkoon: Bad packet',76,3),
(90020,101,1,1,'Arkoon: Deny: Blocked by Filter',76,3),
(90020,500,1,1,'Arkoon: Deny: Blocked by Filter',76,3),
(90020,102,1,1,'Arkoon: Portscan detected',70,9),
(90020,103,1,1,'Arkoon: Unsequenced packet',76,3),
(90020,104,5,1,'Arkoon: DoS Attack Detection',246,21),
(90020,105,1,1,'Arkoon: Blocked by application control',76,3),
(90020,300,1,1,'Arkoon: Closed After Reset',143,3),
(90020,301,1,1,'Arkoon: Closed by Client',143,3),
(90020,302,1,1,'Arkoon: Closed by Server',143,3),
(90020,303,1,1,'Arkoon: End of connection',143,3),
(90020,304,1,1,'Arkoon: Reset by Client',143,3),
(90020,305,1,1,'Arkoon: Reset by Server',143,3),
(90020,999,1,1,'Arkoon: Unknown Event',71,10),
(90020,306,1,1,'Arkoon: Unsequenced packet',143,3);

