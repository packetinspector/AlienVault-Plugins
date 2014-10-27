DELETE FROM plugin WHERE id = "90015";
DELETE FROM plugin_sid where plugin_id = "90015";


INSERT IGNORE INTO plugin (id, type, name, description,product_type,vendor) VALUES (90015, 1, 'ntopng', 'NtopNG',19,'ntop');
insert ignore into software_cpe VALUES ('cpe:/h:ntopng:ntopng:-', 'ntopng', '1.x' , 'Ntop NtopNG 1.2', 'ntopng', 'ntopng:90015');



INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90015, 100, 9, 70, 1, 2, 'ntopng: Threshold for Bytes Exceeded');
INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90015, 101, 9, 70, 1, 2, 'ntopng: Threshold for DNS Exceeded');
INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90015, 102, 9, 70, 1, 2, 'ntopng: Threshold for P2P Exceeded');
INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90015, 103, 9, 70, 1, 2, 'ntopng: Threshold for Packets Exceeded');
INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90015, 200, 9, 70, 1, 2, 'ntopng: Host Flooder');