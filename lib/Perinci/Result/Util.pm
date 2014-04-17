package Perinci::Result::Util;

use 5.010001;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(
                       is_env_res
               );

our $VERSION = '0.01'; # VERSION
our $DATE = '2014-04-17'; # DATE

sub is_env_res {
    my $res = shift;

    return 0 unless ref($res) eq 'ARRAY';
    return 0 unless @$res <= 4;

    # check status
    return 0 unless defined($res->[0]) && $res->[0] =~ /\A[0-9]{1,3}\z/;

    # check message
    return 0 unless !ref($res->[1]);

    # check result metadata
    return 0 if defined($res->[3]) && ref($res->[3]) ne 'HASH';

    1;
}

1;
# ABSTRACT: Utilities related to enveloped result

__END__

=pod

=encoding UTF-8

=head1 NAME

Perinci::Result::Util - Utilities related to enveloped result

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Perinci::Result::Util qw(is_env_res);

 say is_env_res([200, "OK"]); # 1
 say is_env_res("ok");        # 0

=head1 FUNCTIONS

=head2 is_env_res($res) => BOOL

Return true if C<$res> looks like enveloped result.

=head1 SEE ALSO

L<Rinci::function>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Perinci-Result-Util>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Perinci-Result-Util>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Perinci-Result-Util>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
