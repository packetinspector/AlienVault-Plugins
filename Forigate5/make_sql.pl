#!/usr/bin/perl
use File::Slurp;
#Uncomment if you use all the fancy debug
#use Term::ANSIColor qw(:constants);
use feature 'switch';

#filename
my $file = "forti506.extra.txt";
#plugin id
my $pid = 90009;
#
my $name_prefix = 'Fortigate: ';

#slurp, its just easy...
my $text = read_file($file);
#slurp, its just easy...
#my $sids = read_file('all.sids');

#sql statement to output
my $sql_header = "INSERT IGNORE INTO `plugin_sid` (`plugin_id`, `sid`, `category_id`, `subcategory_id`, `reliability`, `priority`, `name`) VALUES ";
my $sql_out = "($pid, %s, %s, %s, %s, %s, '%s');";

#Default values for rel and pri
my $default_r = 1;
my $default_p = 1;


#Feel free to change these...
my %pri_hash = ( 'alert' => 4, 'critical' => 5, 'debug' => 1, 'error' => 3, 'information' => 1, 'notice' => 2, 'warning' => 3);

#Log ID: 2 Log Message: allowed message Category: Traffic Log (tlog) Subcategory: forward Level/Severity: notice
#while ($text =~ /Log\sID:\s(\d+)\sLog\sMessage:\s(.*?)\sCategory:(.*?)\sSubcategory:\s(.*?)\/Severity:\s(.*)/g) {
while ($text =~ /^(\d{5})\s+([a-z]+)\s+([a-z]+)(.*)$/mg) {
#while ($sids =~ /(\d{5})/g) {
#	$sid1 = $1;
#	print $sid1;
#	if ( $text =~ m/$sid1.*?([a-z]+).*?([a-z]+)\s(.*?)\d{5}/sm ) {
		#Print Fancy Debug
		#print GREEN, "Logid:", RESET, " $1", GREEN, " Message: ", RESET, "$2", GREEN,  " Category: ", RESET, "$3 ", GREEN, "Subcat:", RESET, "$4 ", GREEN, "Severity: ", RESET "$5\n";
		#Put in hash
		$name = substr $4, -30;
		my %log_entry = ( sid => $1, cat => $3, subcat => $3, rel => $default_r, sev => $2, name => $name );
		$name =~ s/[\[\]\=\#\"\%\:]//g;
		$name =~ s/\w\s{2,}//;
		$name =~ s/^[a-z\.]\ //; 
		$log_entry{'name'} = $name;
		
		#$name =~ s/\n//g;
		#print "---$name---\n";
		
		#Trim Spaces and non-ascii because they are lame	
		s/^\s+|\s+$//g for(%log_entry);
		s/[^[:ascii:]]|[\`\'\"]//g for(%log_entry);
		#Substitue Severity
		my $match = $log_entry{'sev'}; #Cant put a hash var inside a key ref, wtf
		if (defined $pri_hash{$match}) {
			$log_entry{sev} = $pri_hash{$match};
		} else {
			$log_entry{sev} = $default_p;
		}
		#Attempt Taxonomy
		given($log_entry{cat}) {
			when (/traffic/i) { $log_entry{cat} = 8; $log_entry{subcat} = 188; }
			when (/webfilter/i) { $log_entry{cat} = 13; $log_entry{subcat} = 115; }
			when (/virus/i) { $log_entry{cat} = 12; $log_entry{subcat} = 97; }
			when (/attack/i) { $log_entry{cat} = 15; $log_entry{subcat} = 171; }
			when (/email/i) { $log_entry{cat} = 13; $log_entry{subcat} = 149; }
			when (/voip/i) { $log_entry{cat} = 14; $log_entry{subcat} = 169; }
			default {$log_entry{cat} = 'NULL'; $log_entry{subcat} = 'NULL';}
		}
		
		#Show results
		#print "SID: $log_entry{sid} NAME: $log_entry{name} CAT: $log_entry{cat} PRI: $log_entry{sev}\n";
		print $sql_header;
		printf $sql_out, $log_entry{sid}, $log_entry{cat}, $log_entry{subcat}, $log_entry{rel}, $log_entry{sev}, "$name_prefix$log_entry{name}";
		print "\n";
	}
#}
