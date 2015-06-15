#!/bin/bash

# Build script for the uHbench-map
# ================================
#
# This script is a helper tool to get the rendered files built in one go.
# Yes. This map was mostly intended for printing.
# There is a pretty good chance this script will not work on your system, but you can try ;)
#
# Dependencies:
# 	- Phantomjs
#	- Inkscape
#
# Then run it within this folder like this: sh build.sh 
# And watch the console for errors. 
# Complaints, suggestions or bitcoins, send them to julien [at] xuv.be 

# Extracting svg from the html page
phantomjs export-svg.js > map.svg

# Rendering the png, jpg and pdf
echo "Rendering to PNG"
inkscape -f map.svg --export-background="rgb(255,255,255)" --export-background-opacity=255 -e map.png
echo "Rendering to JPG"
inkscape -f map.svg --export-dpi 300 --export-background="rgb(255,255,255)" --export-background-opacity=255 -e map.jpg
echo "Rendering to PDF"
inkscape -f map.svg --export-text-to-path --export-background="rgb(255,255,255)" --export-background-opacity=255 -A map.pdf 

echo "Done."