#!/bin/bash

# Sensitivity test

times=30

countdown()
{
  _IFS="$IFS"
  IFS=':'
  set -- $*
  IFS="$_IFS"
  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
  while [ $secs -gt 0 ]
  do
    sleep 1 &
    printf "\r%02d:%02d:%02d" $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
    secs=$(( $secs - 1 ))
    wait
  done
  echo

}


run_sensor_test()
{
   echo -ne "Please press . in 5 seconds!\n You must press over than $times !\n Remeber to press "Enter" in last second.\n" 
   echo "3" && sleep 1
   echo "2" && sleep 1 
   echo "1" && sleep 1  
   echo "GO......" 
   countdown "00:00:05" &
   read -t 5 key 
   
   echo "You pressed ${#key} "
   if [ ${#key} -lt 30 ];then 
	echo "You Must try it again..."	
	exit 1
   else 
	echo "Your sensitivity is very good..."
   fi 
}

run_sensor_test

