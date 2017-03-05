package SecretSanta;

use 5.010;
use strict;
use warnings;
use DDP;
calculate();
sub el {
    my ($ar) = @_;
    if (ref($ar) eq "ARRAY") {
        return $ar->[0];
    } else {
        return $ar;
    }
}
sub calculate {
    my @members = @_;
    #my @members = (['A', 'B'], ['C', 'D'], 'E', 'F', 'G');
    #my @members = ('A', 'B', 'C');
    my @res;
    my $sz = 0;
    for my $i (0..$#members) {
        if (ref($members[$i]) eq "ARRAY") {
            #push @res, [$members[$i]->[0], ];
            $res[$sz]->[0] = $members[$i]->[0];
            if ($i + 1 == scalar @members) {
                if ($i == 1 || $i == 0) {
                    pop @res;
                } else {
                    $res[$sz]->[1] = el($members[0]);
                    $sz++;
                    #push @res, [ , el($members[0])]; 
                }
            } else {
                $res[$sz]->[1] = el($members[$i + 1]);
                $sz++;
                #push @res, [ , el($members[$i + 1])];
            }
            #push @res, [$members[$i]->[1], ];
            $res[$sz]->[0] = $members[$i]->[1];
            if ($i + 1 == scalar @members) {
                if ($i == 1 || $i == 0) {
                    pop @res;
                } else {
                    $res[$sz]->[1] = el($members[0]);
                    $sz++;
                    #push @res, [ , el($members[0])]; 
                }
            } else {
                $res[$sz]->[1] = el($members[$i + 1]);
                $sz++;
                #push @res, [ , el($members[$i + 1])];
            }
        } else {
            #push @res, [$members[$i], ];
            $res[$sz]->[0] = $members[$i];
            if ($i + 1 == scalar @members) {
                if ($i == 1 || $i == 0) {
                    pop @res;
                } else {
                    $res[$sz]->[1] = el($members[0]);
                    $sz++;
                    #push @res, [ , el($members[0])]; 
                }
            } else {
                $res[$sz]->[1] = el($members[$i + 1]);
                $sz++;
                #push @res, [ , el($members[$i + 1])];
            }
        }
    }
	# ...
	#	push @res,[ "fromname", "toname" ];
	# ...
    for my $i (0..$#res) {
        print "$res[$i]->[0] $res[$i]->[1]\n";
    }
	return @res;
}

1;
