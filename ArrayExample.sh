#!/bin/bash

#===========================================================================================# 
# Le programme enregistre des notes en fonction du nom, calcule une moyenne et l'affiche
# Si le note est negative, >20, != nombre, saisie de la touche q : fin du programme 
#===========================================================================================#


sommeNotes=0
j=0 #indice dans tableau associatif
i=0 #nombre de notes saisies
moyenne=0
note=0
nom=""

read -p "Saisir le nom : " nom 

until [ "$note" -lt "0" ] || [ "$note" -gt "20" ] 
do

    read -p "Saisir une nouvelle note : " note
        if ! [[ "$note" =~ ^[0-9]+$ ]] || [ "$note" = q ]
            then note=-1   

        elif [ "$note" -gt "0" ]  && [ "$note" -lt "10" ]
            then
            echo "La note est insuffisante"
        elif [ "$note" -ge "10" ] && [ "$note" -lt "12" ]
            then
            echo "La note est moyenne"
        elif [ "$note" -ge "12" ] && [ "$note" -lt "14" ]
            then
            echo "La note est assez bien"

        elif [ "$note" -ge "14" ] && [ "$note" -lt "16" ]
            then
            echo "La note est bien"
        elif [ "$note" -ge "16" ] && [ "$note" -le "20" ]
            then
            echo "La note est très bien"
        fi

    if [ "$note" -ge "0" ]
        declare -A tableau_asso=( ["$nom"]="$note" )
        then
        let sommeNotes=$sommeNotes+$note
        let i=$i+1
    fi
done

if [ "$note" -lt "0" ] || [ "$note" = q ] 
    then
    echo "Vous allez quitter le programme"
fi


if [ "$i" = 0 ] || [ "$note" -gt "20" ] 
    then
        if ! [[ "$note" =~ ^[0-9]+$ ]] 
        then
            echo "La moyenne ne peut pas être calculée"
        fi
    else let moyenne=$sommeNotes/$i
        echo "La moyenne des notes est : $moyenne ($i notes)"
            for j in "${!tableau_asso[@]}"
            do

            echo "clé $j"
            echo "valeur ${tableau_asso[j]}"
            done
            
fi