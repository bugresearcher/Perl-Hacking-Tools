#!/usr/bin/perl 
 
############################################################################################# 
# 
# [†] Info			: This is just small script that i wrote for checking SMTP login 
# [†] Coder			: biadabz A.K.A. gbLaCk 
# [†] Contact eMail		: jendral.gblack@gmail.com 
# [†] Messenger 		: the_rumput_segar@yahoo.co.id 
# [†] Usage			: perl smtpcheck.pl <smtp.address> <username> <password> 
# [†] Thanks			: bLaCk Jack- mywisdom xcode.or.id darkc0de.com serverisdown.org 
# 
# ..::[†] SeX & aLCoHoL + RoCk & RoLL [†]::.. 
# 
# version 1.0 
############################################################################################# 
 
use Net::SMTP; 
use MIME::Base64; 
system ("cls"); 
$subject = "New SMTP Details! -[$ARGV[0]:$ARGV[1]:$ARGV[2]]-"; 
$smtp = Net::SMTP->new( 
		$ARGV[0], 
		Timeout => 30, 
		Debug   => 0, 
		); 
$smtp->datasend("AUTH LOGIN\n"); 
$smtp->response(); 
$smtp->datasend(encode_base64($ARGV[1]) ); 
$smtp->response(); 
$smtp->datasend(encode_base64($ARGV[2]) ); 
$smtp->response(); 
$smtp->mail('smtpreporter@hell.com'); #Don't need to change... LoL~ 
$smtp->to('youremail@domain.com'); #Change with your email address 
$smtp->data(); 
$smtp->datasend("To: youremail\@domain.com\n"); #Change with your email address 
$smtp->datasend("From: SMTP Reporter <smtpreporter\@hell.com>\n"); #Don't need to change... LoL~ 
$smtp->datasend("Content-Type: text/html \n"); 
$smtp->datasend("Subject: $subject"); 
$smtp->datasend("\n"); 
$smtp->datasend("<b>New SMTP Details!</b><br><br> 
	  - SMTP Server: $ARGV[0]<br> 
	  - SMTP Username: $ARGV[1]<br> 
	  - SMTP Password: $ARGV[2]<br><br> 
	  <i>Coded &copy; 2009 By gbLaCk-</i> 
	  "); 
$smtp->datasend("\n"); 
$smtp->dataend(); 
$smtp->quit; 