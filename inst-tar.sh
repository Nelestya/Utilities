#installation du jdk
#use bash command

#Variable ARCHIVE est le nom de l'archive à installer
#ARCHIVE="server-jre*.tar*"
#ARCHIVE="jdk*.tar*"
#Si vous préférer entrer l'archive vous même
ARCHIVE="$1*.tar*"

#Variable NAMEPATH est le chemin qui sera mis dans .profil
NAMEPATH=$1

#Repertoire ou vous voulez l'installer (root)
#REPESITORYROOT="/usr/java/"
REPESITORY="$2"

echo "$USERNAME nous allons procéder a l'installation de votre archive tar"

#Si l'utilitlisateur est root alors
if [ $LOGNAME == "root" ]
then
#Variable UNARCHIVE est le dossier extrait de l'archive on prend la première ligne
	UNARCHIVE=$(find / -name $ARCHIVE -exec tar -tf {} \; | cut -d / -f 1 | head -n 1)
#recherche du jdk et extraction (root)
	find / -name $ARCHIVE -exec tar -xvf {} \;
#nom de l'extraction de l'archive du jdk*.tar* (root)
	ROUTPATH=$(find / -name $UNARCHIVE)
	mv $ROUTPATH $REPESITORY
	unset ROUTHPATH
	ROUTPATH=$(find / -name $UNARCHIVE)
	echo -e "$USERNAME votre dossier se trouve ici :"
	echo -e "$ROUTHPATH"
	echo -e "Voulez-vous créer un Chemin vers le $NAMEPATH $USERNAME?"

#Entrer clavier
	read RESPONSE

	while [ $RESPONSE != "yes" ] && [ $RESPONSE != "y" ] && [ $RESPONSE != "Y" ] && [ $RESPONSE != "YES" ] && [ $RESPONSE != "n" ] && [ $RESPONSE != "non" ] && [ $RESPONSE != "N" ] && [ $RESPONSE != "NON" ]
	do

		read RESPONSE

	done
	if [ $RESPONSE == "yes" ] || [ $RESPONSE == "y" ] || [ $RESPONSE == "Y" ] || [ $RESPONSE == "YES" ]
	then
		#Création du chemin vers le dossier bin
		echo "$NAMEPATH=$ROUTPATH" >> $HOME/.profile
		echo 'export PATH=$PATH:'$NAMEPATH'/bin' >> $HOME/.profile
	fi
#Sinon
else
#Variable UNARCHIVE est le dossier extrait de l'archive
	UNARCHIVE=$(find $HOME/ -name $ARCHIVE -exec tar -tf {} \; | cut -d / -f 1 | head -n 1)
#recherche du jdk et extraction (user)
	find $HOME/ -name $ARCHIVE -exec tar -xvf {} \;
#nom de l'extraction de l'archive du *.tar* (user)
	ROUTPATH=$(find $HOME/ -name $UNARCHIVE)
	mv $ROUTPATH $REPESITORY/
	unset ROUTHPATH
	ROUTPATH=$(find $HOME/ -name $UNARCHIVE)
	echo -e "$USERNAME votre dossier se trouve ici :"
	echo -e "$ROUTHPATH"
	echo -e "Voulez-vous créer un Chemin vers le $NAMEPATH $USERNAME?"

#Entrer clavier
	read RESPONSE

	while [ $RESPONSE != "yes" ] && [ $RESPONSE != "y" ] && [ $RESPONSE != "Y" ] && [ $RESPONSE != "YES" ] && [ $RESPONSE != "n" ] && [ $RESPONSE != "non" ] && [ $RESPONSE != "N" ] && [ $RESPONSE != "NON" ]
	do

		read RESPONSE

	done
	if [ $RESPONSE == "yes" ] || [ $RESPONSE == "y" ] || [ $RESPONSE == "Y" ] || [ $RESPONSE == "YES" ]
	then
		#Création du chemin vers le dossier bin
		echo "$NAMEPATH=$ROUTPATH" >> $HOME/.profile
		echo 'export PATH=$PATH:'$NAMEPATH'/bin' >> $HOME/.profile
	fi
fi

#Fin de la condition

	sleep 1
	echo -e "netoyage des variables utilisé"

	unset RESPONSE
	unset ROUTPATH
	unset NAMEPATH
	unset ARCHIVE
	unset UNARCHIVE
	unset REPESITORYROOT

	sleep 2
	echo -e "$USERNAME veuillez vérifier si le PATH a bien été enregistrer sur le fichier .profil"
	sleep 3
	cat $HOME/.profile
	sleep 4
	echo -e "$USERNAME votre installation est terminé \n"	
	exit
#END
