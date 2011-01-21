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

Similar to C<grep> in that it evaluates BLOCK setting C<$_> to each element
of LIST in turn. C<first> returns the first element where the result from
BLOCK is a true value. If BLOCK never returns true or LIST was empty then
C<undef> is returned.

Functionality of L<List::Util::first|List::Util/first>

=cut

    sub first_match {
        my ($array, $block) = @_;
        return List::AllUtils::first { $block->($_) } @$array;
    }

=func max

    $foo = (1..10)->max               # 10
    $foo = [3,9,12]->max              # 12

Returns the entry in the list with the highest numerical value. If the
list is empty then C<undef> is returned.

Functionality of L<List::Util::max|List::Util/max>

=cut

    sub max {
        my ($array) = @_;
        return List::AllUtils::max @$array;
    }

=func maxstr

    $foo = ('A'..'Z')->maxstr         # 'Z'
    $foo = ["hello","world"]->maxstr  # "world"

Similar to C<max>, but treats all the entries in the list as strings
and returns the highest string as defined by the C<gt> operator.
If the list is empty then C<undef> is returned.

Functionality of L<List::Util::maxstr|List::Util/maxstr>

=cut

    sub maxstr {
        my ($array) = @_;
        return List::AllUtils::maxstr @$array;
    }

=func min

    $foo = (1..10)->min               # 1
    $foo = [3,9,12]->min              # 3

Similar to C<max> but returns the entry in the list with the lowest
numerical value. If the list is empty then C<undef> is returned.

Functionality of L<List::Util::min|List::Util/min>

=cut

    sub min {
        my ($array) = @_;
        return List::AllUtils::min @$array;
    }

=func minstr

    $foo = ('A'..'Z')->minstr         # 'A'
    $foo = ["hello","world"]->minstr  # "hello"

Similar to C<min>, but treats all the entries in the list as strings
and returns the lowest string as defined by the C<lt> operator.
If the list is empty then C<undef> is returned.

Functionality of L<List::Util::minstr|List::Util/minstr>

=cut

    sub minstr {
        my ($array) = @_;
        return List::AllUtils::minstr @$array;
    }

=func reduce

    $foo = (1 .. 5)->reduce( sub {$_[0] + $_[1]} )  #sum .. 15
    $foo = [1 .. 5]->reduce( sub {$_[0] . $_[1]} )  #concat .. 12345 

Reduces LIST by calling BLOCK, in a scalar context, multiple times,
setting C<$_[0]> and C<$_[1]> each time. The first call will be with C<$_[0]>
and C<$_[1]> set to the first two elements of the list, subsequent
calls will be done by setting C<$_[0]> to the result of the previous
call and C<$_[1]> to the next element in the list.

Returns the result of the last call to BLOCK. If LIST is empty then
C<undef> is returned. If LIST only contains one element then that
element is returned and BLOCK is not executed.

Functionality of L<List::Util::reduce|List::Util/reduce>

Replaces the implementation of reduce in Moose::Autobox with the one in
L<List::Util> invoked with the same api.

=cut

    sub reduce {
        my ($array, $block);
        return List::AllUtils::reduce { $block->($a, $b) } @$array;
    }

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
