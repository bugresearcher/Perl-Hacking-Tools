#!/usr/bin/perl 
use LWP::UserAgent; 
 
print "Specify dork: "; 
$dork = <STDIN>; 
chomp($dork); 
for ($i = 0; $i < 1000; $i += 10) { 
	$b = LWP::UserAgent->new(agent => 'Mozilla/4.8 [en] (Windows NT 6.0; U)'); 
	$b->timeout(30); 
	$b->env_proxy; 
	$c = $b->get('http://www.bing.com/search?q=' . $dork . '&first=' . $i . '&FORM=PERE')->content; 
	$check = index($c, 'sb_pagN'); 
	while (1) { 
		$n = index($c, '<h3><a href="'); 
		if ($n == -1) { 
			last; 
		} 
		$c = substr($c, $n + 13); 
		$s = substr($c, 0, index($c, '"')); 
		print $s, "\n"; 
	} 
	if ($check == -1) { 
		last; 
	} 
} 
