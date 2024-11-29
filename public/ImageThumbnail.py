#!/usr/bin/python

from __future__ import print_function

from os import path

import os
import math
import sys
import PIL
from PIL import Image

import getopt

# more info in: showHelp()


def showHelp():
    print('ImageThumbnail -i <inputdir> [-o]')
    print('ImageThumbnail will recursively walk the given directory and for each image:')
    print(' - create a thumbnail version of max size thumbnailMaxSize, named "imageName-thumb.ext"')
    print(' - if the image name already ends with "-thumb" the image is ignored')
    print(' - if the "imageName-thumb.ext" exists, the image is ignored except if the option -o (or --overwrite) is given')
    print(' - the extension is always lowered (no capital letter allowed in the extension)')

def main(argv):

    if len(argv) == 0:
        print('Error: missing input directory.')
        showHelp()
        sys.exit(2)

    inputdir = ''
    overwrite = False

    try:
        opts, args = getopt.getopt(argv, "hi:o", ["idir=", "overwrite="])
    except getopt.GetoptError as err:
        print(err)
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
        print('Error: input directory is empty.')
        showHelp()
        sys.exit()

    print('Reading directory: ' + inputdir)

    width = 800
    height = 600
    thumbnailMaxSize = 400
    for root, dirs, files in os.walk(inputdir):
        for file in files:
            try:
                print(str(path.join(root, file)))
                (basename, ext) = os.path.splitext(file)
                originalFileName = path.join(root, file)
                newFileName = path.join(root, basename + ext.lower())
                thumbnailName = path.join(root, basename + '-thumb' + ext.lower())
                if ( os.path.isfile(thumbnailName) and not overwrite ) or basename.endswith('-thumb'):
                    print('Ignore ' + originalFileName)
                    continue
                with Image.open(originalFileName) as im:
                    (width, height) = im.size
                    ratio = width / float(height)
                    if width > height:
                        finalWidth = min(width, thumbnailMaxSize)
                        finalHeight = finalWidth / ratio
                    else:
                        finalHeight = min(height, thumbnailMaxSize)
                        finalWidth = finalHeight * ratio
                    out = im.resize((int(finalWidth), int(finalHeight)), PIL.Image.BOX)
                    # os.rename(originalFileName, fileNameLarge)
                    out.save(thumbnailName, im.format)
            except IOError:
                pass


if __name__ == "__main__":
    main(sys.argv[1:])
