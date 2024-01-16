package App::genusername;

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use App::genpw ();
use App::wordlist ();
use List::Util qw(shuffle);

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

my $default_patterns = [
    '%(wordlist:EN::Adjective::TalkEnglish)w%(wordlist:EN::Noun::TalkEnglish)(Str::ucfirst)w%4d',
];

my %args = %{$App::genpw::SPEC{genpw}{args}};
delete $args{min_len};
delete $args{max_len};
delete $args{len};

$SPEC{genusername} = {
    v => 1.1,
    summary => 'Generate random username',
    description => <<'MARKDOWN',

This is a thin wrapper for <prog:genpw>.

MARKDOWN
    args => {
        %args,
    },
    examples => [
    ],
};
sub genusername {
    my %args = @_;

    my $patterns = delete($args{patterns}) // $default_patterns;
    App::genpw::genpw(
        %args,
        patterns => $patterns,
    );
}

1;
# ABSTRACT:

=head1 SYNOPSIS

See the included script L<genusername>.


=head1 SEE ALSO

L<genpw> (from L<App::genpw>)
