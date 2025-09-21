#!/bin/bash

#Date=$(date)
#echo "Date is :: $Date"

start_time=$(date +%s)

sleep 10

end_time=$(date +%s)

Total_time=$(($end_time - $start_time))

echo "Script execution time :: $Total_time  in sec"
