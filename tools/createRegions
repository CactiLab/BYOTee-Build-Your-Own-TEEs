#!/usr/bin/env python3
"""
Description: Generates system wide secrets containing all potential regions
Use: Once per ecosystem of devices
"""
import json
from argparse import ArgumentParser


def main(region_dict, file_name):
    try:
        secrets = open(file_name, "w")
    except Exception as e:
        print("Unable to open secrets file: %s" % (e,))
        return 0

    json.dump(region_dict, secrets)
    secrets.close()


def get_args():
    """gets arguments from command line"""
    parser = ArgumentParser(description='main interface to provision system')
    parser.add_argument('--region-list', help='list of regions for provisioning purposes',
                        required=True, nargs='+')
    parser.add_argument('--outfile', help='file to save region secrets to', required=True)
    args = parser.parse_args()
    return args.region_list, args.outfile


if __name__ == '__main__':
    region_list, outfile = get_args()
    print("generating system specific secrets")
    regions = {region: num for num, region in enumerate(region_list)}  # Create region IDs based on increasing integers
    main(regions, outfile)
