#!/bin/sh
#
# Copyright © 2023 by NCSL International. All rights reserved
# Copyright © 2025 Ryan Mackenzie White <ryan.white4@canada.ca>
#
# Distributed under terms of the Copyright © Her Majesty the Queen in Right of Canada, as represented by the Minister of Statistics Canada, 2019. license.
# 
# Given an input directory containing individual taxon files
# the following merges the files and adds the required comments.
# Requires python environment with xmltodict and yq installed

dirlist=`LC_ALL=C ls -d -v "$1"/*xml`
echo $dirlist
#echo "${dirlist[@]}"

xq -s '{Taxonomy: {Taxon: [.[]."mtc:Taxon"]}} | .Taxonomy += {"@xmlns:mtc":.Taxonomy.Taxon.[0]["@xmlns:mtc"]} | .Taxonomy += {"@xmlns:uom":.Taxonomy.Taxon.[0]["@xmlns:uom"]} | del(.Taxonomy.Taxon.[]["@xmlns:mtc"]) | del(.Taxonomy.Taxon.[]["@xmlns:uom"])' $dirlist -x | tee > $1/merge.xml

sed -i '1 i\\<\!\-\-\
    \# Copyright\
    \Copyright © 2023 by NCSL International. All rights reserved\
    \# Permission To Reproduce\
    \NCSL International (NCSLI) grants permission to make fair use of the material contained in this publication, including reproduction of part or all of its pages, according to the Creative Commons Attribution 4.0 license and under the following conditions\: \
    \1) The NCSLI copyright notice appears at the beginning of the publication.\
    \2) The words “NCSL International Technical Publication” appears on each page reproduced.\
    \3) The disclaimer hereafter is incorporated and understood by all persons or organizations reproducing the publication.\
    \# Permission To Translate\
    \Permission to translate part or all of this publication is granted provided that the following conditions are met\:\
    \1) The NCSLI copyright notice appears at the beginning of the translation.\
    \2) The words “Translated by [translator\x27s name]” appear on each page translated.\
    \3) The following disclaimer is included and understood by all persons or organizations translating this publication. If the translation is copyrighted, the translation must carry a copyright notice for both the translation and for the publication from which it is translated.\
    \# Disclaimer\
    \The materials and information contained herein are provided and promulgated as an industry aid and guide, and are based on standards, formulae, and techniques recognized by NCSL International. The materials are prepared without reference to any specific federal, state, or local laws or regulations, and NCSL International does not warrant or guarantee any specific result when relied upon. The materials provide a guide or recommended practices and are not all-inclusive.\
    \From time-to-time commercial equipment, instruments, or materials are identified in technical publications to foster understanding. Such identification does not imply recommendation or endorsement by the NCSL International, nor does it imply that the materials or equipment identified are necessarily the best available for the purpose.\
    \Non-binding CC license summary: https\:\/\/creativecommons.org\/licenses\/by-sa\/4.0\/\
    \Legal license: https\:\/\/creativecommons.org\/licenses\/by-sa\/4.0\/legalcode\
\-\-\>' $1/merge.xml

sed -i '1 i\\<\?xml version="1.0" encoding="utf-8"\?\>' $1/merge.xml 
sed -i 's/\<Taxon/\mtc:Taxon/g' $1/merge.xml
echo $1



