#!/usr/local/bin/perl
opendir my $dir, "clxsrv:/usr/local/userb/weeklyBeamSummary" or die "Cannot open directory: $!";
# opendir my $dir, "/Users/beau/Projects/fermi/operations/weeklyBeamSummary" or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir $dir;

print "ContentType: text/html\n\n";

print "<html>";
print "<body>";
foreach $file (@files) {
  print '<a href="'.$file.'">'.$file.'</a>';
}
print "</html>";
print "</body>\n";