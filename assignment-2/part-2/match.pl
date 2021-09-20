use strict;
use warnings;
my $char;
my $count;

my $input_file = "input.txt";
open (my $fh, $input_file) or die "could not open file: $!";
while(my $line = <$fh>){
	chomp $line;
	$count = 0;

	if ($line =~ /hi/) { print "$line: contains hi\n"; }

	foreach $char (split('',$line)){
		if(($char=~/a/) || ($char=~/e/) || ($char=~/i/) || ($char=~/o/) || ($char=~/u/)) {
  			$count++;
  		}
	}

	if($count == 1) { print "$line: contains exactly one vowel character\n"; }

	if ($line =~ /[l].*[l]/) { print "$line: contains two or more 'l'\n"; }

        if ($line =~ /[h].*[t]$/) { print "$line: begins with letter 'h' and ends with letter 't'\n"; }	
}
