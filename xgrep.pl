#!/usr/bin/env perl
use strict;
use warnings;
use autodie;
use XML::LibXML;
use File::Spec::Functions;

my ($xpath, $directory) = @ARGV;

my @files = glob(catfile($directory, "*.xml"));
for (@files) {
    my $doc = XML::LibXML->load_xml(location => $_);
    my @ns = $doc->documentElement->findnodes($xpath);
    print "$_\n" unless @ns == 0;
}


