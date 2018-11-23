#!/bin/bash 

toilet -f digital -F metal "Basic Information"

echo "Read carefully, this program is only for JU.!!"
read -p "Who are you?" name


if [ "${name}" != "JU" ] && [ "${name}" != "ju" ];then
	echo "GO AWAY!.....You are not JU"
	exit 100
else 
	while : 
	do 
		echo "Hi $name, ready to test your memory? YES/NO"
		read yesno

		if [ "${yesno}" == "YES" ] || [ "${yesno}" == "yes" ];then 
			for i in {5..1}
			do 
				echo "$i"
				sleep 1
			done
			echo "GO..."
			break;	
		fi
		
		echo "Take Breath .... Relax! wait for you five seconds"
		sleep 5


	done 
fi 

