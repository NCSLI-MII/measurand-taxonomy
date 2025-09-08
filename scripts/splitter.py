#! /usr/bin/env python3
# vim:fenc=utf-8
#
# Copyright © 2023 by NCSL International. All rights reserved
# Copyright © 2025 Ryan Mackenzie White <ryan.white4@canada.ca>
#
# Distributed under terms of the Copyright © Her Majesty the Queen in Right of Canada, as represented by the Minister of Statistics Canada, 2019. license.

"""

"""
import tempfile
import argparse 
import pprint

import xmltodict

def main(*args):
    infile = args[0]
    dirpath = args[1]
    verbose = args[2]
    
    print(f'INFO: Splitting Taxonomy filename {args[0]}')
    print(f'INFO: Splitting Taxonomy to temporary path {dirpath}')
    
    schema_taxonomy = (
            "https://cls-schemas.s3.us-west-1.amazonaws.com/MII/MeasurandTaxonomyCatalog"
            )

    schema_uom = (
        "https://cls-schemas.s3.us-west-1.amazonaws.com/MII/UOM_Database"
    )
    
    taxons ={}
    with open(infile) as f:
        taxons = xmltodict.parse(f.read())
    
    for taxon in taxons["mtc:Taxonomy"]["mtc:Taxon"]:

        dict_ = {"mtc:Taxon":taxon}
        dict_['mtc:Taxon']['@xmlns:mtc'] = schema_taxonomy
        dict_['mtc:Taxon']['@xmlns:uom'] = schema_uom
        fname =  dict_['mtc:Taxon']['@name'].replace('.', '_')+'.xml'
        
        if verbose is True:
            print(f"=====================================================")
            print(f"Writing dict_['Taxon']['@name'] to {dirpath}/{fname}")
            pprint.pprint(taxon)
            print(xmltodict.unparse(dict_, pretty=True)) 

        with open(dirpath+'/'+fname, 'w') as f:
            f.write(xmltodict.unparse(dict_, pretty=True))
    return dirpath


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
            prog='splitter',
            description='Generates individual taxon xml from complete catalog',
            )
    parser.add_argument('-f', '--filename', 
            default='MeasurandTaxonomyCatalog.xml', 
            help="Input taxonomy file")
    parser.add_argument('-d', '--dirpath', help="Output directory")
    parser.add_argument('-v', '--verbose', action='store_true')
    args = parser.parse_args()
    print(args)
    print(f'INFO: filename args.filename')
    print(f'INFO: verbose args.verbose')
    print(f'INFO: output directory args.dirpath')

    if args.dirpath:
        dirpath = args.dirpath
    else:
        dirpath = tempfile.mkdtemp()

    main(args.filename, dirpath, args.verbose)
