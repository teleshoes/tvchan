#!/usr/bin/perl
use strict;
use warnings;

sub run(@);

my $klompDir = "./klomp";

sub main(@){
  run "sudo", "apt-get", "install",
    "mpv",       #core video player
    "socat",     #for mpv --input-ipc-server
    "bsdutils",  #for 'script' command
  ;

  if(-d $klompDir){
    chdir $klompDir;
    run "git", "pull";
  }else{
    run "git", "clone", "https://github.com/teleshoes/klomp.git", $klompDir;
    die "klomp does not exist after git clone\n" if not -d $klompDir;
    chdir $klompDir;
  }
  run "./install.pl";
}

sub run(@){
  print "@_\n";
  system @_;
  die "Error running \"@_\"\n" if $? != 0;
}

&main(@ARGV);
