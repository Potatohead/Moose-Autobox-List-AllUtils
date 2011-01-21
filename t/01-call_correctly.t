#!perl

use strict;
use warnings;

use Test::More tests => 12;

use Moose::Autobox;
use Moose::Autobox::List::AllUtils;

first: {
    my @test_arr = (undef, undef, 3, 4, undef);
    my $test_ref = [undef, undef, 5, 6, undef];

    is (@test_arr->first_match(sub { defined $_  }),
        3,
        'first: invoke by ARRAY');
    is ($test_ref->first_match(sub { defined $_  }),
        5,
        'first: invoke by ARRAYREF');
}

max: {
    my @test_arr = (1..10);
    my $test_ref = [1..10];

    is (@test_arr->max, 10, 'max: invoke by ARRAY');
    is ($test_ref->max, 10, 'max: invoke by ARRAYREF');
}

maxstr: {
    my @test_arr = ('hello','world');
    my $test_ref = ['hello','world'];

    is (@test_arr->maxstr, 'world', 'maxstr: invoke by ARRAY');
    is ($test_ref->maxstr, 'world', 'maxstr: invoke by ARRAYREF');
}

min: {
    my @test_arr = (1..10);
    my $test_ref = [1..10];

    is (@test_arr->min, 1, 'min: invoke by ARRAY');
    is ($test_ref->min, 1, 'min: invoke by ARRAYREF');
}

minstr: {
    my @test_arr = ('hello','world');
    my $test_ref = ['hello','world'];

    is (@test_arr->minstr, 'hello', 'minstr: invoke by ARRAY');
    is ($test_ref->minstr, 'hello', 'minstr: invoke by ARRAYREF');
}

reduce: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->reduce(sub {$_[0] + $_[1]}), 15, 'reduce: invoke by ARRAY');
    is ($test_arr->reduce(sub {$_[0] + $_[1]}), 15, 'reduce: invoke by ARRAYREF');
}

