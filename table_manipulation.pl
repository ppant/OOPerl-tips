#!/usr/local/bin/perl -w
use strict;
use warnings;
# I have a html file created by MS Word. I am using a HTML TIDY and a series of regx to clean the word garbage but during the clean process cell colors and other table formatting is 
# also removed. To solve that I have written some Perl code which will parse the table and by using regx will preserve the cell color and other table formatting
# Lets start .. I assume that you have a html file created using Ms Word and saved as filtered html.
# First read the file
 #my $input_file = 'table_manipulation_test.html';
 my $input_file = 'TestTable.htm';
 my $data;
 my $bgcolor_fetch;
 my @lines;
 open(my $fh1, "<$input_file");
 binmode($fh1); 
 @lines = <$fh1>; #swallow all
 $data = join ('', @lines);
 close($fh1);

 # I will introduce some check for msword document to pick the background attribute from style= and then make a regx to insert a bgcolor
 # with feched color value . this needs to be done before removing style attributes from tags
 while ($data =~ /background:(.*?);/ig) {
 $bgcolor_fetch = $1;
  $data =~ s/style\=.*?background:(.*?;).*?\>/bgcolor=\"$bgcolor_fetch\";/is;
 }
  # Now we can safely remove styles 
 $data =~ s/style\=\'.*?\'|style\=\".*?\"//igs;
 # Finally open a file and write the processed buffer
 my $out_path = "table_manipulation_output.html";
 open (my $fh2,">$out_path") or die "Can't open file $!";
 binmode($fh2);
 print $fh2 $data;
 close($fh2);
 
   