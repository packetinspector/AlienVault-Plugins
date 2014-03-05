-- WSA
-- plugin_id: 8900

DELETE FROM plugin WHERE id = 8900;
DELETE FROM plugin_sid where plugin_id = 8900;

INSERT IGNORE INTO `plugin` (`id` , `type` , `name` , `description` , `vendor`, `product_type`) VALUES ('8900', '1', 'IronPort WSA', 'Cisco', 'WSA Proxy', '22');

INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `reliability`, `priority`, `name`) VALUES
(8900, 100, 1, 1, 'WSA: Proxy allowed based on Applications settings for the Access Policy'),
(8900, 101, 1, 1, 'WSA: Proxy allowed to an IronPort notification page'),
(8900, 102, 1, 1, 'WSA: Proxy allowed based on custom URL category filtering settings'),
(8900, 103, 1, 1, 'WSA: Proxy allowed based on Reputation filter settings for the Access'),
(8900, 104, 1, 1, 'WSA: Proxy blocked based on Applications or Objects settings'),
(8900, 105, 1, 1, 'WSA: Proxy blocked based on the TCP port of the destination as defined'),
(8900, 106, 1, 1, 'WSA: Proxy blocked based on the user agent as defined'),
(8900, 107, 1, 1, 'WSA: Proxy blocked based on the MIME type of the request body content'),
(8900, 108, 1, 1, 'WSA: Proxy blocked based on the file type as defined in the Access Policy'),
(8900, 109, 1, 1, 'WSA: Proxy blocked based on the protocol as defined'),
(8900, 110, 1, 1, 'WSA: Proxy blocked based on the size of the response as defined'),
(8900, 111, 1, 1, 'WSA: Proxy blocked based on the size of the request body content'),
(8900, 112, 1, 3, 'WSA: Proxy blocked the request based on the Anti-Malware settings Site: USERDATA4'),
(8900, 113, 1, 3, 'WSA: Proxy blocked the response based on the Anti-Malware settings Site: USERDATA4'),
(8900, 114, 1, 2, 'WSA: Proxy suspects the URL in the HTTP request might not be safe'),
(8900, 115, 1, 1, 'WSA: Proxy blocked based on the configured Application settings'),
(8900, 116, 1, 1, 'WSA: Proxy blocked based on the site content ratings settings'),
(8900, 117, 1, 1, 'WSA: Proxy blocked and displayed the Warn and Continue page'),
(8900, 118, 1, 1, 'WSA: Proxy blocked and displayed the Warn and Continue page'),
(8900, 119, 1, 1, 'WSA: Proxy blocked and displayed the Warn and Continue page'),
(8900, 120, 1, 1, 'WSA: Proxy blocked based on custom URL category filtering settings Site: USERDATA4'),
(8900, 121, 1, 1, 'WSA: Proxy blocked the request based on the verdict of the external DL'),
(8900, 122, 1, 1, 'WSA: The client request included an unsafe search query and the Access'),
(8900, 123, 1, 2, 'WSA: Proxy blocked based on the Suspect User Agent setting for the Acc'),
(8900, 124, 1, 1, 'WSA: Proxy blocked based on the safe search settings for the Access Po'),
(8900, 125, 1, 3, 'WSA: Proxy blocked based on Reputation filter settings for the Access'),
(8900, 126, 1, 5, 'WSA: Proxy blocked the upload request based on Reputation filter'),
(8900, 127, 1, 1, 'WSA: Proxy blocked based on URL category filtering settings Site: USERDATA4'),
(8900, 128, 1, 1, 'WSA: Proxy blocked the upload request based on the URL category filter'),
(8900, 129, 1, 1, 'WSA: Proxy allowed the client to access the server because no action taken'),
(8900, 130, 1, 1, 'WSA: Proxy monitored the server response based on the Anti-Malware'),
(8900, 131, 1, 1, 'WSA: Proxy suspects the URL in the HTTP request might not be safe'),
(8900, 132, 1, 1, 'WSA: Proxy monitored based on the Application settings for the Access'),
(8900, 133, 1, 1, 'WSA: Originally Proxy blocked and displayed the Warn and Continue page'),
(8900, 134, 1, 1, 'WSA: Originally Proxy blocked and displayed the Warn and Continue page'),
(8900, 135, 1, 1, 'WSA: Originally Proxy blocked and displayed the Warn and Continue page'),
(8900, 136, 1, 1, 'WSA: Proxy scanned the upload request using either a Data Security Pol'),
(8900, 137, 1, 1, 'WSA: Proxy monitored based on the Suspect User Agent setting for the A'),
(8900, 138, 1, 1, 'WSA: Proxy monitored based on Reputation filter settings for the Acces'),
(8900, 139, 1, 1, 'WSA: Proxy did not allow the user access to the SaaS application becau'),
(8900, 140, 1, 1, 'WSA: The user failed authentication.  User: USERNAME'),
(8900, 141, 1, 1, 'WSA: Proxy redirected to a different URL based on a custom URL categor'),
(8900, 142, 1, 1, 'WSA: Proxy allowed the user access to the SaaS application because the'),
(8900, 143, 1, 1, 'WSA: Proxy did not complete the request due to an error')