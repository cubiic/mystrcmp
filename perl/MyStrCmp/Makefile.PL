use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'MyStrCmp',
    AUTHOR              => 'Brian Manning <cl@xaoc.org>',
    VERSION_FROM        => 'lib/MyStrCmp.pm',
    ABSTRACT_FROM       => 'lib/MyStrCmp.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'MyStrCmp-*' },
);
