use strict;
use warnings;
use LWP 5.64;
my $browser = LWP::UserAgent->new;
  
my $t = LWP::UserAgent->new() or die "Browser Failed\n";
$t->agent('Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)');
  
 
 print "[*] MD5 Search By XShimeX\n";
 print "[*] List Site You Can Search\n";
 print "[*] (1 = http://www.md5decrypter.com) (2 = http://www.md5oogle.com)\n";
 print "[*] (3 = http://passcracking.ru/) (4 = http://www.hashchecker.com)\n";
 print "[*] Example : 1 for http://www.md5decrypter.com\n";
 print "[*] Enter the Site : ";
 chomp (my $site=<STDIN>);;
 print "[*] Insert MD5 : ";
 chomp (my $text=<STDIN>);;

 
sub md5google(){
my $crack = "http://www.md5oogle.com/decrypt.php?input=$text&meta=01";
my $request = $t->request(HTTP::Request->new(GET=>$crack));


my $c = $request->content =~ /<b>Result: (.*?)<\/b>/;
if ($c) {
print "[*] Password: $1\n";
}else {
print "[*] Failed, Crack Not Found";
}
}
 
sub md5decrypter(){
my $url = 'http://www.md5decrypter.com/index.php';
my $response = $browser->post( $url,
[ "hash" => $text
]
);
die "$url error: ", $response->status_line
unless $response->is_success;
die "Weird content type at $url -- ", $response->content_type
unless $response->content_type eq 'text/html';
if( $response->content =~ /Normal Text: <\/b>(.+)/ ) {
print "[*] Password: $1\n";
} else {
print "[*] Failed, Crack Not Found\n";
}
}
 
sub passcracking(){
my $url = 'http://passcracking.ru/index.php';
my $response = $browser->post( $url,
[ "datafromuser" => $text
]
);
die "$url error: ", $response->status_line
unless $response->is_success;
die "Weird content type at $url -- ", $response->content_type
unless $response->content_type eq 'text/html';
if( $response->content =~ /<td bgcolor=#FF0000>(.+)<\/td><td>/ ) {
print "[*] Password: $1\n";
} else {
print "[*] Failed, Crack Not Found\n";
}
}

sub hashchecker(){
my $url = 'http://www.hashchecker.com/index.php';
my $response = $browser->post( $url,
[ "search_field" => $text
]
);
die "$url error: ", $response->status_line
unless $response->is_success;
die "Weird content type at $url -- ", $response->content_type
unless $response->content_type eq 'text/html';
if( $response->content =~ /<li>$text is <b>(.+)<\/b>/ ) {
print "[*] Password: $1\n";
} else {
print "[*] Failed, Crack Not Found\n";
}
}
 

if (!$site) {
print "[*] Please enter the site you want to Search MD5\n";
exit;
}
 
if (!$text){
print "[*] Please enter your MD5\n";
exit;
}

if ($site == '1') {
md5decrypter();
}

if ($site == '2') {
md5google();
}

if ($site == '2') {
md5google();
}

if ($site == '3'){
passcracking();
}

if ($site == '4'){
hashchecker();
}
 