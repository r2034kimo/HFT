#!/bin/bash 

declare -A matrix

muti_choice(){

	option1="$1" 
	option2="$2" 
	option3="$3"
	option4="$4"
	
	echo "Please select one:"
	local i=1
	echo "======================================"
	for o in "$option1" "$option2" "$option3" "$option4"
	do 
		echo "$i) $o"
		let i+=1
	done 
	echo "======================================"
	
	read result

	case $result in 
		1)
			usr_ans="$option1"
			;;
		2)
			usr_ans="$option2"
			;;
		3)
			usr_ans="$option3"
			;;
		4) 
			usr_ans="$option4"
			;;
		*)
			echo "Invaild Number.."
			usr_ans=""
		
	esac
}

get_config(){
	

	IFS=$'\n' read -d '' -r -a lines < config 
	for (( l=1; l<${#lines[@]}; l++))
	do
		IFS=',' read -r ques opt1 opt2 opt3 opt4 ans <<< ${lines[$l]}
		 
		echo "Question ${q}: $ques"
		muti_choice "$opt1" "$opt2" "$opt3" "$opt4"

		if [ "${usr_ans}" == "${ans}" ];then
               		echo "Correct"
        	else
                        echo "Wrong"
                        exit 1
        	fi
	done 
	

}

get_config 

