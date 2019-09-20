#! /usr/bin/env perl

use warnings;
use autodie;
use File::Temp qw(tempfile tempdir);

#Implements dmesg, so sd card can be swapped without removing the usb adapter.


START: #Start Label

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





