#!perl

use strict;
use warnings;
use utf8;
use bytes ();
use FindBin;

my $app = require "$FindBin::Bin/app.psgi";

sub handle {
    my ($payload) = @_;

    my $body = $payload->{body};
    open my $input, "<", \$body;

    my $resp = $app->(+{
        REQUEST_METHOD => $payload->{http_method},
        PATH_INFO => $payload->{path},
        QUERY_STRING => $payload->{query_string} || '',
        'psgi.input' => $input,
        CONTENT_LENGTH => bytes::length($body) || 0,
        CONTENT_TYPE => $payload->{content_type} || '',
    });
    use Data::Dumper; warn Dumper($resp); # TODO remove

    return $resp;
}

1;

