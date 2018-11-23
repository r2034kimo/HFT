#!/bin/bash

#calculate a simple math

rounds=10
correct=0
wrong=0

operation(){

	case $1 in 
	        1)
			display="+"
			wording="Addition"
 			;;
		2) 
			display="-"
			wording="Substract"
			;;
		3) 
			display="*"
			wording="Mutiply"
			;;
		4)
			display="/"
			wording="Divide"
			;;
	esac

}

calcute(){

	num1=$1
	num2=$2 
	op="$3"

	echo "${num1}${op}${num2}" | bc
#	echo $(( num1 $op num2 ))
}

game(){

	toilet -f digital -F metal "Math Test"
	echo "Begin to test your Math skill"
	r=1
	while [ $rounds -gt 0 ] 
    	do 
	
		x=$(shuf -i 1-3000 -n 1)
		y=$(shuf -i 1-3000 -n 1)
		o=$(shuf -i 1-4 -n 1)

		operation $o	
		re="$( calcute $x $y "$display" )"
		
		while (( 1 ))
		do 
			echo "Question ${r}. $x $wording $y is equal?"
			read ans
			
			if [ ${#ans} -ge 1 ];then 
				break;
			fi 
		done
		
		echo "Ans: $re"
		if [ $ans -eq $re ];then 
			echo -e "\033[1;36;40m Correct \033[0m"
			let correct+=1
		else 
			echo -e "\033[1;31;40m Wrong \033[0m"
			let wrong+=1
		fi 
		let rounds-=1
		let r+=1
	done
	
	echo "You got $correct out of $r" 

}
clear
game
