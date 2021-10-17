#!/bin/bash

mkdir -p png

for scad_file in scad/*;
do
	output_filename="$(b=${scad_file##*/}; echo png/${b%.*}).png"
	echo $output_filename

	openscad $scad_file --render -o $output_filename --imgsize=1000,1000 
done
