#!/bin/bash

#bash for loop
for f in $( ls ~/wallpi2/*.jpg ); do
	echo "f="$f
	./kingscript.sh $f
done
