#!/bin/bash

mkdir -p stl

for scad_file in scad/*;
do
	output_filename="$(b=${scad_file##*/}; echo stl/${b%.*}).stl"
	echo $output_filename

	openscad $scad_file -o $output_filename 
done
