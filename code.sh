#!/bin/bash

read -p "Enter number 1-14: " a
if [ $a -gt 14 ] || [ $a -lt 1 ];
then
  echo "Number not 1-14"
  exit 1
fi

exist_timefile=0
if [ -e timefile];
then
  exist_timefile=1
fi

for year in {1991..2021..1}
do
  clear
  temp=$((($year-1991)*100/30))
  echo "Searching.. We are at $temp %"
  for month in {1..12..1}
  do
    max_day=30
    if [ $month -eq 1 ] || [ $month -eq 3 ] || [ $month -eq 5 ] || [ $month -eq 7 ] || [ $month -eq 8 ] || [ $month -eq 10 ] || [ $month -eq 12 ];
    then
      max_day=31
    fi

    if [ $month -eq 2 ];
    then
      (( !(year % 4) && ( year % 100 || !(year % 400) ) )) &&
      max_day=29 || max_day=28
    fi
    day=1
    while [ $day -le $max_day ]
    do
      find . -newermt "$year-$month-$day $a:00:00" ! -newermt "$year-$month-$day $a:59:59" -type f -exec grep -il "" {} \; >> timefile
      day=$((day+1))
    done
  done
done

if [ $exist_timefile -eq 0 ] && [ -s timefile ] ;
then
  rm -f timefile
fi
