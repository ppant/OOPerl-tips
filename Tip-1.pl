#!/usr/bin/perl -w
use strict;
use 
# This script will provide the solution for removing leading and trailing spaces in a string
# Solution -1
# These substitutions are very handly when you do comparisons. So it's always advisable to remove these extra space before you check for equality
my $test_str = '  This is string to test leading and trailing space.  ';
# ^ will check for spaces from starting of the string and will replace with blank
$test_str =~ s/^\s+//; 
# $ will check for spaces from end of the string and will replace with blank
$test_str =~ s/\s+$//;
# result string can be used for further opeartions
print $test_str;
