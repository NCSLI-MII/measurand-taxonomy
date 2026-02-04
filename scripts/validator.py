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

import lxml.etree as ET
import xmlschema

import argparse
import time
from pathlib import Path

def validate(*args):
    schema = xmlschema.XMLSchema('MeasurandTaxonomyCatalog.xsd')
    print(f'Validating file: {args[0]}')
    try:
        xml_doc = ET.parse(args[0])
    except Exception as e:
        raise e
    else:
        try:
            schema.validate(args[0])
        except Exception as e:
            for error in schema.iter_errors(xml_doc):
                print('===================')
                print(f'file: {name}; sourceline: {error.sourceline}; path: {error.path} | reason: {error.reason} | message: {error.message}')
                print('===================')
            raise e

def validate_list(*args):
    schema = xmlschema.XMLSchema('MeasurandTaxonomyCatalog.xsd')
    
    lst = open(args[1], 'r+').read().splitlines()

    for name in lst:
        p = Path(args[0])
        file_ = p / name
        print(f'Validating file from list: {file_}')
        try:
            xml_doc = ET.parse(file_)
        except Exception as e:
            raise e
        else:
            try:
                schema.validate(file_)
            except Exception as e:
                for error in schema.iter_errors(xml_doc):
                    print('===================')
                    print(f'file: {name}; sourceline: {error.sourceline}; path: {error.path} | reason: {error.reason} | message: {error.message}')
                    print('===================')
                raise e

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            prog='validator',
            description='Validates taxonomy and schema'
            )
    parser.add_argument('-f', '--filename', 
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
