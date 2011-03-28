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

    $foo = @arr->max
    $foo = $arr->max

Returns the entry in the list with the highest numerical value. If the
list is empty then C<undef> is returned.

Functionality of L<List::Util::max|List::Util/max>

=cut

    sub max {
        my ($array) = @_;
        return List::AllUtils::max @$array;
    }

=func maxstr

    $foo = @arr->maxstr
    $foo = $arr->maxstr

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

    $foo = @arr->min
    $foo = $arr->min

Similar to C<max> but returns the entry in the list with the lowest
numerical value. If the list is empty then C<undef> is returned.

Functionality of L<List::Util::min|List::Util/min>

=cut

    sub min {
        my ($array) = @_;
        return List::AllUtils::min @$array;
    }

=func minstr

    $foo = @arr->minstr
    $foo = $arr->minstr

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

    $foo = @arr->reduce( sub {$_[0] + $_[1]} )
    $foo = $arr->reduce( sub {$_[0] . $_[1]} )

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
        my ($array, $block) = @_;
        return List::AllUtils::reduce { $block->($a, $b) } @$array;
    }

=func shuffle

    $array_ref = @arr->shuffle
    $array_ref = $arr->shuffle

Returns the elements of LIST in a random order

Functionality of L<List::Util::shuffle|List::Util/shuffle>

=cut

    sub shuffle {
        my ($array) = @_;

        return (wantarray
            ? (List::AllUtils::shuffle @$array)
            : [List::AllUtils::shuffle @$array]);
    }

=func sum

   $foo = @arr->sum
   $foo = $arr->sum

Returns the sum of all the elements in LIST. If LIST is empty then C<undef>
is returned.

Functionality of L<List::Util::sum|List::Util/sum>

=cut

    sub sum {
        my ($array) = @_;
        return List::AllUtils::sum @$array;
    }


=func any_match

    print "At least one value is defined" @arr->any_match( sub{ defined $_ } );
    print "At least one value is defined" $arr->any_match( sub{ defined $_ } );

Returns a true value if any item in LIST meets the criterion given through
BLOCK. Sets C<$_> for each item in LIST in turn. Returns false otherwise, or
C<undef> if LIST is empty.

Functionality of L<List::MoreUtil::any|List::MoreUtil/any>

=cut

    sub any_match {
        my ($array, $block) = @_;
        return List::AllUtils::any { $block->($_) } @$array;
    }

=func all_match

    print "All values are defined" @arr->all_match( sub{ defined $_ } );
    print "All values are defined" $arr->all_match( sub{ defined $_ } );

Returns a true value if all items in LIST meet the criterion given through
BLOCK. Sets C<$_> for each item in LIST in turn. Returns false otherwise, or
C<undef> if LIST is empty.

Functionality of L<List::MoreUtil::all|List::MoreUtil/all>

=cut

    sub all_match {
        my ($array, $block) = @_;
        return List::AllUtils::all { $block->($_) } @$array;
    }

=func none_match

    print "None of the values are defined" @arr->none_match( sub{ defined $_ } );
    print "None of the values are defined" $arr->none_match( sub{ defined $_ } );

Logically the negation of C<any>. Returns a true value if no item in LIST meets
the criterion given through BLOCK. Sets C<$_> for each item in LIST in turn.
Returns false otherwise, or C<undef> if the list is empty.

Functionality of L<List::MoreUtil::none|List::MoreUtil/none>

=cut

    sub none_match {
        my ($array, $block) = @_;
        return List::AllUtils::none { $block->($_)} @$array;
    }

=func notall_match

    print "At least 1 of the values are defined"
        @arr->notall_match( sub{ defined $_ } );
    print "At least 1 of the values are defined"
        $arr->notall_match( sub{ defined $_ } );

Logically the negation of C<all>. Returns a true value if not all items in LIST
meet the criterion given through BLOCK. Sets C<$_> for each item in LIST in
turn. Return false otherwise, or C<undef> if the list is empty.

Functionality of L<List::MoreUtil::notall|List::MoreUtil/notall>

=cut

    sub notall_match {
        my ($array, $block) = @_;
        return List::AllUtils::notall { $block->($_)} @$array;
    }

=func true

    $count_of_true = @arr->true( sub { defined $_ } );
    $count_of_true = $arr->true( sub { defined $_ } );

Counts the number of elements in LIST for which the criterion in BLOCK is true.
Sets C<$_> for each item in LIST in turn.

Functionality of L<List::MoreUtil::true|List::MoreUtil/true>

=cut

    sub true {
        my ($array, $block) = @_;
        return List::AllUtils::true { $block->($_)} @$array;
    }

=func false

    $count_of_true = @arr->true( sub { defined $_ } );
    $count_of_true = $arr->true( sub { defined $_ } );

Counts the number of elements in LIST for which the criterion in BLOCK is false.
Sets C<$_> for each item in LIST in turn.

Functionality of L<List::MoreUtil::false|List::MoreUtil/false>

=cut

    sub false {
        my ($array, $block) = @_;
        return List::AllUtils::false { $block->($_)} @$array;
    }

=func firstidx

=func first_index

    $index_of_first_defined = @arr->first_index( sub { defined $_ } );

Returns the index of the first element in LIST for which the criterion in BLOCK
is true. Sets C<$_> for each item in LIST in turn. Returns C<-1> if no such item
could be found.

C<firstidx> is an alias for C<first_index>.

Functionality of L<List::MoreUtil::first_index|List::MoreUtil/first_index>

=cut

    sub first_index {
        my ($array, $block) = @_;
        return List::AllUtils::first_index { $block->($_)} @$array;
    }

    # Should alias this func, later
    sub firstidx {
        my ($array, $block) = @_;
        return List::AllUtils::first_index { $block->($_)} @$array;
    }

=func lastidx

=func last_index

    $index_of_the_last_defind = @arr->last_index( sub { defined $_ } );

Returns the index of the last element in LIST for which the criterion in BLOCK
is true. Sets C<$_> for each item in LIST in turn. Returns C<-1> if no such item
could be found.

C<lastidx> is an alias for C<last_idx>.

Functionality of L<List::MoreUtil::last_index|List::MoreUtil/last_index>

=cut

    sub last_index {
        my ($array, $block) = @_;
        return List::AllUtils::last_index { $block->($_)} @$array;
    }

    # Should alias this func, later
    sub lastidx {
        my ($array, $block) = @_;
        return List::AllUtils::last_index { $block->($_)} @$array;
    }

=func insert_after

    my @arr = qw/this is a list/;
    @longer_list = @arr->insert_after( sub { $_ eq 'a'}, 'longer');

Inserts VALUE after the first item in LIST for which the criterion in BLOCK is
true. Sets C<$_> for each item in LIST in turn.

Functionality of L<List::MoreUtil::insert_after|List::MoreUtil/insert_after>

=cut

    sub insert_after {
        my ($array, $block, $item) = @_;

        # damn mutating function means we have to copy the array. Can't wait for
        # perl6's .= to make functions like this a silly idea
        my @result = @$array;

        List::AllUtils::insert_after {$block->($_)} $item => @result;

        return (wantarray
            ? @result
            : \@result);
    }

=func insert_after_string

    my @arr = qw/this is a list/;
    @longer_list = @arr->insert_after_string( 'a', 'longer' );

Inserts VALUE after the first item in LIST which is equal to STRING.

Functionality of
L<List::MoreUtil::insert_after_string|List::MoreUtil/insert_after_string>

=cut

    sub insert_after_string {
        my ($array, $string, $item) = @_;

        # as per above, again
        my @result = @$array;

        List::AllUtils::insert_after_string $string, $item => @result;

        return (wantarray
            ? @result
            : \@result);
    }

=func apply

    my @list_plus_1 = @arr->apply(sub { $_++ } );

Applies BLOCK to each item in LIST and returns a list of the values after BLOCK
has been applied. In scalar context, the last element is returned.  This
function is similar to C<map> but will not modify the elements of the input
list:

=cut

    sub apply {
        my ($array, $block) = @_;
        return List::AllUtils::apply {$block->($_)} @$array;
    }

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
#    *zip zip2 *dont
#    uniq
#    minmax
#    part
}

Moose::Autobox->mixin_additional_role(
    ARRAY => 'Moose::Autobox::List::AllUtils');

1;
