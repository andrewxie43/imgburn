#! /usr/bin/env perl

use warnings;
use autodie;
use File::Temp qw(tempfile tempdir);

#Implements dmesg, so sd card can be swapped without removing the usb adapter.


START: #Start Label

print "If you have not, please run this script with sudo!\n";

print "Input pwd of img file:\n";
my $loc = <STDIN>;

print "Reinput pwd of img file:\n";
my $loc2 = <STDIN>;

if ($loc ne $loc2){
	print "\n\nDifferent pwds inputted!\n\n";
	goto START;
}



my $init = `dmesg | grep -v UFW | tail`; #filter out UFW mlogs
my $change;


print "\nCurrent DMESG:\n".$init;

print "\n\nPlease insert device\n\n";
while (`dmesg | grep -v UFW | tail` eq $init){
}
$change = `dmesg | grep -v UFW | tail`;

$init =~ s/.*\n//;
$init =~ s/.*\n//;

$change =~ s/\Q$init//; #removes all lines from log before inserting drive

$change =~ s/.*\n//; #remove first line with no "sda" info

$change =~ s/[[0-9.]*] //;
$change =~ s/:.*//; #isolate drive name (usually sda?)

$change =~ s/^\s+|\s+$//g; #trim whitespace


print "\nLocation of Inserted Drive:\n".$change."\n";

#assumes that location is /dev/$change


system(dd bs-4M if=${loc} of=/dev/${change} conv=fdatasync status=progress);


print "Complete! Restarting program...\n";

goto START;


