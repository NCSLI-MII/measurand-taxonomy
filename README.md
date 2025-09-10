# Measurand Taxonomy

## NCSLI MII Measurand Taxonomy Catalog

To generate a html from the xml source, use xsltproc
```
xsltproc -o MeasurandTaxonomyCatalog.html MeasurandTaxonomyCatalog.xsl MeasurandTaxonomyCatalog.xml
```

## Documentation
Documentation can be generated using Sphinx. To get started, create a conda environment with sphinx and build the docs.

```
conda create -n <environment_name> --file requirements.txt
sphinx-build -M html docs docs/build
```
Open the documentation, `docs/build/html/index.html`, in your browser 

## Alphanumeric codes
Random four character assignment of codes for property identifiers.
```
apg -n 1 -x 4 -m 4 -M NL -a 1
```
Example: id="propertyIDo7d3"

## Copyright and License

Copyright © 2023 by NCSL International. All rights reserved

Shield: [![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
