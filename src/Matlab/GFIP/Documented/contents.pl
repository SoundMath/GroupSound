#!/usr/bin/perl -w
# File:  contents.pl
# Perl program for creating a Matlab CONTENTS.m file.
# More precisely, for each file in the argument list, this program
# writes the name and first lpf lines of the file to a file called
# CONTENTS.m. 
#
# Example:
#     ./contents.pl *.m
# writes the name and first two lines of all files in the current
# directory with a .m extension.
#
# @author William DeMeo <wdemeo@systems.textron.com>
# @date 2001.10.16

$outfile = "CONTENTS.m";
$ans = 'n'; $mode='>';
$lpf = 5;  # number of lines per file to use as file descriptor

if ( -e $outfile) {
    print STDERR "file $outfile exists!\n";
    until ($ans eq 'r' || $ans eq 'a' || $ans eq 'e'){
	print STDERR "(r)eplace, (a)ppend, or (e)xit?";
	$ans=getc(STDIN);
    }
    if ($ans eq 'e') {exit}
}
if ($ans eq 'a') {$mode='>>'}
else {$mode='>'}

open(OUTPUT, "$mode$outfile") ||
    die "Can't output to $outfile $!";

foreach $infile (@ARGV) {
    if ($infile ne $outfile){
	if (! -r $infile) {
	    die "$infile is unreadable\n";
	}
	open(INPUT,"<$infile") ||
	    die "Can't open file $infile\n";
	
	print OUTPUT "% $infile\n";  # start with the function name
	for ($g=0; $g < $lpf; $g++){
	    $input = <INPUT>,
	    print OUTPUT "%    $input";	
	}
	print OUTPUT "%\n";	
	close(INPUT);
    }
}
close(OUTPUT);


