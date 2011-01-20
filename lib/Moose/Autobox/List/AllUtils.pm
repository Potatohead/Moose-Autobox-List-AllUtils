use strict;
use warnings;

use Moose::Autobox;

{
    package Moose::Autobox::List::AllUtils;
    # ABSTRACT: Adds List::AllUtils to Moose::Autobox
    use Moose::Role;
    use List::AllUtils;
    use Moose::Autobox;

=func first_match

    my $first = @arr->first_match(sub {defined $_});
    my $first = $arr->first_match(sub {defined $_});

Similar to grep in that it evaluates BLOCK setting $_ to each element of LIST in
turn. first returns the first element where the result from BLOCK is a true
value. If BLOCK never returns true or LIST was empty then undef is returned.

Functionality of L<List::Util::first|List::Util/first>

=cut

    sub first_match {
        my ($array, $block) = @_;
        return List::AllUtils::first { $block->($_) } @$array;
    }

=func max

    my $max = @arr->max;
    my $max = $arr->max;

Returns the entry in the list with the highest numerical value. If the list is
empty then undef is returned.

Functionality of L<List::Util::max|List::Util/max>

=cut

    sub max {
        my ($array) = @_;
        return List::AllUtils::max @$array;
    }

=func maxstr

    my $maxstr = @arr->maxstr;
    my $maxstr = $arr->maxstr;

Similar to max, but treats all the entries in the list as strings and returns
the highest string as defined by the gt operator. If the list is empty then
undef is returned.

=cut

    sub maxstr {
        my ($array) = @_;
        return List::AllUtils::maxstr @$array;
    }

#    min
#    minstr
#    *reduce -overwrite -reexamine
#    shuffle
#    sum
#    any *junc any_match
#    all *junc all_match
#    none *junc none_match
#    notall notall_match
#    true
#    false
#    firstidx
#    first_index
#    lastidx
#    last_index
#    insert_after
#    insert_after_string
#    apply
#    after
#    after_incl
#    before
#    before_incl
#    indexes
#    firstval
#    first_value
#    lastval
#    last_value
#    pairwise
#    each_array
#    each_arrayref
#    natatime
#    mesh
#    *zip zip2
#    uniq
#    minmax
#    part
}

Moose::Autobox->mixin_additional_role(
    ARRAY => 'Moose::Autobox::List::AllUtils');

1;
