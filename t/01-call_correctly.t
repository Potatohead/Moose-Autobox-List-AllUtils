#!perl

use strict;
use warnings;

use Test::Most;

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

shuffle: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is_deeply (
        [sort @test_arr->shuffle],
        [1..5],
        'shuffle: invoke by ARRAY return ARRAY'
    );

    is_deeply (
        [sort $test_arr->shuffle],
        [1..5],
        'shuffle: invoke by ARRAYREF return ARRAY'
    );

    is (
        @test_arr->shuffle->length,
        5,
        'shuffle: invoke by ARRAY return REF'
    );

    is (
        $test_arr->shuffle->length,
        5,
        'shuffle: invoke by ARRAYREF return REF'
    );

}

sum: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->sum, 15, 'sum: invoke by ARRAY');
    is ($test_arr->sum, 15, 'sum: invoke by ARRAYREF');
}

any_match: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->any_match(sub{$_ == 3}), 1, 'any_match: invoke by ARRAY');
    is ($test_arr->any_match(sub{$_ == 3}), 1, 'any_match: invoke by ARRAYREF');
}

all_match: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->all_match(sub{defined $_}), 1, 'all_match: invoke by ARRAY');
    is ($test_arr->all_match(sub{defined $_}), 1, 'all_match: invoke by ARRAYREF');
}

none_match: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->none_match(sub{not defined $_}), 1, 'none_match: invoke by ARRAY');
    is ($test_arr->none_match(sub{not defined $_}), 1, 'none_match: invoke by ARRAYREF');
}

notall_match: {
    my @test_arr = (1..5, undef);
    my $test_arr = [1..5, undef];

    is (@test_arr->notall_match(sub{defined $_}), 1, 'notall_match: invoke by ARRAY');
    is ($test_arr->notall_match(sub{defined $_}), 1, 'notall_match: invoke by ARRAYREF');
}

true: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->true(sub{$_ < 4}), 3, 'true: invoke by ARRAY');
    is ($test_arr->true(sub{$_ < 4}), 3, 'true: invoke by ARRAYREF');
}

false: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->false(sub{$_ < 4}), 2, 'false: invoke by ARRAY');
    is ($test_arr->false(sub{$_ < 4}), 2, 'false: invoke by ARRAYREF');
}

first_index: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->first_index(sub{$_ > 2}), 2, 'first_index: invoke by ARRAY');
    is ($test_arr->first_index(sub{$_ > 2}), 2, 'first_index: invoke by ARRAYREF');

    is (@test_arr->firstidx(sub{$_ > 2}), 2, 'firstidx: invoke by ARRAY');
    is ($test_arr->firstidx(sub{$_ > 2}), 2, 'firstidx: invoke by ARRAYREF');
}

last_index: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is (@test_arr->last_index(sub{$_ < 3}), 1, 'last_index: invoke by ARRAY');
    is ($test_arr->last_index(sub{$_ < 3}), 1, 'last_index: invoke by ARRAYREF');

    is (@test_arr->lastidx(sub{$_ < 3}), 1, 'lastidx: invoke by ARRAY');
    is ($test_arr->lastidx(sub{$_ < 3}), 1, 'lastidx: invoke by ARRAYREF');
}

insert_afer: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is_deeply(
        scalar @test_arr->insert_after(sub{$_ eq 3}, 6),
        [1,2,3,6,4,5],
        'insert_after: invoke by ARRAY returning REF'
    );

    is_deeply(
        scalar $test_arr->insert_after(sub{$_ eq 3}, 6),
        [1,2,3,6,4,5],
        'insert_after: invoke by ARRAYREF returning REF'
    );

    is_deeply(
        [@test_arr->insert_after(sub{$_ eq 3}, 6)],
        [1,2,3,6,4,5],
        'insert_after: invoke by ARRAY returning ARRAY'
    );

    is_deeply(
        [$test_arr->insert_after(sub{$_ eq 3}, 6)],
        [1,2,3,6,4,5],
        'insert_after: invoke by ARRAYREF returning ARRAY'
    );
}

insert_after_string: {
    my @test_arr = qw/this is a string/;
    my $test_arr = [qw/this is a string/];

    is_deeply(
        scalar @test_arr->insert_after_string('a', 'longer'),
        [qw/this is a longer string/],
        'insert_after_string: invoke by ARRAY returning REF'
    );

    is_deeply(
        scalar $test_arr->insert_after_string('a', 'longer'),
        [qw/this is a longer string/],
        'insert_after_string: invoke by ARRAYREF returning REF'
    );

    is_deeply(
        [@test_arr->insert_after_string('a', 'longer')],
        [qw/this is a longer string/],
        'insert_after_string: invoke by ARRAY returning ARRAY'
    );

    is_deeply(
        [$test_arr->insert_after_string('a', 'longer')],
        [qw/this is a longer string/],
        'insert_after_string: invoke by ARRAYREF returning ARRAY'
    );
}

apply: {
    my @test_arr = (1..5);
    my $test_arr = [1..5];

    is_deeply(
      [@test_arr->apply(sub{ $_++ })],
      [2..6],
      'apply: invoke by ARRAY returning ARRAY'
    );

    is_deeply(
      [$test_arr->apply(sub{$_++})],
      [2..6],
      'apply: invoke by ARRAYREF returning ARRAY'
    );
}

done_testing;
