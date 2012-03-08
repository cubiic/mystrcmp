#!/usr/bin/env perl

use warnings;
use strict;

# system modules
use Getopt::Long;
# local modules
use MyStrCmp;

=head1 NAME

mystrcmp.pl - Demo the L<MyStrCmp> library

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

 mystrcmp.pl [options]

 Options:
 -a|--first     First string to compare
 -b|--second    Second string to compare

=cut

### main script ###
    my %opts;
    $opts{colorize} = 1;
    my $p = Getopt::Long::Parser->new();

    $p->getoptions(
        \%opts,
        q(a|first=s),
        q(b|second=s),
    );

    die(qq(Missing --first string to compare)) unless ( defined $opts{a} );
    die(qq(Missing --second string to compare)) unless ( defined $opts{b} );
    my $cmp = MyStrCmp->new();
    $cmp->compare(a => $opts{a}, b => $opts{b});

=head1 AUTHOR

Brian Manning, C<< <cl at xaoc.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2012 Brian Manning, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
