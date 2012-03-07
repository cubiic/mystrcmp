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
than C<\0>" (definition from BSD's C<strcmp(3)>).  Returns B<-1> if string C<a>
is lexigraphically less than string C<b>, returns B<0> if both strings match,
and returns B<1> if string C<a> is lexigraphically greater than string C<b>.

=cut

sub compare {
    my $self = shift;
    my %args = @_;
    my $strings_match = 0;

    die(q|Missing 'a' argument for compare() method|)
        unless ( exists($args{a}) );
    die(q|Missing 'b' argument for compare() method|)
        unless ( exists($args{b}) );

    # - split both strings into arrays so they can be enumerated
    my @str_a = $self->mysplit(split_string => $args{a});
    my @str_b = $self->mysplit(split_string => $args{b});

    # - check to see if both arguments are greater than zero length
    # strings (i.e. not 'undef')
    die (qq('a' argument is an empty string)) unless ( scalar(@a) > 0 );
    die (qq('b' argument is an empty string)) unless ( scalar(@b) > 0 );

    # - create a loop
    my $char_counter = 0;
    while ( ! defined $return_status ) {
        # - get a substring at character position 'X'
        my $char_a = $str_a[$char_counter];
        my $char_b = $str_b[$char_counter];

        # - check to see if either character is undef, i.e. we've reached the
        # end of the string

        # - if we have no characters, then we are done, and both strings
        # matched
        # - if we have two characters, one from each string, compare the two
        # characters
        #   - if char a is less than char b, return -1
        #   - if char a is greater than char b, return 1
    }

    return 0;
}

=head2 mysplit ( split_string => $string )

Splits the value of C<$string> into individual characters, and returns them to
the caller in an array.

=cut

sub mysplit {
    my $self = shift;
    my %args = @_;

    die(qq(ERROR: missing string to split as 'split_string'))
        unless ( exists $args{split_string} );
    my $string = $args{split_string};

    #print qq(mysplit: input string is $string\n);
    my @split;
    my $counter = 0;
    my $char;
    # this loop will run as long as $char doesn't receive 'undef'
    while ( $char = substr($string, $counter, 1) ) {
        #print qq(mysplit: character $counter of string is: ) . $char . qq(\n);
        $counter++;
        push(@split, $char);
    }
    return @split;
}

=head1 AUTHOR

Brian Manning, C<< <cl at xaoc.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2012 Brian Manning, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of MyStrCmp
