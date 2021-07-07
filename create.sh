#!/bin/bash

wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_SRG-STIG_Library_2021_04v1.zip
mkdir temp
unzip -d temp -o U_SRG-*.zip
rm U_SRG-*.zip

for i in {1..5}
do
    find . -name "*.zip" -print0 | while read -d $'\0' file
    do
        echo $file
        unzip -d temp -o $file
        rm -f $file
    done
done

mkdir stigs
find . -name 'U*xccdf.xml' -print0 | while read -d $'\0' file
do
    cp "$file" ./stigs/
done

rm -rf temp
