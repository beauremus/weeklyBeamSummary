#!/usr/local/bin/perl

my $filename = "weekly_summary.htm";
open (FILE, $filename) || die "Cannot open '$filename': $!";
my $file_as_string = join '', <FILE>;
# my $file_as_string = 'Hello world!';

print "Content-Type: text/html\n\n";

print '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Weekly Beam Summary</title>
</head>
<body>';

print $file_as_string;

print '
  <script>
    function findDate(string) {
      return string.match(/\d{4}-\d{2}-\d{2}/)[0]
    }

    function formatDate(date) {
      dateArr = date.split("-")
      return `${dateArr[1]}/${dateArr[2]}/${dateArr[0]}`
    }

    startDate = findDate(document.querySelector("u").textContent)

    newContent = ["Date"]

    newContent.push(formatDate(startDate))

    const tbody = document.querySelector("tbody")

    Array.from(tbody.children).forEach((currentValue, index, array) => {
      sample = currentValue.removeChild(currentValue.lastChild)

      if (index === 0) {
        sample.textContent += " pts"
      } else {
        sample.textContent = sample.textContent.replace("pts", "")
      }

      if (sample.colSpan === 4) {
        const cell = document.createElement("td")
        sample = cell
      }

      currentValue.insertBefore(sample, currentValue.children[1])

      content = "No Content"
      if (index > 0) {
        content = newContent[1]
      } else {
        content = newContent[0]
      }
      cell = document.createElement("td")
      cell.textContent = content
      currentValue.prepend(cell)
    })
  </script>
</body>
</html>';

print "\n";
