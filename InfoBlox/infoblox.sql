-- infoblox
-- plugin_id: 19005

DELETE FROM plugin WHERE id = "19005";
DELETE FROM plugin_sid where plugin_id = "19005";

INSERT IGNORE INTO plugin (id, type, name, description) VALUES (19005, 1, 'infoblox', 'InfoBlox');

INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1000, NULL, NULL, 'InfoBlox: Called - TestDomainControllerSettings' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1001, NULL, NULL, 'InfoBlox: Called - GetLogFiles' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1002, NULL, NULL, 'InfoBlox: Called - DataGetComplete' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1003, NULL, NULL, 'InfoBlox: Called - CaptureTrafficControl' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1004, NULL, NULL, 'InfoBlox: Called - GetMemberData' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1005, NULL, NULL, 'InfoBlox: Called - GetGridData' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1006, NULL, NULL, 'InfoBlox: Called - GetSupportFiles' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2000, NULL, NULL, 'InfoBlox: Created AccessRight' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2001, NULL, NULL, 'InfoBlox: Created AdminMember' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2002, NULL, NULL, 'InfoBlox: Created HostAddress' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2003, NULL, NULL, 'InfoBlox: Created HostRecord' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2004, NULL, NULL, 'InfoBlox: Created AdminGroup' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2005, NULL, NULL, 'InfoBlox: Created PtrRecord' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2006, NULL, NULL, 'InfoBlox: Created AdAuthService' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 2007, NULL, NULL, 'InfoBlox: Created Role' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 3000, NULL, NULL, 'InfoBlox: Deleted AccessRight' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 3001, NULL, NULL, 'InfoBlox: Deleted AdminMember' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 3002, NULL, NULL, 'InfoBlox: Deleted HostAddress' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 3003, NULL, NULL, 'InfoBlox: Deleted HostRecord' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 3004, NULL, NULL, 'InfoBlox: Deleted AdminGroup' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 4000, NULL, NULL, 'InfoBlox: Login_Allowed' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 4001, NULL, NULL, 'InfoBlox: Login_Denied' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 4002, NULL, NULL, 'InfoBlox: Logout' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 4003, NULL, NULL, 'InfoBlox: Failed AD Auth' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 5000, NULL, NULL, 'InfoBlox: Modified AdAuthService' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 5001, NULL, NULL, 'InfoBlox: Modified AuthPolicy' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 5002, NULL, NULL, 'InfoBlox: Modified AdminGroup' , 1, 1);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, category_id, class_id, name, priority, reliability) VALUES (19005, 1, NULL, NULL, 'InfoBlox: ClientUpdateDenied' , 1, 1);

