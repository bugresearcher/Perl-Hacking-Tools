#!/usr/bin/perl
#Coded By AlpHaNiX
#contact : AlpHa[AT]Hacker[.]Bz
#HomePage : NullArea.Net

use IO::Socket::INET ;
use LWP::UserAgent;
use LWP::Simple;
use XML::Simple;
use Digest::MD5 qw(md5_hex);
use MIME::Base64;

#########BOT CONFIG START########
my $server = "irc.nullarea.com";
my $port = "6667";
my $nick ="AlpHa[1]";
my $name = "nix user alpha unr";
my $channel = "#alphanix";
#########BOT CONFIG END#########

system('cls');
print "\n\n\n\n OOO  OOO           OO    OO        OO\n" ;
print "  OO   O             O     O         O\n" ;
print "  O O  O  OO  OO     O     O        O O   OO OOO   OOOO    OOOOO\n" ;
print "  O  O O   O   O     O     O        OOO    OO     OOOOOO       O\n" ;
print "  O   OO   O   O     O     O       O   O   O      O       OOOOOO\n" ;
print " OOO  OO   OOOOO   OOOOO OOOOO    OOO OOO OOOOO    OOOOO  OOOO OO\n" ;
print " \n\n                                                    IRC BOT V0.1 \n\n";
print "\n [+] Connection To $server ....\n";

#--------Connection To The Server
$connection = IO::Socket::INET->new(PeerAddr=>"$server",
			                        PeerPort=>"$port",
			                        Proto=>'tcp',
			                        Timeout=>'30') or print " [!] Couldnt Connect To $server\n";
print " [+] Connected  To $server ....\n\n";
#--------Authentication !							 
print $connection "USER $name\n";
print $connection "NICK $nick\r\n";

#--------Commands
while($response = <$connection>)
{ 
   #-------- if you wanna see IRC screen ! --{optional}--
   print $response;
   
   #Join Channel
     if($response =~ m/:(.*) 00(.*) (.*) :/) 
     {
	  print $connection "JOIN $channel\r\n";
	 }
   
    #--------Print Help
	 if($response =~ m/:!help/) 
	 {
	 print $connection "PRIVMSG $channel :8,1 Help : \r\n";
	 print $connection "PRIVMSG $channel :4,1 --------------== Channel Operations ==-------------\r\n";
	 print $connection "PRIVMSG $channel :9,1 Give AOP ,remove         => : 11,1  !op/!deop nick     \r\n";
	 print $connection "PRIVMSG $channel :9,1 Give HOP ,remove         => : 11,1  !hop/dehop nick    \r\n";
	 print $connection "PRIVMSG $channel :9,1 Give Voice,remove        => : 11,1  !voice/!devoice    \r\n";
	 print $connection "PRIVMSG $channel :9,1 ban,kick                 => : 11,1  !ban/!kick nick-res\r\n";
	 print $connection "PRIVMSG $channel :9,1 Change Topic             => : 11,1  !topic new topic   \r\n";
	 print $connection "PRIVMSG $channel :4,1 --------------== Encoding Services ==--------------\r\n";
	 print $connection "PRIVMSG $channel :9,1 To Generate an  MD5 Hash => : 11,1  !md5 word          \r\n";
	 print $connection "PRIVMSG $channel :9,1 To Crack an MD5 Hash     => : 11,1  !md5crack Hash     \r\n";
	 print $connection "PRIVMSG $channel :9,1 To Encode with Base64    => : 11,1  !base64 word       \r\n";
	 print $connection "PRIVMSG $channel :9,1 To Decode Base64         => : 11,1  !basedecode base64 \r\n";
	 print $connection "PRIVMSG $channel :4,1 ----------------== Other Services ==---------------\r\n";
	 print $connection "PRIVMSG $channel :9,1 Check IP Location        => : 11,1  !iplocation ip     \r\n";
	 print $connection "PRIVMSG $channel :9,1 Get lastest Sploits      => : 11,1  !lastsploits       \r\n";
	 }   
	 
    #-------Voice Some One   
   	 if($response =~ m/:(.*)!~(.*):!voice (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel +v ".$asked;
	 }
	 
	#-------Devoice Some One   
   	 if($response =~ m/:(.*)!~(.*):!devoice (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel -v ".$asked;
	 }
	 
    #-------Hop Some One   
   	 if($response =~ m/:(.*)!~(.*):!hop (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel +h ".$asked;
	 }	 

    #-------Remove HOP Some One   
   	 if($response =~ m/:(.*)!~(.*):!dehop (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel -h ".$asked;
	 }	 

    #------AOP Some One   
   	 if($response =~ m/:(.*)!~(.*):!op (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel +o ".$asked;
	 }	
	 
    #------DEOP Some One   
   	 if($response =~ m/:(.*)!~(.*):!deop (.*)$/) 
	 {
	 my $asked = $3;
	 print $connection "Mode $channel -o ".$asked;
	 }
	 
	#------Change Channel TOPIC 
   	 if($response =~ m/:(.*)!~(.*):!topic (.*)/) 
	 {
	 print $connection "Topic $channel ".$3;
	 }

	#------Kick
   	 if($response =~ m/:(.*)!~(.*):!kick (.*)-(.*)/) 
	 {
	 my $kick = $3;
	 my $reason = $4 ;
	 print $connection "Kick $channel ".$kick." ".$reason;
	 }
	 
	#------Ban
   	 if($response =~ m/:(.*)!~(.*):!ban (.*)/) 
	 {
	 my $ban = $3;
	 print $connection "ban $channel ".$ban;
	 }	
	 
    #--------MD5 Generator
	 if($response =~ m/:(.*)!~(.*):!md5 (.*)$/) 
	 {
	 my $md5_hash = $3;
	 my $asker = $1;
	 my $md5_generated = md5_hex($md5_hash);
	 print $connection "PRIVMSG $channel :4$asker , done =>6 $md5_generated\r\n";
	 }
	 
    #--------MD5 Cracker
    if($response =~ m/:(.*)!~(.*):!md5crack (.*)$/) 
	{
	 my $asker = $1;
	 my $hash = $3;
	 if (length($hash) != 33) {print $connection "PRIVMSG $channel :Not Valid MD5 Hash !\r\n";}
	 else {
	 my $ua = LWP::UserAgent->new();
	 my $contents = $ua->get('http://md5.rednoize.com/?p&s=md5&q='.$hash);
	 my $cracked = $contents->content;
	   if ($cracked){print $connection "PRIVMSG $channel :4$asker Cracked ! =>6 $cracked\r\n";}
	   else {print $connection "PRIVMSG $channel :Not Found !\r\n";}
	     }
	}
	
    #--------Base64 Encoder
	 if($response =~ m/:!base64 (.*)$/) 
	 {
	 my $base64 = $1;
	 my $base64_encoded = encode_base64($base64);
	 print $connection "PRIVMSG $channel :$base64_encoded\r\n";
	 }
	
	#--------Base64 decoder
	 if($response =~ m/:!basedecode (.*)$/) 
	 {
	 my $base64d = $1;
	 my $base64_decoded = decode_base64($base64d);
	 print $connection "PRIVMSG $channel :$base64_decoded\r\n";
	 }
	 
	#--------IP Adress Location
    if($response =~ m/:(.*)!~(.*):!iplocation (.*)$/) 
	{
	 my $asker = $1;
	 my $ip = $3;
	 if (length($ip) > 17) {print $connection "PRIVMSG $channel :6Not Real IP !\r\n";}
	 else {
	 my $ua = LWP::UserAgent->new();
	 my $contents = $ua->get('http://www.melissadata.com/lookups/iplocation.asp?ipaddress='.$ip);
	 my $found = $contents->content;
	 if ($found =~ /<tr><td align="right">Country<\/td><td><b>(.*)<\/b><\/td><\/tr>/)
	 {print $connection "PRIVMSG $channel :4$asker , The IP Location =>6 $1\r\n";} 
     else {print $connection "PRIVMSG $channel :6Not Real IP !\r\n";}
	     }
	}
	
	#-------- Milw0rm Lastest Exploits
	if ($response =~m/:!lastsploits/)
	{ 
	 my $rss = get('http://milw0rm.com/rss.php');
     my $xml = XMLin($rss);
     my $spl = scalar(@{$xml->{channel}->{item}}); 
     for ($i=0; $i<$spl; $i++)
     {
	  print $connection "PRIVMSG $channel :4\n";
      print $connection "PRIVMSG $channel :6Date : $xml->{channel}->{item}->[$i]->{pubDate}\n";
      print $connection "PRIVMSG $channel :6Title: $xml->{channel}->{item}->[$i]->{title}\n";
      print $connection "PRIVMSG $channel :6Link : $xml->{channel}->{item}->[$i]->{link}\n\n";
     }; 
	}
	
	#-------- if any one say "hello" the bot respond ! 
	if(($response =~ /PRIVMSG #/ ) && ($response =~ /hello/i))	
	{ 
	 print $connection "PRIVMSG $channel :Hello \r\n";
	}
	
	#--------Sayin Welcome to AnyOne Join The Channel
	if( $response =~ m/:(.*)!~(.*) JOIN :/) 
	{
	 my $rc = $1 ;
     print $connection "PRIVMSG $channel :Welcome $rc\r\n";	 
	}
	
	#--------responding to the ping to stay connected !
	if($response =~ m/^PING (.*?)$/gi)
	{
	 print $connection "PONG ".$1."\r\n";
	}
}