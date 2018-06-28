#!/usr/bin/perl
use LWP::UserAgent;
use HTTP::Request;
use LWP::Simple;

inicio:
$sis="$^O";if ($sis eq linux){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");
system "color 0a";

print "##############################################################\n";
print "#                                                            #\n";
print "#                   Googler v1.69 - Public                   #\n";
print "#                     169 sites na busca                     #\n";
print "#            Busca por string e lista de strings.            #\n";
print "#                    c0d3d by DD3str0y3r.                    #\n";
print "#           Contato: dd3str0y3r[at]hotmail[dot]com           #\n";
print "#                     Brazilians c0d3rs!                     #\n";
print "#                                                            #\n";
print "#    Gr33tz: s4r4d0, dr4k3, _Mlk_, M0nt3r, G3N3SIS, n00F,    #\n";
print "# M4v3rick, w4lly, sYnyst3r, TH1NK3R, Tecnohenry, LEVI4TH4N. #\n";
print "#                                                            #\n";
print "##############################################################\n";

print "\nMenu:\n\n";
print "1. Busca Simples\n";
print "2. Busca com lista de strings\n\n";
print "Opcao: ";
my $opcao=<STDIN>;

if ($opcao==1){&Busca_Simples}
if ($opcao==2){&Busca_Lista}

#################
# Busca Simples #
#################

sub Busca_Simples

{

print "\nDigite a String: ";
chomp($string = <STDIN>);

print "\nDigite quantidade de paginas que deseja obter: ";
chomp($pages = <STDIN>);

proxy:
print "\nDigite o proxy (Ex: 192.168.0.1:80) ou 0 caso nao deseje: ";
chomp($proxy = <STDIN>);

@google = ("www.google.ad",
"www.google.ae",
"www.google.com.af",
"www.google.com.ag",
"www.google.com.ai",
"www.google.am",
"www.google.it.ao",
"www.google.com.ar",
"www.google.as",
"www.google.at",
"www.google.com.au",
"www.google.az",
"www.google.ba",
"www.google.com.bd",
"www.google.be",
"www.google.bg",
"www.google.com.bh",
"www.google.bi",
"www.google.com.bn",
"www.google.com.bo",
"www.google.com.br",
"www.google.bs",
"www.google.co.bw",
"www.google.com.by",
"www.google.com.bz",
"www.google.ca",
"www.google.cd",
"www.google.cg",
"www.google.ch",
"www.google.ci",
"www.google.co.ck",
"www.google.cl",
"www.google.cn",
"www.google.com.co",
"www.google.com",
"www.google.co.cr",
"www.google.com.cu",
"www.google.cz",
"www.google.de",
"www.google.dj",
"www.google.dk",
"www.google.dm",
"www.google.com.do",
"www.google.dz",
"www.google.com.ec",
"www.google.ee",
"www.google.com.eg",
"www.google.es",
"www.google.com.et",
"www.google.fi",
"www.google.com.fj",
"www.google.fm",
"www.google.fr",
"www.google.ge",
"www.google.gg",
"www.google.com.gh",
"www.google.com.gi",
"www.google.gl",
"www.google.gm",
"www.google.gp",
"www.google.gr",
"www.google.com.gt",
"www.google.gy",
"www.google.com.hk",
"www.google.hn",
"www.google.hr",
"www.google.ht",
"www.google.hu",
"www.google.co.id",
"www.google.ie",
"www.google.co.il",
"www.google.im",
"www.google.co.in",
"www.google.is",
"www.google.it",
"www.google.je",
"www.google.com.jm",
"www.google.jo",
"www.google.co.jp",
"www.google.co.ke",
"www.google.com.kh",
"www.google.ki",
"www.google.kg",
"www.google.co.kr",
"www.google.com.kw",
"www.google.kz",
"www.google.la",
"www.google.li",
"www.google.lk",
"www.google.co.ls",
"www.google.lt",
"www.google.lu",
"www.google.lv",
"www.google.com.ly",
"www.google.co.ma",
"www.google.md",
"www.google.me",
"www.google.mn",
"www.google.ms",
"www.google.com.mt",
"www.google.mu",
"www.google.mv",
"www.google.mw",
"www.google.com.mx",
"www.google.com.my",
"www.google.co.mz",
"www.google.com.na",
"www.google.com.nf",
"www.google.com.ng",
"www.google.com.ni",
"www.google.nl",
"www.google.no",
"www.google.com.np",
"www.google.nr",
"www.google.nu",
"www.google.co.nz",
"www.google.com.om",
"www.google.com.pa",
"www.google.com.pe",
"www.google.com.ph",
"www.google.com.pk",
"www.google.pl",
"www.google.pn",
"www.google.com.pr",
"www.google.pt",
"www.google.com.py",
"www.google.com.qa",
"www.google.ro",
"www.google.ru",
"www.google.rw",
"www.google.com.sa",
"www.google.com.sb",
"www.google.sc",
"www.google.se",
"www.google.com.sg",
"www.google.sh",
"www.google.si",
"www.google.sk",
"www.google.com.sl",
"www.google.sn",
"www.google.sm",
"www.google.st",
"www.google.com.sv",
"www.google.co.th",
"www.google.com.tj",
"www.google.tk",
"www.google.tl",
"www.google.tm",
"www.google.to",
"www.google.com.tr",
"www.google.tt",
"www.google.com.tw",
"www.google.co.tz",
"www.google.com.ua",
"www.google.co.ug",
"www.google.co.uk",
"www.google.com.uy",
"www.google.co.uz",
"www.google.com.vc",
"www.google.co.ve",
"www.google.vg",
"www.google.co.vi",
"www.google.com.vn",
"www.google.vu",
"www.google.ws",
"www.google.rs",
"www.google.co.za",
"www.google.co.zm",
"www.google.co.zw");
foreach $google(@google){

my $ua = new LWP::UserAgent;
$ua->agent('Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.8.1.12) Gecko/20080301 Firefox/2.0.0.12');
if($proxy!=0){
$ua->env_proxy();
$ua->proxy("http", "http://$proxy/");}

system("$cmd");

print "\nIniciando busca por: $string\n\n";

for($i=1;$i<$pages;$i++){
my $pedido = new HTTP::Request GET =>"http://$google/search?hl=&q=$string&start=$i";
my $resultado = $ua->request($pedido) or die ">Erro na busca\n";
$ua->timeout(5);
my $result = $resultado->content;

while ($result =~ m/<h2 class=(.*?)><a href=\"(.*?)\" class=(.*?)>/g){
if ($1 !~ /64\..*\|\.google.*|\.orkut|.*\.google.*|\.youtube.*/){
my $sites=$2;

open (LOG, ">>sites.txt");
print LOG "$sites\n";
print "$sites\n";
close(LOG);

}}}}

system("$cmd");

print "\nFiltrando os sites...\n\n";

open(VER,"<sites.txt");
@tudo = <VER>;
close(VER);
system("del sites.txt");

for($a=0;$a<=$#tudo;$a++) {
if($tudo[$a] !~ /=/) {
$tudo[$a] = "";
}
$para = index($tudo[$a],"=") + 1;
$pronto = substr($tudo[$a],0,$para);

open(GRAVA,">>sites.txt");
print GRAVA $pronto,"\n";
}

close(GRAVA);

print "Removendo os sites duplicados...\n\n";

print "Digite o nome do arquivo que deseja salvar os resultados: ";
chomp($save = <STDIN>);

my $origfile = 'sites.txt';
my $outfile = $save;
my %hTmp;

open (IN, "<$origfile");
open (OUT, ">$outfile");

while (my $sLine = <IN>) {
print OUT $sLine unless ($hTmp{$sLine}++);
}
close OUT;
close IN;
system("del sites.txt");

print "\nScan de sites concluido! Resultados salvos em $save\n\n";

print "Aperte ENTER para voltar ao menu principal...\n";
<STDIN>;
goto inicio;

###############
# Busca Lista #
###############

sub Busca_Lista

{

print "\nDigite o nome da lista de strings: ";
chomp($lista = <STDIN>);

open(LISTA, "$lista");
while(<LISTA>){
chomp($lista = $_);

print "\nDigite quantidade de paginas que deseja obter: ";
chomp($pages = <STDIN>);

proxy:
print "\nDigite o proxy (Ex: 192.168.0.1:80) ou 0 caso nao deseje: ";
chomp($proxy = <STDIN>);

@google = ("www.google.ad",
"www.google.ae",
"www.google.com.af",
"www.google.com.ag",
"www.google.com.ai",
"www.google.am",
"www.google.it.ao",
"www.google.com.ar",
"www.google.as",
"www.google.at",
"www.google.com.au",
"www.google.az",
"www.google.ba",
"www.google.com.bd",
"www.google.be",
"www.google.bg",
"www.google.com.bh",
"www.google.bi",
"www.google.com.bn",
"www.google.com.bo",
"www.google.com.br",
"www.google.bs",
"www.google.co.bw",
"www.google.com.by",
"www.google.com.bz",
"www.google.ca",
"www.google.cd",
"www.google.cg",
"www.google.ch",
"www.google.ci",
"www.google.co.ck",
"www.google.cl",
"www.google.cn",
"www.google.com.co",
"www.google.com",
"www.google.co.cr",
"www.google.com.cu",
"www.google.cz",
"www.google.de",
"www.google.dj",
"www.google.dk",
"www.google.dm",
"www.google.com.do",
"www.google.dz",
"www.google.com.ec",
"www.google.ee",
"www.google.com.eg",
"www.google.es",
"www.google.com.et",
"www.google.fi",
"www.google.com.fj",
"www.google.fm",
"www.google.fr",
"www.google.ge",
"www.google.gg",
"www.google.com.gh",
"www.google.com.gi",
"www.google.gl",
"www.google.gm",
"www.google.gp",
"www.google.gr",
"www.google.com.gt",
"www.google.gy",
"www.google.com.hk",
"www.google.hn",
"www.google.hr",
"www.google.ht",
"www.google.hu",
"www.google.co.id",
"www.google.ie",
"www.google.co.il",
"www.google.im",
"www.google.co.in",
"www.google.is",
"www.google.it",
"www.google.je",
"www.google.com.jm",
"www.google.jo",
"www.google.co.jp",
"www.google.co.ke",
"www.google.com.kh",
"www.google.ki",
"www.google.kg",
"www.google.co.kr",
"www.google.com.kw",
"www.google.kz",
"www.google.la",
"www.google.li",
"www.google.lk",
"www.google.co.ls",
"www.google.lt",
"www.google.lu",
"www.google.lv",
"www.google.com.ly",
"www.google.co.ma",
"www.google.md",
"www.google.me",
"www.google.mn",
"www.google.ms",
"www.google.com.mt",
"www.google.mu",
"www.google.mv",
"www.google.mw",
"www.google.com.mx",
"www.google.com.my",
"www.google.co.mz",
"www.google.com.na",
"www.google.com.nf",
"www.google.com.ng",
"www.google.com.ni",
"www.google.nl",
"www.google.no",
"www.google.com.np",
"www.google.nr",
"www.google.nu",
"www.google.co.nz",
"www.google.com.om",
"www.google.com.pa",
"www.google.com.pe",
"www.google.com.ph",
"www.google.com.pk",
"www.google.pl",
"www.google.pn",
"www.google.com.pr",
"www.google.pt",
"www.google.com.py",
"www.google.com.qa",
"www.google.ro",
"www.google.ru",
"www.google.rw",
"www.google.com.sa",
"www.google.com.sb",
"www.google.sc",
"www.google.se",
"www.google.com.sg",
"www.google.sh",
"www.google.si",
"www.google.sk",
"www.google.com.sl",
"www.google.sn",
"www.google.sm",
"www.google.st",
"www.google.com.sv",
"www.google.co.th",
"www.google.com.tj",
"www.google.tk",
"www.google.tl",
"www.google.tm",
"www.google.to",
"www.google.com.tr",
"www.google.tt",
"www.google.com.tw",
"www.google.co.tz",
"www.google.com.ua",
"www.google.co.ug",
"www.google.co.uk",
"www.google.com.uy",
"www.google.co.uz",
"www.google.com.vc",
"www.google.co.ve",
"www.google.vg",
"www.google.co.vi",
"www.google.com.vn",
"www.google.vu",
"www.google.ws",
"www.google.rs",
"www.google.co.za",
"www.google.co.zm",
"www.google.co.zw");
foreach $google(@google){

my $ua = new LWP::UserAgent;
$ua->agent('Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.8.1.12) Gecko/20080301 Firefox/2.0.0.12');
if($proxy!=0){
$ua->env_proxy();
$ua->proxy("http", "http://$proxy/");}

system("$cmd");

print "\nIniciando busca por: $_\n\n";

for($i=1;$i<$pages;$i++){
my $pedido = new HTTP::Request GET =>"http://$google/search?hl=&q=$_&start=$i";
my $resultado = $ua->request($pedido) or die ">Erro na busca\n";
$ua->timeout(5);
my $result = $resultado->content;

while ($result =~ m/<h2 class=(.*?)><a href=\"(.*?)\" class=(.*?)>/g){
if ($1 !~ /64\..*\|\.google.*|\.orkut|.*\.google.*|\.youtube.*/){
my $sites=$2;

open (LOG, ">>sites.txt");
print LOG "$sites\n";
print "$sites\n";
close(LOG);

}}}}}}}

system("$cmd");

print "\nFiltrando os sites...\n\n";

open(VER,"<sites.txt");
@tudo = <VER>;
close(VER);
system("del sites.txt");

for($a=0;$a<=$#tudo;$a++) {
if($tudo[$a] !~ /=/) {
$tudo[$a] = "";
}
$para = index($tudo[$a],"=") + 1;
$pronto = substr($tudo[$a],0,$para);

open(GRAVA,">>sites.txt");
print GRAVA $pronto,"\n";
}

close(GRAVA);

print "Removendo os sites duplicados...\n\n";

print "Digite o nome do arquivo que deseja salvar os resultados: ";
chomp($save = <STDIN>);

my $origfile = 'sites.txt';
my $outfile = $save;
my %hTmp;

open (IN, "<$origfile");
open (OUT, ">$outfile");

while (my $sLine = <IN>) {
print OUT $sLine unless ($hTmp{$sLine}++);
}
close OUT;
close IN;
system("del sites.txt");

print "\nScan de sites concluido! Resultados salvos em $save\n\n";

print "Aperte ENTER para voltar ao menu principal...\n";
<STDIN>;
goto inicio;