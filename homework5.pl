#!/usr/bin/perl

@doc = <STDIN>;
$index;

foreach $x( @doc){
	if ( $x =~ />2\.1|>4\.1|>7\.1/ ){
		@show = split /<\/b>/, @doc[ $index + 4 ];
		@show2 = split />/, @show[0];
		@breaktag = split /</, $x;
		$channel = substr $breaktag[1], 2, 6;
		if ( $x =~ /;/ ){
			$channel = (split /;/, $x)[1];
		}
		print $channel . " " . $show2[1] . "\n";				
	}
	$index++;
}


