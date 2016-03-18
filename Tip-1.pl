use utf8;      # so literals and identifiers can be in UTF-8
use v5.12;     # or later to get "unicode_strings" feature
use strict;    # quote strings, declare variables
use warnings;  # on by default
use warnings  qw(FATAL utf8);    # fatalize encoding glitches
use open      qw(:std :utf8);    # undeclared streams in UTF-8
use charnames qw(:full :short);  # unneeded in v5.16
use Data::Dumper;

# This script will provide the solution for removing leading and trailing spaces in a string
# Solution -1
# These substitutions are very handly when you do comparisons. So it's always advisable to remove these extra space before you check for equality
my $test_str = '  This is string to test leading and trailing space.  ';
# ^ will check for spaces from starting of the string and will replace with blank
$test_str =~ s/^\s+//; 
# $ will check for spaces from end of the string and will replace with blank
$test_str =~ s/\s+$//;
# result string can be used for further opeartions
say $test_str;
# Solution - 2
# We can combine both regaular expressions in one 
$test_str =~ s/(^\s+|\s+$)//g;
# !Caution: Capuring might cost you some execution time 
say $test_str;
