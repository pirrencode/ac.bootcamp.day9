#!/usr/bin/env bash

hadoop fs -get /user/oozie_tasks/STEP1/in/input_data_20180215.csv /home/cloudera/projects/ac.bigdata.day10

value=$(<input_data_20180215.csv)
LASTCHAR="$(echo "${value: -1}")"
echo $LASTCHAR

sed '1d;2d; $ d' input_data_20180215.csv > output.csv

FNAME="output.csv"
   declare -i recordcount
      for f in $FNAME
     do
          recordcount=$(wc -l < $FNAME)
     done
echo $recordcount

test $LASTCHAR = $recordcount
echo $?

hadoop fs -put /home/cloudera/projects/ac.bigdata.day10/output.csv /user/oozie_tasks/STEP2/YYYY/MM/DD