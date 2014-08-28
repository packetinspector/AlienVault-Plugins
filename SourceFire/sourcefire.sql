INSERT IGNORE INTO software_cpe VALUES ('cpe:/h:Sourcefire:Sensor:-', 'Sensor', '5.x' , 'Sourcefire DefenseCenter 5.x', 'Sourcefire', 'sourcefire:90025');
INSERT IGNORE INTO software_cpe VALUES ('cpe:/h:Sourcefire:Defense Center:-', 'Defense Center', '5.x' , 'Sourcefire DefenseCenter 5.x', 'Sourcefire', 'sourcefire:90025');
DELETE FROM plugin WHERE id = '90025';
DELETE FROM plugin_sid where plugin_id = '90025';
INSERT IGNORE INTO plugin (id, type, name, description,product_type,vendor) VALUES (90025, 1, 'SourceFire DC', 'SourceFire DefenseCenter',17,'SourceFire');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 100, 5, 1, 'SfDC: Audit and Policy Activity');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 101, 5, 1, 'SfDC: Rule Update');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 200, 5, 1, 'SfDC: Task Success');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 201, 5, 3, 'SfDC: Task Failure');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 300, 5, 1, 'SfDC: Logout Success');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 301, 5, 1, 'SfDC: Login Success');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 310, 5, 3, 'SfDC: Login Failure');
INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES (90025, 311, 5, 3, 'SfDC: Logout Failure');

