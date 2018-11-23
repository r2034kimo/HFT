#!/bin/bash

# Script: Dices

rounds=6 

human_score=0 
computer_score=0

compute_chosen(){
     com_ram=$(shuf -i 1-6 -n 1)
     hum_ram=$(shuf -i 1-6 -n 1)
}

game(){
     
     r=1
     toilet -f digital -F metal "ROLL A DICE"                    
     while [ $rounds -gt 0 ] 
     do 
         echo -e "\nRound: $r"     
         compute_chosen
		 echo "You: $hum_ram"
		 echo "Me: $com_ram"

	     if [ $com_ram -gt $hum_ram ];then 
			echo -e "\e[1;33;40m I WIN! \e[0m" 
			let computer_score+=1
		 elif [ $com_ram -lt $hum_ram ];then
            echo -e "\033[1;31;40m YOU WIN! \033[0m"
			let human_score+=1
		 else 
			echo "TIE!"
		 fi 
		 sleep 3
		 read -p "Please press any key....!" key
		 
		 let rounds-=1
		 let r+=1
     done

     echo "Your scored: $human_score"
     echo "My scored: $computer_score"
     
     if [ $computer_score -gt $human_score ]; then
       	toilet -f future -F metal "YOU LOSE!"
     elif [ $human_score -gt $computer_score ]; then
        toilet -f future -F gay "YOU WIN :)"
     elif [ $computer_score -eq $human_score ]; then
        echo "The game is a draw!"
     fi

}
clear
game
