
#!/usr/bin/perl

$i = 0;

chomp( $line = <STDIN> );
while ( $line ) {

	@col = split " ", $line;
	$com = $col[10];
	$com = substr $com, 0, 60;

	push @commands, "$col[6]\t$com\n";
	
	$i = $i + 1;
	chomp( $line = <STDIN> );
}

foreach $x ( sort @commands ){
	print $x;
}
