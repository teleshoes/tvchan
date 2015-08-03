#!/usr/bin/perl
use strict;
use warnings;

my $prefix = "/usr";

sub main(@){
  die "Usage: $0\n" if @_ > 0;
  system "sudo", "cp", "tvchan", "$prefix/bin";
}

&main(@ARGV);
