#!/bin/bash
echo $#
if [ $# -lt 1 ]
then
	echo "multi-rename.sh directory init-number"
	exit
fi

directory=$1

for i in `ls $1`
do
	echo $i
	count=1000000
	for j in `ls $1$i`
	do
		echo $j
		suffix=${j##*.}
		echo $suffix
		filename=$1$i/$j
		echo $filename
		let count=$count+1
		echo $count
		newfilename=$1$i/$count.$suffix
		echo $newfilename
		`mv $filename $newfilename`
		
	done
done

