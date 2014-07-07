#!/usr/bin/perl

use strict;
use DBI();
use Getopt::Std;
use vars qw/ %opt /;

#Set some globals
my $plugin_id = 90040;
my $plugin_name = 'WarningsErrors';
my %sev_map = ('info' => 3, 'warning' => 5, 'error'=> 10);
my $pri = 5;

#Setup Syslog
#If you have an external sensor hard code address to it!  This makes it report as server IP...
my $loghost = `/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`;
my $sysloginfo = 'info|local6';

#Command Line Switches
$Getopt::Std::STANDARD_HELP_VERSION = 1;
getopts('spvc', \%opt);


#Ripped from ossim-db
my $user = `grep ^user= /etc/ossim/ossim_setup.conf | cut -f 2 -d "=" | sed '/^\$/d'`;
my $pass = `grep ^pass= /etc/ossim/ossim_setup.conf | cut -f 2 -d "=" | sed '/^\$/d'`;
#Sed should do this but just in case...
chomp($user);chomp($pass);
#Init DB. We'll use this everytime
my $dbh = DBI->connect("DBI:mysql:database=alienvault_api;host=127.0.0.1",$user, $pass, {'RaiseError' => 1});
#Using debug?
my $debug = defined($opt{'v'});

if ($opt{'s'}) {
	#Time to make the donuts
	make_sql();
	exit;
}

if ($opt{'p'}) {
	#No witty comment here
	make_plugin();
	exit;
}

if ($opt{'c'}) {
	check();
}

sub check () {
	 use Sys::Syslog;                        
	 use Sys::Syslog qw(:extended :macros); 
	 setlogsock('udp', $loghost);
	 openlog($plugin_name, '', $sysloginfo);
	 syslog($sysloginfo, 'Test') if $debug;
	 my $query = "select message_id, hex(component_id) as component, component_type,UNIX_TIMESTAMP(creation_time) as ct from current_status";
	 my $results = $dbh->selectall_arrayref($query, { Slice => {} }) or die $dbh->errstr;
	 syslog($sysloginfo, 'No Results Found') if ($debug && scalar(@$results) == 0);
	 foreach my $message ( @$results ) {
	 	 my $string = $message->{message_id} . ',' . $message->{ct};
	 	 if ($message->{component_type} =~ /(system|server|host)/) {
	 	 	 #system and host seem to get used the same, not sure if that's right....
	 	 	 $query = "SELECT inet6_ntoa(ip) as ip FROM alienvault.server where id = unhex('" . $message->{component} . "')";
	 	 	 my @ip = @{$dbh->selectcol_arrayref($query)};
	 	 	 if (scalar(@ip) == 0) {
	 	 	 	 #Not a server try again
	 	 	 	 $query = "select inet6_ntoa(i.ip) as ip from alienvault.host_ip i, alienvault.host h WHERE h.id = i.host_id and h.id = unhex('" . $message->{component} . "')";
	 	 	 	 @ip = @{$dbh->selectcol_arrayref($query)};
	 	 	 }
	 	 	 $string .= ',' . $ip[0];
	 	 }
	 	 	 
	 	 syslog($sysloginfo, $string);
	 }
	 	 
	 closelog();
}


sub make_sql () {
	#In theory this script could just insert directly, but I thought it might be more flexible to just output it
	
	my $sql_out = "INSERT INTO `plugin_sid` (`plugin_id`,`sid`,`reliability`, `priority`, `name`) VALUES ($plugin_id, %s, %s, $pri, '%s');\n";
	my $host_query = 'select * from status_message';
	my $sth = $dbh->prepare($host_query);
	$sth->execute();
	#Print Header
	print "DELETE FROM plugin WHERE id = '$plugin_id';\n";
	print "DELETE FROM plugin_sid where plugin_id = '$plugin_id';\n";
	print "INSERT IGNORE INTO software_cpe VALUES ('cpe:/h:$plugin_name:$plugin_name:-', '$plugin_name', '1.0' , '$plugin_name $plugin_name 1.0', '$plugin_name', '$plugin_name:$plugin_id');\n";
	print "INSERT IGNORE INTO plugin (id, type, name, description,product_type,vendor) VALUES ($plugin_id, 1, '$plugin_name', '$plugin_name',17,'AlienVault');\n";
	#Echo loop sids
	while (my $ref = $sth->fetchrow_hashref()) {
		printf $sql_out,  $ref->{'id'}, $sev_map{$ref->{'level'}} , substr($ref->{'description'},0,52);
	}
}

sub make_plugin () {
	use File::Basename;
	use Cwd 'abs_path';
	my $script = basename($0);
	my $fullpath = abs_path($0);
	print <<EOF
# Alienvault plugin
# Author: js
# Plugin $plugin_name id:$plugin_id version: 1.0
[DEFAULT]
plugin_id=$plugin_id

[config]
type=detector
enable=yes

source=log
location=/var/log/$script.log

# create log file if it does not exists,
# otherwise stop processing this plugin
create_file=false

process=$script
start=yes   ; launch plugin process when agent starts
stop=no     ; shutdown plugin process when agent stops
restart=yes  ; restart plugin process after each interval
restart_interval=180
startup=$fullpath
shutdown=


[simplematch]
event_type=event
regexp="(?P<sid>\d+)\,(?P<date>\d+),(?P<src_ip>\d+\.\d+\.\d+\.\d+)"
plugin_sid={\$sid}
date={normalize_date(\$date)}
src_ip={\$src_ip}
EOF
}
	

sub HELP_MESSAGE { print " -s Make the SQL for plugin: $0 -s | ossim-db\n -p Make the plugin: $0 -p > /etc/ossim/agent/plugins/$plugin_name.cfg\n -c Do the Check\n -v Be Verbose\n"; }
sub VERSION_MESSAGE { print "WE to SIEM\n"; }




