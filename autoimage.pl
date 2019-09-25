#! /usr/bin/env perl

use warnings;
use autodie;
use strict;
use File::Temp qw(tempfile tempdir);

#Implements dmesg, so sd card can be swapped without removing the usb adapter.


START: #Start Label

print "\a\aPlease run this script with sudo!\n";

print "Input pwd of img file:\n";
my $loc = <STDIN>;

print "Reinput pwd of img file:\n";
my $loc2 = <STDIN>;

if ($loc ne $loc2){
	print "\n\nDifferent pwds inputted!\n\n";
	goto START;
}

MAIN:

my $init = `ls /dev/sd*`; 
my $change;


print "\nCurrent /dev/sd*:\n".$init;

print "\n\nPlease insert device\n\n";
while (`ls /dev/sd*` eq $init){
}

my @patterns = split($init, "\n");

$change = `ls /dev/sd*`;

foreach(@patterns){
	$change =~ s/$_//;
}

$change =~ /(\/dev\/sd[a-z][0-9])/;
$change = $1;

print "\nLocation of Inserted Drive:\n".$change."\n";

#assumes that location is /dev/$change

my $ddcom = "dd bs=32M if=".$loc." of=".$change." conv=fdatasync status=progress oflag=direct";

system($ddcom);


print "\a\a\aComplete! Please remove device\n";

while (`ls /dev/sd*` ne $init){
}

goto MAIN;


