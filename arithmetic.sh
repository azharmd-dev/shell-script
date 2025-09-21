#!/bin/bash

#Date=$(date)
#echo "Date is :: $Date"

start_time=$(date +%T)

sleep 10

end_time=$(date +%T)

Total_time=$(($end_time - $start_time))
echo " start time is :: $start_time"
echo "end time is :: $end_time"
echo "Script execution time :: $Total_time  in sec"
