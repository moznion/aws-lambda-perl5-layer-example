#!perl

use strict;
use warnings;
use utf8;
use bytes ();
use FindBin;

my $app = require "$FindBin::Bin/app.psgi";

sub handle {
    my ($payload) = @_;

    my $resp = $app->(+{
        REQUEST_METHOD => $payload->{http_method},
        PATH_INFO => $payload->{path},
        QUERY_STRING => $payload->{query_string} || '',
        'psgi.input' => $payload->{body},
        CONTENT_LENGTH => bytes::length($payload->{body}) || 0,
        CONTENT_TYPE => $payload->{content_type} || '',
    });
    use Data::Dumper; warn Dumper($resp); # TODO remove

    return $resp;
}

1;

