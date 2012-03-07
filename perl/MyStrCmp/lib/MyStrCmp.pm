package MyStrCmp;

use warnings;
use strict;

=head1 NAME

MyStrCmp - String comparison function(s)

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use MyStrCmp;

    my $strcmp = MyStrCmp->new();
    my $result = $strcmp->compare(a => q(abcdef), b => q(uvwxyz));
    ...

=head1 FUNCTIONS

=head2 new

Creates and initializes a L<MyStrCmp> object and returns it to the caller.

=cut

sub new {
    my $class = shift;
    my $self = {};
    $self->{a} = undef;
    $self->{b} = undef;
    bless($self, $class);
    return $self;
}

=head2 compare ( a => q(string1), b => q(string2) )

Compares two strings "using unsigned characters, so that C<\200> is greater
than C<\0>" (from BSD's C<strcmp(3)>).

=cut

sub compare {
    my $self = shift;
    my %args = @_;

    die(q|Missing 'a' argument for compare() method|)
        unless ( exists($args{a}) );
    die(q|Missing 'b' argument for compare() method|)
        unless ( exists($args{b}) );
    # FIXME check to see if both arguments are greater than zero length
    # strings (i.e. not 'undef')

    # - create a loop
    # - in the loop, get a substring at character position 'X'
    # - check to see if either character is undef, i.e. we've reached the end
    # of the string
    # - if we have no characters, then we are done, and both strings matched
    # - if we have two characters, one from each string, compare the two
    # characters
    #   - if char a is less than char b, return -1
    #   - if char a is greater than char b, return 1
    return 0;
}

=head1 AUTHOR

Brian Manning, C<< <cl at xaoc.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2012 Brian Manning, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of MyStrCmp
