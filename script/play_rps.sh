#!/bin/bash

# Script: Rack Pappper Scissors

#shuf -i 1-3 -n 1 

rounds=5

human_score=0 
computer_score=0

#win x y =  2 if y beats x, 1 if x beats 1, 0 if it's a tie
win(){
    com="$1"
    hum="$2"
    result=$(( 3 + com ))
    result=$(( result - hum ))	
    echo $(( result % 3 ))
}

show_name(){

    case "$1" in 
    "r"|"1") 
	     show_choice="Rack"
             choice="1"
             ;; 
    "p"|"2")
             show_choice="Papper"
             choice="2"
             ;;
    "s"|"3")
             show_choice="Scissoirs"
             choice="3"
             ;;
    *)
             echo "Unrecognized choice.  Try again!"
    	     ;;
    esac 
}

compute_chosen(){
     com_ram=$(shuf -i 1-3 -n 1)
}

human_chosen(){
     echo -n "Rock, Paper or Scissors (r/p/s): "
     read -r hc
     
}

game(){
     
     standard='^[rps]+$'
     r=1
     echo "$rounds times ... start the game!!"
     while [ $rounds -gt 0 ] 
     do 
         echo "Round: $r"     
	 compute_chosen
         human_chosen
   	 if ! [[ "$hc" =~ $standard ]] || [ "${#hc}" != "1" ]; then
     		echo "That is not a valid move!"
     		echo -e "Please chose again.\n"
         else
	        show_name "$hc"
		echo "You: $show_choice"
		h=$choice

  	        show_name "$com_ram"
		echo "Me: $show_choice"
		c=$choice

		w="$(win "$c" "$h" )"
		case "$w" in
     		   2) 
			echo -e "\033[1;31;40m YOU WIN! \033[0m"
			let human_score+=1
		   	;;
     		   0)   
			echo "TIE!"
		   	;;
     		   1) 
			echo -e "\e[1;33;40m I WIN! \e[0m" 
			let computer_score+=1
			;;
     		   *) 
			echo "winner returned weird result '$w'"
			;;
  		   esac
		   
		   let rounds-=1
		   let r+=1
	 fi 
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

game
