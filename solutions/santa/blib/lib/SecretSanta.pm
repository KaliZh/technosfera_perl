package SecretSanta;

use 5.010;
use strict; 
use warnings;
use DDP;
sub calculate {
    my @members = @_;
    my @res;
	# ...
	#	push @res,[ "fromname", "toname" ];
	# ...
    for my $var (@members) {
        if (ref($var) eq "ARRAY") {
            push @res,[$var->[0], ""];
            push @res,[$var->[1], ""];
        } else {
            push @res,[$var, ""];
        }
    }
    my ($i, $j);
    $i = 0;
    $j = 2;
    while ($i < scalar @res) {
        $res[$i]->[1] = $res[$j]->[0];
        $i++;
        $j++;
        if ($j == scalar @res) {
            $j = 0;
        }
    }
    return @res;
}

1;
