#!/bin/bash

i=0

website="https://www.redhat.com/security/data/metrics/ds/"

curl -L -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0" $website -o "page.html"
tidy -wrap 0 -asxml -im page.html

for file in `ruby scrape.rb` 
do
echo "Downloading $file ...."
  fname=`basename $file`
  curl -L  -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0" $file -o "$fname"
echo "Saved to eap70-updates-$i.zip "
  ((i++))

done
