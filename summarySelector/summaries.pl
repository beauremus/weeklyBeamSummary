opendir my $dir, "/usr/local/userb/weeklyBeamSummary" or die "Cannot open directory: $!";
my @files = readdir $dir;
closedir $dir;

print "ContentType: text/html;\n\n"
print @files;