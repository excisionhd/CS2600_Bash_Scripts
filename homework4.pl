#!/usr/bin/perl

$i = 0;

chomp( $line = <STDIN> );
while ( $line ) {
	@col = split " ", $line;
	push @commands, "$col[6]\t$col[10]\n";
	
	$i = $i + 1;
	chomp( $line = <STDIN> );
}

foreach $x ( sort @commands ){
	print $x;
}
