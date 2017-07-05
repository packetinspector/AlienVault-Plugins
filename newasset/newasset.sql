# Alienvault plugin
# Author: Castra Consulting LLC at info@castraconsulting.com
# Original plugin written by Joe S. @Alienvault: https://twitter.com/pkt_inspector
# Plugin New_Asset id:9720 version: 0.2
# Last modification: 2016-02-29 10:10

DELETE IGNORE FROM plugin WHERE id = "9720";
DELETE IGNORE FROM plugin_sid where plugin_id = "9720";
DELETE IGNORE FROM plugin WHERE id=9720;
DELETE IGNORE FROM plugin_sid where plugin_id=9720;


INSERT IGNORE INTO plugin (id, type, name, description, product_type, vendor) VALUES (9720, 1, 'New_Asset', 'Custom New_Asset', 10, 'New_Asset');
INSERT IGNORE INTO plugin_sid (plugin_id, sid, class_id, reliability, priority, name, subcategory_id, category_id) VALUES (9720, 21, NULL, 5, 5, 'New_Asset: New asset discovered', 71, 10);
INSERT IGNORE INTO plugin_sid (plugin_id, sid, class_id, reliability, priority, name, subcategory_id, category_id) VALUES (9720, 31, NULL, 1, 1, 'New_Asset: Other Info', 71, 10);

    Contact GitHub API Training Shop Blog About 

    © 2017 GitHu
