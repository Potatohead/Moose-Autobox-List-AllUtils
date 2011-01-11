use strict;
use warnings;

use Moose::Autobox;

{
    package Moose::Autobox::List::AllUtils;

    use List::AllUtils;

    *first first_match
    sub first_match {
        my ($self, $block) = @_;
        return List::AllUtils::first $block @$array

    max
    maxstr
    min
    minstr
    *reduce -overwrite
    shuffle
    sum
    any *junc any_match
    all *junc all_match
    none *junc none_match
    notall notall_match
    true
    false
    firstidx
    first_index
    lastidx
    last_index
    insert_after
    insert_after_string
    apply
    after
    after_incl
    before
    before_incl
    indexes
    firstval
    first_value
    lastval
    last_value
    pairwise
    each_array
    each_arrayref
    natatime
    mesh
    *zip zip2
    uniq
    minmax
    part
}

1;
