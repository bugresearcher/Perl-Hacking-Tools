#!/usr/bin/perl 
#
# FtpAnonScanner v2.0 Gui Edition
#
# InfoZ:
# Anon Scanner by : Perforin
# Port Scanner by : ashmalviya_007 & ^tip-toe
# Updated Gui by : ^tip-toe & shaQ
# 
# SiteZ:
# VXnet.bis / VXnet.ws
# virii.lu
# ShaQ.1x.to
#
# Email: ^tip-toe [at] theone1limit{at}yahoo[dot]com for any questions or comments on the "V2.0 interface" design.
# 
#########################################################################################################
#
#   COMMENTs:
#   Changed colors for an added feature.
#   Changed a few labels, to get a game feel.
#   Added a _Last Log_ button, displays "last scan" results from Results.txt
#   Added a Port Scanner: Reason you might ask?
#   I wanted the possibility to scan the Anon Account for possible access to telnet,www,ssh,and ect.. 
#
######################################################################################################### 

use Tk;
use Tk::PNG;
use Net::FTP;
use IO::Socket;

$version = "2.0";
$pub_count = 0;
$main = MainWindow->new(-bg=>'black');

$main->title("FTPAnonScanner $version Gui Edition");
$main->resizable ('0','0');

$header = $main->Photo(-file=>"header.png", -format=>"png");
$header = $main->Label(-image=>$header, -borderwidth=>0)
->pack(-side=>'top');

$main->Label(-width=>14,-foreground=>'#FFF000',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-text => "  Enter Ip: ",-background => "black",-foreground => "#FFF000",-font => "verdana 7"
)->pack(-anchor => "n");

$main->Entry(-textvariable => \$ip,-width=>31, -bg=>'black', -foreground=>'red',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-relief=>"groove", -background => "black",
)->pack(-anchor => "n");

$main->Label(-foreground=>'#00CCFF',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-text => "  Start Port: ", -background => "black",-foreground => "#FFF000",-font => "verdana 7"
)->pack(-anchor => "n");

$main->Entry(-textvariable => \$from,-width=>31, -bg=>'black', -foreground=>'red',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-relief=>"groove", -font => "verdana 7",
)->pack(-anchor => "n");

$main->Label(-width=>14,-foreground=>'#00CCFF',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-text => "  End Port: ",-background => "black",-foreground => "#FFF000",-font => "verdana 7"
)->pack(-side=>'top');

$main->Entry(-textvariable => \$to,     -width=>31, -bg=>'black', -foreground=>'red',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-relief=>"groove",-font => "verdana 7"
)->pack(-anchor => "n");

$main->Button(-width=>10,-foreground=>'#00CCFF',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 8,-relief=>"raised",-borderwidth=>"6",-relief=>"raised",-text => "[ PORT SCAN ]",-background => "black",-foreground => "yellow",-activebackground => "red",-activeforeground => "white",-command => sub
{
if ((!$to) || (!$ip) || (!$from))
{

$end = MainWindow->new(-background => "black");
$end->title("Scan Result");
$end->minsize(240,50);
$end->Label(-text => "Bad Function",-background => "black",-foreground => "#0099ff",-font => "verdana 7"
)->pack(-anchor => "n");

}

for($ports = $from; 
$ports <= $to; 
$ports++)
{
$xyz = 1;
my $conn = IO::Socket::INET->new(Proto => "tcp",
#Proto => "udp",
PeerPort => $ports,
PeerAddr => $ip,
Timeout => 1
) || $xyz++;

close($conn);

if($xyz==1)
{
chomp($gethost = getservbyport($ports,"tcp"));

$main = MainWindow->new(-background => "black");

$main->title("Result");

$main->minsize(220,40);

$main->Label(-text => "Open Port: [$ports] 
Protocol: $gethost \n ",-background => "black",-foreground => "red",-font => "verdana 7")->pack(-anchor => "n");

}

}

})->pack(-anchor => "n");

$frame_k = $main->Frame(-bg=>'black')->pack(-side=>'top');

$frame_k->Label(-text=>"  space",-bg=>'black',-foreground=>'black')->pack(-side=>'left');

$frame_a = $main->Frame(-bg=>'black')->pack(-side=>'top');

$frame_a->Label(-text=>"Start Ip:",-bg=>'black',-foreground=>'#FFFF00')->pack(-side=>'left');

$entry_start = $frame_a->Entry(-width=>31, -bg=>'black', -foreground=>'red',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-relief=>"groove", -text=>'211.43.205.90')->pack(-side=>'left');

$frame_b = $main->Frame(-bg=>'black')->pack(-side=>'top');

$frame_b->Label(-text=>"  End Ip:",-bg=>'black',-foreground=>'#FFFF00')->pack(-side=>'left');

$frame_g = $main->Frame(-bg=>'black')->pack(-side=>'top');

$frame_g->Label(-text=>"  space",-bg=>'black',-foreground=>'black')->pack(-side=>'left');

$entry_stop = $frame_b->Entry(-width=>31, -bg=>'black', -foreground=>'red',-borderwidth=>"3",-highlightbackground => 'black',-highlightthickness => 3,-relief=>"groove",-borderwidth=>"4",-relief=>"groove", -text=>'211.43.205.100')->pack(-side=>'left');

$frame_c = $main->Frame(-bg=>'black')->pack(-side=>'top');

$list = $frame_c->Scrolled('Text',-borderwidth=>"10",-relief=>"raised", -bg=>'black', -foreground=>'red',-width=>40, -height=>12,-highlightbackground => 'black',-highlightthickness => 2, -scrollbars => 'oe')->pack(-side=>'top',-pady=>2);

$frame_k = $main->Frame(-bg=>'black')->pack(-side=>'top');

$frame_k->Label(-text=>"  space",-bg=>'black',-foreground=>'black')->pack(-side=>'left');

$ip_state = $frame_c->Label(-borderwidth=>"6",-relief=>"groove",-text=>" Computer Ip:",-bg=>'black',-foreground=>'#FFFF00')->pack(-side=>'left');

$count = $frame_c->Label(-borderwidth=>"6",-relief=>"groove",-text=>" HoneyPots: 0",-bg=>'black',-foreground=>'#FFFF00')->pack(-side=>'right');

$frame_e = $main->Frame(-bg=>'black')->pack(-side=>'right');

$stop_scan = $frame_e->Button(-width=>8, -highlightbackground => 'black',-highlightthickness => 8,-borderwidth=>"8",-relief=>"raised",-text=>':::[ EXIT ]:::', -relief=>"raised", -bg=>'black',-activebackground=>'red',-activeforeground=>'white',-foreground=>'red',-command=>\&quit)
->pack(-side=>'right',-pady=>3);

$frame_d = $main->Frame(-bg=>'black')
->pack(-side=>'left');

$scan_start = $frame_d->Button(-width=>8, -highlightbackground => 'black',-highlightthickness => 8,-borderwidth=>"8",-relief=>"raised",-text=>':::[ SCAN ]:::',-relief=>"raised",-bg=>'black',-activeforeground=>'white', -activebackground=>'red', -foreground=>'red',-command=>\&start_scan)
->pack(-side=>'left',-pady=>3);

$frame_z = $main->Frame(-bg=>'black')
->pack(-side=>'left');

$txt = $frame_z->Button(-width=>10, -highlightbackground => 'black',-highlightthickness => 8,-borderwidth=>"6",-relief=>"raised",-text=>'[ Last Log ]', -relief=>"raised", -bg=>'black',-activebackground=>'blue',-activeforeground=>'white',-foreground=>'yellow',-command=>\&open_list)
->pack(-side=>'right',-pady=>3);

sub open_list {
$mw = MainWindow->new;
$txt = $mw->Text (-width=>40,-bg=>'black',-foreground=>'red')->pack ();
open my $fh, '<', 'Results.txt' or die $!;
@contents = <$fh>;
foreach my $line (@contents) {
$txt->insert ("end", $line);
}
}

MainLoop;
		     
sub start_scan {
$state = 'true';
$ipstart = $entry_start->get;
$ipstop = $entry_stop->get;

$ipstart =~ m/(\d\d\d?).(\d\d?\d?).(\d\d?\d?).(\d\d?\d?)/; 
($s1,$s2,$s3,$s4) = ($1,$2,$3,$4); 
$ipstop =~ m/(\d\d\d?).(\d\d?\d?).(\d\d?\d?).(\d\d?\d?)/; 
($t1,$t2,$t3,$t4) = ($1,$2,$3,$4);
$i=$s4;

open(RES,">>","Results.txt");
print RES<<BANNER;
=========S=C=R=O=L=L=A=B=L=E============
== FTP Anon Scanner v$version Gui Edition  ==
========================================
BANNER
&scan;


}

sub scan {
if ($ipstart =~ $ipstop) { &stop_scan }
if ($i<$t4+1) {
$ipstart=$s1.".".$s2.".".$s3.".".$i;
	$list->insert('end'," ftp> $ipstart ~ Closed\n");
	$ip_state->configure(-text=> ")>>> $ipstart <<<(");
	$main->update;
$ftp = Net::FTP->new("$ipstart",Debug => 0,Timeout => 1) || $i++ & &scan;
$ftp->login("anonymous","welcome@hell.us") || $i++ & &scan;
$ftp->quit;
	$pub_count++;
	$list->insert('end'," ftp> $ipstart ~ Anonymous Welcomed\n");
	$count->configure(-text=> " HoneyPots: $pub_count");
	print "\a";
	print RES "$ipstart\n";
$i++;
&scan;
	}

}

sub quit {
exit;
}

sub stop_scan {
$main->messageBox (-width=>30,-height=>4,-highlightbackground => 'black',-highlightthickness => 6,-title=>"Done",-bg=>'black',-foreground=>'red',-borderwidth=>"6",-relief=>"raised",
-message=>" Thank's for Playing\n    [$pub_count] = Located
Check logged Results.txt", 
-borderwidth=>"4",-relief=>"raised",-activebackground=>'green')
->pack(-side=>'left', -pady=>3);
}



