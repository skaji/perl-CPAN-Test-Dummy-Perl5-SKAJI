package NextRelease;
use v5.42;

use Moose;

extends 'Dist::Zilla::Plugin::NextRelease';

sub after_release ($self, @) {
    # noop
}
