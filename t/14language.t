use strict;

use Test::More;

use DateTime;
use DateTime::Language;

my @langs = DateTime::Language::available();

plan tests => scalar @langs;

foreach my $lang (sort @langs)
{
    eval { DateTime->new( year => 1900,
                          language => $lang,
                          time_zone => 'UTC',
                        ) };
    ok( ! $@, "Load language: $lang\n" );
}
