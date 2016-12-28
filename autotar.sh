#!/bin/bash

# This program auto-installs tarballs for you.
# I designed this for Linux noobies who don't
# know how to install tarballs. Or, it's for
# people like me who are just lazy, and don't
# want to put in the commands ourselves.
# If you want to submit any possible changes
# to the program, please contact me at
# <bubbadoobop@gmail.com>

echo "AutoTar v1.1"
echo "Gnu GPL v2.1"
read -p "Path to tarball:" pathname
cd "${pathname/#~/$HOME}"
    ls $pathname
       read -p "Please enter the file you wish to complile: " filename
				     case $filename in
					 *.tar.gz|.tgz) tar -xzf "$filename" ;;
					 *.tar.bz2|*.tbz2) tar -xjf "$filename" ;;
					 *.tar.xz|*.txz) xz -d <"$filename" | tar -xv ;;
					 *.zip)          unzip "$filename" ;;
				     *.tar) tar -xvf "$filename";;
				     esac
				     
ls $pathname
read -p "Please enter the directory of the file you have just unpacked...: " directory
cd $directory
read -p "Is this just a script or one file program? [Y/n]" ans

case $ans in
    y | Y) read -p "What is the file called? *includes file extension*: " file2
	   read -p "What is the file called? *without the extension*: " file3
	   install $file2 /usr/local/bin/$file3
	   ;;
    n | N) ./configure
	   make
	   make check
	   make install
	   ;;
    esac
