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
    # assume both strings are equal until something below changes this
    my $return_value = 0;

    die(q|Missing 'a' argument for compare() method|)
        unless ( exists($args{a}) );
    my $string_a = $args{a};
    die(q|Missing 'b' argument for compare() method|)
        unless ( exists($args{b}) );
    my $string_b = $args{b};

    # - split both strings into arrays so they can be enumerated
    my @str_a = $self->mysplit(split_string => $string_a);
    my @str_b = $self->mysplit(split_string => $string_b);

    # - check to see if both arguments are greater than zero length
    # strings (i.e. not 'undef')
    die (qq('a' argument is an empty string)) unless ( scalar(@str_a) > 0 );
    die (qq('b' argument is an empty string)) unless ( scalar(@str_b) > 0 );

    # - create a loop
    my $char_counter = 0;
    # we'll use a 'last' later to get out of this loop
    while ( 1 ) {
        # - get a substring at character position 'X'
        my $char_a = $str_a[$char_counter];
        my $char_b = $str_b[$char_counter];

        # - check to see if either character is undef, i.e. we've reached the
        # end of one or both of the strings
        if ( defined $char_a ) {
            if ( defined $char_b ) {
                # both characters are defined; now see if one character is
                # less than or greater than the other
                if ( $char_a lt $char_b ) {
                    $return_value = -1;
                    last;
                } elsif ( $char_a gt $char_b ) {
                    $return_value = 1;
                    last;
                }
            } else {
                # $char_a is defined, but $char_b is undefined;
                # a is greater than b
                $return_value = 1;
                last;
            }
        } else {
            if ( defined $char_b ) {
                # $char_a is undefined, but $char_b is defined;
                # a is less than b
                $return_value = -1;
                last;
            } else {
                # both characters undefined, both strings match; exit...
                last;
            }
        }
        $char_counter++;
    }

    print qq(Comparison of string A and string B;\n);
    print qq(string A: $string_a is );
    if ( $return_value == -1 ) { print q(less than ); }
    if ( $return_value == 0 ) { print q(equal to ); }
    if ( $return_value == 1 ) { print q(greater than ); }
    print qq(string B: $string_b\n);

    return $return_value;
}

=head2 mysplit ( split_string => $string )

Splits the value of C<$string> into individual characters, and returns them to
the caller as the contents of an array.

=cut

sub mysplit {
    my $self = shift;
    my %args = @_;

    die(qq(ERROR: missing string to split as 'split_string'))
        unless ( exists $args{split_string} );
    my $string = $args{split_string};

    #print qq(mysplit: input string is $string\n);
    # hold the contents of the string as an array
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
