#! /usr/bin/env perl

use warnings;
use strict;
use autodie;
use File::Temp qw(tempfile tempdir);

START: #Start Label

my $init = `lsusb`;
my $change;


print "\nCurrent Devices:\n".$init;

print "\n\nPlease insert device\n\n";
while (`lsusb` eq $init){
}

$change = `lsusb`;
print "\nDevices Updated:\n".$change."\n";



my @ia = split(' ',$init); # ia="initial array"
my @ca = split(' ',$change);


my $index = 0;

my @new;
foreach (@ia){
	if (not (\$_ eq @ca[$index])){
		push (@new, $ca[$index]);		
	}

	$index += 1;
	
}

print @new;


