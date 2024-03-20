#!/bin/bash
read -p "Voulez-vous mettre  jour les logiciels ? (O/n) : " choix
#choix de l'utilisateur
if [[ $choix == "O" || $choix == "o" || $choix == "" ]]; then
	sudo apt update && sudo apt upgrade -y
	if [ $? -eq 0 ]; then
		echo "Maj des logiciels fait !"
	else
		echo "Aucune maj n'est faite"
	fi
else
	echo "Aucune maj dispo"
fi
