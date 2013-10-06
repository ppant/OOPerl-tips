use utf8;      # so literals and identifiers can be in UTF-8
use v5.12;     # or later to get "unicode_strings" feature
use strict;    # quote strings, declare variables
use warnings;  # on by default
use warnings  qw(FATAL utf8);    # fatalize encoding glitches
use open      qw(:std :utf8);    # undeclared streams in UTF-8
use charnames qw(:full :short);  # unneeded in v5.16
use Data::Dumper;

# This code snippet will provide some regx solutions for cleaning html code 
# Read a html file created from msword 
my $file_path = "TestFile.html"; # Initialise file path
print $file_path."\n";
my $buffer; # Store file contents
my @lines;
open(my $fh, "<", $file_path) or die "Can't open $!";
binmode($fh); #perfectly useless on a proper OS, needed on M$
@lines = <$fh>; #swallow all
close($fh);
$buffer = join ('', @lines);
print $buffer."\n";
# $buffer =~ s/\<ref\>//;
# Let's applying regx
# Remove style embed in tags like style='padding:0cm 0cm 0cm 0cm'
$buffer =~ s/style\=.*?.*?\>/\>/igs;
# Remove style from <head> </head>
$buffer =~ s/\<style?.*\<\/style\>//igs;
print $buffer."\n";