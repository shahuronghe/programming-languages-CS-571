use strict;
use warnings;

my $input_file = "input.txt";
open (my $fh, $input_file) or die "could not open file: $!";
while(my $line = <$fh>){
	chomp $line;

	if ($line =~ /hi/) { print "$line : contains hi\n"; }

	if ($line =~ /[a|e|i|o|u]/) { print "$line : contains exact one vowel character\n"; }

	if ($line =~ /[l].*[l]/) { print "$line : contains two or more 'l'\n"; }

	if ($line =~ /[h].*[t]$/) { print "$line : begins with letter 'h' and ends with letter 't'\n"; }
	
}
