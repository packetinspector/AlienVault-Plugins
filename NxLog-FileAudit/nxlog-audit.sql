DELETE FROM plugin WHERE id = "90015";
DELETE FROM plugin_sid where plugin_id = "90015";

insert ignore into software_cpe VALUES ('cpe:/h:nxlog:fileaudit:-', 'Nxlog', '1.0' , 'Windows File Audit', 'NxLog', 'nxlog-audit:90015');


INSERT IGNORE INTO plugin (id, type, name, description) VALUES (90015, 1, 'nxlog-audit', 'NxLog Windows File Audit');

INSERT IGNORE INTO plugin_sid (plugin_id, sid, name) VALUES
(90015, 1537, 'WFA: File Deleted'),
(90015, 4417, 'WFA: File Written'),
(90015, 4418, 'WFA: File Changed'),
(90015, 1539, 'WFA: File Permission Changed'),
(90015, 20000, 'WFA: Unknown Log'),
(90015, 2000000000, 'WFA: Unknown Action')

