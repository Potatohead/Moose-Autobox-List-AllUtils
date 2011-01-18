#!perl

use strict;
use warnings;

use Test::More tests => 2;

use Moose::Autobox;
use Moose::Autobox::List::AllUtils;

my @test_arr = (undef, undef, 3, 4, undef);
my $test_ref = [undef, undef, 5, 6, undef];

is (@test_arr->first_match(sub { defined $_  }), 3, 'invoke by ARRAY');
is ($test_ref->first_match(sub { defined $_  }), 5, 'invoke by ARRAYREF');
