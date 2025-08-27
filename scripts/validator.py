#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2023 by NCSL International. All rights reserved
# Copyright © 2025 Ryan Mackenzie White <ryan.white4@canada.ca>
#
# Distributed under terms of the Copyright © Her Majesty the Queen in Right of Canada, as represented by the Minister of Statistics Canada, 2019. license.

"""
Validation script for schema and catalog.
Uses schema in current directory.
Optional input taxonomy file can passed for validation.
Requires python environment with xmlschema
"""

import xmlschema
import argparse
import time
from pathlib import Path

def validate(*args):
    schema = xmlschema.XMLSchema('MeasurandTaxonomyCatalog.xsd')
    schema.validate(args[0])

def validate_list(*args):
    schema = xmlschema.XMLSchema('MeasurandTaxonomyCatalog.xsd')
    
    lst = open(args[1], 'r+').read().splitlines()

    for name in lst:
        p = Path(args[0])
        f = p / name
        print(f)
        schema.validate(f)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            prog='validator',
            description='Validates taxonomy and schema'
            )
    parser.add_argument('-f', '--filename', 
            default='MeasurandTaxonomyCatalog.xml', 
            help="Input taxonomy file")
    parser.add_argument('-d', '--dirpath', help="Output directory")
    parser.add_argument('-v', '--verbose', action='store_true')
    parser.add_argument('-l', '--list', help="list of filenames")
    
    args = parser.parse_args()
    print(args)
    p = Path(args.dirpath)
    if args.list is not None:
        validate_list(args.dirpath, args.list)
    else:
        f = p / args.filename
        print(f.resolve())
        validate(f)
