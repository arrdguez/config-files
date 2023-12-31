#!/bin/bash
for i in $(ps ax | grep conky | awk -F" " '{print $1}');
do
    echo $i

    kill -9 $i;
done;