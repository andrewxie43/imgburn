#! /bin/bash


init=$(lsblk)

difference=""
while [ difference != "" ] 
do
    searched=$(lsblk)
    difference=diff <(echo init) <(echo searched)
done


echo "Inserted!"



