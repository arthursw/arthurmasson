#!/usr/bin/python

from __future__ import print_function

from os import path

import os
import math
import sys
from PIL import Image

import getopt

# more info in: showHelp()


def showHelp():
    print('GalleryCreator -i <inputdir>')
    print('GalleryCreator will recursively walk the given directory and for each image:')
    print(' - output {{< figure link="/images/lunettes/lunettes6.png" size="ImageWidthxImageHeight" >}} ')

def main(argv):

    if len(argv) == 0:
        print('Error: misssing input directory.')
        showHelp()
        sys.exit(2)

    inputdir = ''
    overwrite = False

    try:
        opts, args = getopt.getopt(argv, "hi:", ["idir="])
    except getopt.GetoptError:
        print('Error: misssing input directory.')
        showHelp()
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            showHelp()
            sys.exit()
        elif opt in ("-i", "--idir"):
            inputdir = arg
        elif opt in ("-o", "--overwrite"):
            overwrite = True

    if len(inputdir) == 0:
        print('Error: misssing input directory.')
        showHelp()
        sys.exit()

    print('Reading directory: ' + inputdir)

    for root, dirs, files in os.walk(inputdir):
        files.sort()
        for file in files:
            try:
                (basename, ext) = os.path.splitext(file)
                originalFileName = path.join(root, file)
                with Image.open(originalFileName) as im:
                    (width, height) = im.size
                    print('{{< figure link="/images/' + originalFileName + '" size="' + str(width) + 'x' + str(height) + '" >}}')
            except IOError:
                pass


if __name__ == "__main__":
    main(sys.argv[1:])
