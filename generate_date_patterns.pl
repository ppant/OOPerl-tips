#!/usr/local/bin/perl -w
use strict;
use Date::Manip; 
use Data::Dumper;  
# calculate the dates for yearly patterns.
&yearly();
&monthly();
&weekly();
&daily();
sub yearly {
	my $base = "2015-10-29";
	my $start_date = "2015-10-29";
	my $end_date = "2018-01-01";
	my $yearly_recur_every ="1";
	my $yearly_on_month = "10";
	my $yearly_on_week = "0";
	my $yearly_on_day = "29";
	my $yearly_on_the_month = "10";
	my $yearly_on_the_week = "1";
	my $yearly_on_the_day = "1";
	my $frequency = "";
	my $frequency_pattern_yearly_on = "$yearly_recur_every*$yearly_on_month:$yearly_on_week:$yearly_on_day:0:0:0";
	#my $frequency_pattern_yearly_on = "every 4 days";
	my $frequency_pattern_yearly_on_the = "$yearly_recur_every*$yearly_on_the_month:$yearly_on_the_week:$yearly_on_the_day:0:0:0";
	#my $frequency_pattern_yearly_on_the = "every 1 year on Jan 1";
	#my $frequency_pattern = "0:1*0:0:29:0:0";
	#1*10:0:29:0:0
	#my $frequency_pattern_yearly_on_the = "1*1:4:5:0:0:0"; # Fourth friday of Jan every year
	#my @dates = ParseRecur("$every_year*10:0:29:0:0:0",$base,$start_date,$end_date);
	#my @dates = ParseRecur("$every_year*10:1:1:0:0:0",$base,$start_date,$end_date); # First Monday of Oct 
	my @yearly_dates_on = ParseRecur($frequency_pattern_yearly_on,$base,$start_date,$end_date); # On a certain day of a month
	my @yearly_dates_on_the = ParseRecur($frequency_pattern_yearly_on_the,$base,$start_date,$end_date); # First Monday of Oct 
	# 0:0*3:2:0:0:0        third tuesday of every month
	
	# "$every_year*10:0:1*1:0:0:0
  #my @dates = ParseRecur("2:1*2:2:0:0:0",$base,$start,$stop);
  #my @dates = ParseRecur("third tuesday of every month");
  #my @dates = ParseRecur("0:0:2:1:0:0:0");
  # $recur = ParseRecur($string [,$base,$date0,$date1,$flags]);
 # @dates = ParseRecur($string [,$base,$date0,$date1,$flags]);
#print "Dates :".@dates."\n";
print "\n";
print "******************************************************************************\n";
print "**************************** YEARLY *******************************************\n";
print "*******************************************************************************\n";
print "Start date :". $start_date."\n";
print "End date :". $end_date."\n";
print "\n";
print "******************************************************************************\n";
print "Temporal expression: every 1 year on October 29\n";
print "Rule: ".$frequency_pattern_yearly_on;
print "\n";
print "Dates:\n";
print Dumper (\@yearly_dates_on);
print "\n";
print "Temporal expression: every 1 year on the first Monday of October\n";
print "Rule: ".$frequency_pattern_yearly_on_the;
print "\n";
print "Dates:\n";
print Dumper (\@yearly_dates_on_the);
print "\n";
}
# Monthly
sub monthly () {
	my $base = "2015-10-29";
	my $start_date = "2016-01-22";
	my $end_date = "2017-06-01";
	my $monthly_recur_every ="1";
	my $monthly_day_of = "29";
	my $monthly_the_day = "1";
	my $monthly_the_week = "1";
	my $frequency = "";
	my $frequency_pattern_monthly_day = "0:$monthly_recur_every*0:$monthly_day_of:0:0:0";
	# my $frequency_pattern_monthly_day = "29th day of every month";
	my $frequency_pattern_monthly_the_day ="0:1*-2:5:0:0:0"; # Every month on the 2nd last Friday
	# my $frequency_pattern_monthly_the_day = "first monday of every month";
	#my $frequency_pattern_monthly_the_day = "0:$monthly_recur_every*$monthly_the_week:$monthly_the_day:0:0:0";
	#  0:1*4:2:0:0:0   Fouth tuesday of every month
	#my $frequency_pattern = "0:1*0:0:29:0:0";
	# 0:2*2:5:0:0:0 # second friday every two months 
	#my @dates = ParseRecur("$every_year*10:0:29:0:0:0",$base,$start_date,$end_date);
	#my @dates = ParseRecur("$every_year*10:1:1:0:0:0",$base,$start_date,$end_date); # First Monday of Oct 
	my @monthly_dates_day = ParseRecur($frequency_pattern_monthly_day,$base,$start_date,$end_date); # On a certain day of a month
	my @monthly_dates_the_day = ParseRecur($frequency_pattern_monthly_the_day,$base,$start_date,$end_date); # First Monday of Oct 
	# 0:0*3:2:0:0:0        third tuesday of every month
	
	# "$every_year*10:0:1*1:0:0:0
  #my @dates = ParseRecur("2:1*2:2:0:0:0",$base,$start,$stop);
  #my @dates = ParseRecur("third tuesday of every month");
  #my @dates = ParseRecur("0:0:2:1:0:0:0");
  # $recur = ParseRecur($string [,$base,$date0,$date1,$flags]);
 # @dates = ParseRecur($string [,$base,$date0,$date1,$flags]);
#print "Dates :".@dates."\n";
print "\n";
print "******************************************************************************\n";
print "**************************** MONTHLY *******************************************\n";
print "*******************************************************************************\n";
print "Start date :". $start_date."\n";
print "End date :". $end_date."\n";
print "\n";
print "******************************************************************************\n";
print "Temporal expression: Day 29 of every 1 month\n";
print "Rule: ".$frequency_pattern_monthly_day;
print "\n";
print "Dates:\n";
print Dumper (\@monthly_dates_day);
print "\n";
print "Temporal expression: The first monday of every month\n";
print "Rule: ".$frequency_pattern_monthly_the_day;
print "\n";
print "Dates:\n";
print Dumper (\@monthly_dates_the_day);
print "\n";
}
# Weekly
sub weekly () {
	my $base = "2015-10-29";
	my $start_date = "2016-01-22";
	my $end_date = "2016-03-01";
	my $weekly_recur_every ="1";
	# We need to add comma on the value we are getting from UI .. if the field is not selected means no value then 
	# no comma will be added
	my $first_day_of_the_week = ""; # Monday
	my $second_day_of_the_week = "2,"; # Tuesday
	my $third_day_of_the_week = ""; # Wednesday
	my $fourth_day_of_the_week = "4,"; #Thrusday
	my $fifth_day_of_the_week = ""; # Friday
	my $sixth_day_of_the_week = ""; # Saturday
	my $seventh_day_of_the_week = ""; # Sunday
	# my $weekly_the_day = "1";
	# my $weekly_the_week = "1";
	my $frequency = "";
	my $frequency_pattern_weekly_day = "0:0:$weekly_recur_every*$first_day_of_the_week$second_day_of_the_week$third_day_of_the_week$fourth_day_of_the_week$fifth_day_of_the_week$sixth_day_of_the_week$seventh_day_of_the_week:0:0:0";
	# my $frequency_pattern_weekly_day = "29th day of every month";
	# my $frequency_pattern_weekly_the_day = "first monday of every month";
	#my $frequency_pattern_weekly_the_day = "0:0:$weekly_recur_every*$first_day_of_the_week,$second_day_of_the_week,$third_day_of_the_week,$fourth_day_of_the_week,$fifth_day_of_the_week,$sixth_day_of_the_week,$seventh_day_of_the_week:$weekly_the_day:0:0:0";
	#my $frequency_pattern = "0:1*0:0:29:0:0";
	#$frequency_pattern_weekly_day ="0:0:1*2,3,4,5,7:0:0:0";
	#my $frequency_pattern_weekly_day = "0:0:1*1,2,:0:0:0"; #working -- every week on Monday and Tuesday
	#my @dates = ParseRecur("$every_year*10:0:29:0:0:0",$base,$start_date,$end_date);
	#my @dates = ParseRecur("$every_year*10:1:1:0:0:0",$base,$start_date,$end_date); # First Monday of Oct 
	my @weekly_dates_day = ParseRecur($frequency_pattern_weekly_day,$base,$start_date,$end_date); # On a certain day of a month
	# my @weekly_dates_the_day = ParseRecur($frequency_pattern_weekly_the_day,$base,$start_date,$end_date); # First Monday of Oct 
	# 0:0*3:2:0:0:0        third tuesday of every month
	#0:0:2*4:12,14:0:0   every 2 weeks on Thursday at 12:00 and 14:00
	# 0:0:3*4:0:0:0       every 3 weeks on Thursday
	# 0:0:1*1,2,3:0:0:0 
	# "$every_year*10:0:1*1:0:0:0
  #my @dates = ParseRecur("2:1*2:2:0:0:0",$base,$start,$stop);
  #my @dates = ParseRecur("third tuesday of every month");
  #my @dates = ParseRecur("0:0:2:1:0:0:0");
  # $recur = ParseRecur($string [,$base,$date0,$date1,$flags]);
 # @dates = ParseRecur($string [,$base,$date0,$date1,$flags]);
#print "Dates :".@dates."\n";
print "\n";
print "******************************************************************************\n";
print "**************************** WEEKLY *******************************************\n";
print "*******************************************************************************\n";
print "Start date :". $start_date."\n";
print "End date :". $end_date."\n";
print "\n";
print "Temporal expression: Every every week on Tuesday and Thrusday\n";
print "Rule: ".$frequency_pattern_weekly_day;
print "\n";
print "Dates:\n";
print Dumper (\@weekly_dates_day);
print "\n";
# print "******************************************************************************\n";
# print "Temporal expression: Recur the first monday of every month\n";
# print "Pattern: ".$frequency_pattern_weekly_the_day;
# print "\n";
# print "Dates: weekly_dates_the_day:\n";
# print Dumper (\@weekly_dates_the_day);
# print "\n";
}
# Daily
sub daily () {
	my $base = "2015-10-29";
	my $start_date = "2016-01-22";
	my $end_date = "2016-02-05";
	my $daily_recur_everyday ="1";
	# We need to add comma on the value we are getting from UI .. if the field is not selected means no value then 
	# no comma will be added
	my $first_day_of_the_weekday = "1,"; # Monday
	my $second_day_of_the_weekday = "2,"; # Tuesday
	my $third_day_of_the_weekday = "3,"; # Wednesday
	my $fourth_day_of_the_weekday = "4,"; #Thrusday
	my $fifth_day_of_the_weekday = "5"; # Friday
	my $daily_start_time = "8:00"; # 8AM
	# my $daily_the_day = "1";
	# my $daily_the_week = "1";
	my $frequency = "";
	#my $frequency_pattern_daily_everyday = "0:0:0:1*8:00:0";
	#my $frequency_pattern_daily_every_weekday = "0:0:1*1,2,3,4,5:0:0:0"; # Working pattern weekday
	# my $frequency_pattern_daily_every_weekday = "every monday and friday";
	my $frequency_pattern_daily_everyday = "0:0:0:$daily_recur_everyday*0:0:0";
	# 0:1*1-5:$dow:0:0:0";
	# "0:0:0:$n*0:0:0";  # Every nth day
	my $frequency_pattern_daily_every_weekday = "0:0:$daily_recur_everyday*$first_day_of_the_weekday$second_day_of_the_weekday$third_day_of_the_weekday$fourth_day_of_the_weekday$fifth_day_of_the_weekday:0:0:0";
	my @daily_dates_everyday = ParseRecur($frequency_pattern_daily_everyday,$base,$start_date,$end_date); # On a certain day of a month
	my @daily_dates_every_weekday = ParseRecur($frequency_pattern_daily_every_weekday,$base,$start_date,$end_date); # On a certain day of a month
	print "\n";
	print "******************************************************************************\n";
	print "**************************** DAILY *******************************************\n";
	print "******************************************************************************\n";
	print "Start date: ". $start_date."\n";
	print "End date: ". $end_date."\n";
	print "\n";
	print "Temporal expression: Everyday\n";
	print "Rule: ".$frequency_pattern_daily_everyday;
	print "\n";
	print "Dates:".@daily_dates_everyday."\n";
	print Dumper (\@daily_dates_everyday);
	print "\n";
	print "Temporal expression: Every weekday\n";
	print "Rule: ".$frequency_pattern_daily_every_weekday;
	print "\n";
	print "Dates:\n";
	print Dumper (\@daily_dates_every_weekday);
	print "\n";
	}