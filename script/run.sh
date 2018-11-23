#!/bin/bash

# main
show_final_msg(){
	./train.sh
	./toilet.sh
	./message.sh

}

show_pass_msg(){

	toilet -f bigascii12 -F gay "PASS"

}

show_fail_msg(){
	toilet -f bigascii12 -F metal "FAILED"
	
}

run_script(){

	proc="${1}.sh"
	#echo "./${proc} ${2}"
	./$proc ${2}
	if [ $? -eq 0 ];then 
		echo 
		#show_pass_msg
	else 
		show_fail_msg
		return 1
	fi 
}

run_process(){
	clear 
	toilet -f mono9 -F metal "Test Begin"
	get_item=(basic multiplechoice play_rps dices multiplechoice sensitivity simplemath)
	f=1
	file=
	for item in ${get_item[@]}
	do

		if [ "${item}" == "multiplechoice" ];then 
			local file="config${f}"
			run_script "$item" "$file"
			re=$? 		
			let f+=1
		else 
			run_script "$item"
			re=$? 
		fi  
		if [ $re -ne 0 ];then 
			return 1
		fi 
		
	done 	

}

while (( 1 )) 
do
	run_process
	if [ $? -eq 0 ];then 
		break;
	fi  

	echo "Take 2 seconds break and try again!!" && sleep 2

done
show_final_msg

