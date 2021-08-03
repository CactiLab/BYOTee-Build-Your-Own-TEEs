"""
Description: Reads metadata
Use: OPTIONAL. No need to modify this script
"""
import struct
from argparse import ArgumentParser


# NOTE: teams are not required to update or include this file, it is purely for helping with debugging

def read_direct_bits(filename):
    """Helper function to read metadata from wave file"""
    raw_bytes = open(filename, 'rb')
    raw_bytes.read(44)  # header
    print("metadata length: {}".format(struct.unpack('B', raw_bytes.read(1))[0]))
    print("owner user ID: {}".format(struct.unpack('B', raw_bytes.read(1))[0]))
    number_of_regions = struct.unpack('B', raw_bytes.read(1))[0]
    print("Number of Authorized Regions: {}".format(number_of_regions))
    authorized_users = struct.unpack('B', raw_bytes.read(1))[0]

    print("Number of Authorized Users: {}".format(authorized_users))

    for n2 in range(number_of_regions):
        print("Authorized Region {}: {}".format(n2 + 1, struct.unpack('B', raw_bytes.read(1))[0]))

    for num in range(authorized_users):
        print("Authorized user ID {}: {}".format(num + 1, struct.unpack('B', raw_bytes.read(1))[0]))

    raw_bytes.close()


def main():
    parser = ArgumentParser(description="Helper function to check metadata")
    parser.add_argument('--filename', help="location where protect song is stored", required=True)
    args = parser.parse_args()
    read_direct_bits(args.filename)


if __name__ == '__main__':
    main()
