DELETE FROM plugin WHERE id = "90050";
DELETE FROM plugin_sid where plugin_id = "90050";

INSERT IGNORE INTO plugin (id, type, product_type, name, description) VALUES (90050, 2,19, 'Monitor-Match', 'Grep Match');
INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES (90050, 2, 8, 188, 1, 2, 'Matched Threat Info');
#insert into software_cpe VALUES ('cpe:/a:alienvault:monitor:-','Monitor-Match','-','AlienVault Monitor -', 'PI', 'superbasic-monitor:90050');
