#!/bin/bash

# main
show_finial_msg(){
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
		exit 1 
	fi 
}

run_process(){

	get_item=(train basic multiplechoice play_rps dices multiplechoice sensitivity simplemath)
	f=1
	file=
	for item in ${get_item[@]}
	do

		if [ "${item}" == "multiplechoice" ];then 
			local file="config${f}"
			echo "$item $file"	
			run_script "$item" "$file"		
			let f+=1
		else 
			echo "$item"
			run_script "$item"
		fi  
	done 	

}

run_process
