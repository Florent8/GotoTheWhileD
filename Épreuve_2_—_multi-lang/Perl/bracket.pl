use strict;
use warnings;

my @characters = ();
my @openBrackets = ('(', '{', '[');
my @closeBrackets = (')', '}', ']');
my $dernier = '';

my @chars = split //, $ARGV[0];

foreach my $i (0 .. $#chars) {
	if (grep($_ eq $chars[$i], @openBrackets)) {
		push @characters, $chars[$i]
	} elsif (grep($_ eq $chars[$i], @closeBrackets)) {
		&checkBracket($openBrackets[searchIndex($chars[$i])]);
	}

}

@characters ? print "NO" : print "YES";

sub checkBracket {
	my $bracket = $_[0]; 
	
	if (pop @characters ne $bracket) {
		print "NO";
		exit 0;
	}
}

sub searchIndex {
	my $elem = $_[0];

	foreach my $i (0 .. $#closeBrackets) {
		if ($closeBrackets[$i] eq $elem) {
			return $i;
		}
	}

	print "NO";
	exit 0;
}