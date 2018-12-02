#!perl

use strict;
use warnings;
use utf8;
use YAML::XS;

sub handle {
    my ($payload) = @_;

    # parse YAML
    my $obj = YAML::XS::Load($payload->{'yaml'});
    use Data::Dumper; warn Dumper($obj);

    return $obj;
}

1;

