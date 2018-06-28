#!/usr/bin/perl 
#
# FtpAnonScanner v1.0 Gui Edition
#
# InfoZ:
# Scanner by : Perforin
# Gui by : ShaQ
# 
# SiteZ:
# VXnet.bis / VXnet.ws
# virii.lu
# ShaQ.1x.to

use Tk;
use Net::FTP;

$version = "1.0";
$pub_count = 0;
$main = MainWindow->new(-bg=>'black');

$main->title("FTPAnonScanner $version Gui Edition");
$main->resizable ('0','0');

$header = $main->Photo(-file=>"header.gif", -format=>"gif");
$header = $main->Label(-image=>$header, -borderwidth=>0)
	->pack(-side=>'top');
		
$frame_a = $main->Frame(-bg=>'black')
	->pack(-side=>'top');

$frame_a->Label(-text=>"Start Ip:",-bg=>'black',-foreground=>'#cccccc')
	->pack(-side=>'left');
		    
$entry_start = $frame_a->Entry(-width=>30, -bg=>'black', -foreground=>'red', -text=>'211.43.205.90')
	->pack(-side=>'left');
	
$frame_b = $main->Frame(-bg=>'black')
	->pack(-side=>'top');

$frame_b->Label(-text=>" End Ip:",-bg=>'black',-foreground=>'#cccccc')
	->pack(-side=>'left');
		    
$entry_stop = $frame_b->Entry(-width=>30, -bg=>'black', -foreground=>'red', -text=>'211.43.205.100')
	->pack(-side=>'left');

$frame_c = $main->Frame(-bg=>'black')
	->pack(-side=>'top');

$list = $frame_c->Scrolled('Text', -bg=>'black', -foreground=>'red',-width=>34, -height=>8, -scrollbars => 'oe')
	->pack(-side=>'top',
		     -pady=>3);

$ip_state = $frame_c->Label(-text=>"Current Ip:",-bg=>'black',-foreground=>'#cccccc')
	->pack(-side=>'left');
	
$count = $frame_c->Label(-text=>"  Pubs: 0",-bg=>'black',-foreground=>'#cccccc')
	->pack(-side=>'left');

$frame_d = $main->Frame(-bg=>'black')
	->pack(-side=>'top');

$scan_start = $frame_d->Button(-width=>34, -text=>'Start scan', -bg=>'black', -activebackground=>'red', -foreground=>'#cccccc',-command=>\&start_scan)
	->pack(-side=>'top',
		     -pady=>5);

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
===================================
== FTP Anon Scanner v$version Gui Edition  ==
===================================
BANNER
&scan;
}

sub scan {
if ($ipstart =~ $ipstop) { &stop_scan }
if ($i<$t4+1) {
$ipstart=$s1.".".$s2.".".$s3.".".$i;
	$list->insert('end',"$ipstart : Not a Pub\n");
	$ip_state->configure(-text=> "Current Ip : $ipstart");
	$main->update;
$ftp = Net::FTP->new("$ipstart",Debug => 0,Timeout => 1) || $i++ & &scan;
$ftp->login("anonymous","welcome@hell.us") || $i++ & &scan;
$ftp->quit;
	$pub_count++;
	$list->insert('end',"$ipstart : FOUND A PUB\n");
	$count->configure(-text=> "  Pubs: $pub_count");
	print "\a";
	print RES "$ipstart\n";
$i++;
&scan;
	}

}

sub stop_scan {
close(RES);
$main->messageBox (-title=>"Done", -message=>"Done\n $pub_count found!");
}



