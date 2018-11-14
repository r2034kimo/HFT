#!/bin/bash
. ../commonlib 
# SHOW COLORFUL WORD
string=9

convert_string(){
    str="$1"
    w=`echo $str | awk '{print length}'`
    if [ $w -ne $string ];then 
    	diff=$(($string - $w))
        while [ $diff -gt 0 ]
	do 
            if [[ $(( $diff & 1 )) -eq 0 ]]; then 
                str="$str "
            else 
                str=" $str"
            fi
            let diff-=1

	done	
    fi 
}


run_toilet(){
    
    str=
    convert_string $1

    toilet -f letter -w 160 --gay "$str"	
}

show_msg(){

run_toilet HAPPY
run_toilet Birthday

}




while true; do
    clear 
    
    echo -e "\n\n\n"

    show_msg

    sleep 1

    echo 'Press any key to exit'
    if read -r -N 1 -t 0 ; then
        break
    fi

    clear
    sleep 0.5 

done

