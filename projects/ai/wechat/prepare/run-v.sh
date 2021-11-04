#!/bin/bash

#rm -rf ../input/tfrecords$1

python gen-records.py --mark=valid --records_name=tfrecords$1
for ((d=1; d<=14; d++))
do
  echo ----------------------------$d
  python gen-records.py --mark=train --records_name=tfrecords$1 --day=$d
done
python gen-records.py --mark=test --records_name=tfrecords$1