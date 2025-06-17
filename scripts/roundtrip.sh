#! /bin/sh
#
# roundtrip.sh
# Copyright © 2023 by NCSL International. All rights reserved
# Copyright (C) 2025 Ryan Mackenzie White <ryan.white4@canada.ca>
#
# Distributed under terms of the Copyright © Her Majesty the Queen in Right of Canada, as represented by the Minister of Statistics Canada, 2019. license.
#
# Round trip script
# Creates temporary output directory.
# Splits the full catalog and writes individual files to temp dir.
# Merges files back into catalog
# Validates final output
#

tempdir=`mktemp -d`
echo $tempdir
`python scripts/splitter.py -v -d "$tempdir" > $tempdir/log.txt`
grep INFO $tempdir/log.txt | while read line; do
    echo $line
done
dirlist=`ls -d "$tempdir"/*`
echo $dirlist
sh scripts/combiner.sh $tempdir
`python scripts/validator.py -v -d "$tempdir" -f merge.xml > $tempdir/validate.txt`

