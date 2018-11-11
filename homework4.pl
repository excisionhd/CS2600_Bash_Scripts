#!/usr/bin/perl

$i = 0;

chomp( $line = <STDIN> );
while ( $line ) {

	@col = split " ", $line;

	push @commands, "$col[0]\t$col[9]\n";
	
#	print $commands[ $i ];
	$i = $i + 1;
	chomp( $line = <STDIN> );

}

foreach $x ( sort @commands ){
	print $x;
}
