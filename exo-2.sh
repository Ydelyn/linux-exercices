# Initialisation des variables
total_notes=0
somme_notes=0

while true; do
    # Demande à l'utilisateur de saisir une note
    read -p "Entrez votre note (ou 'q' pour quitter) : " note

    # Vérifie si l'utilisateur veut quitter
    if [[ "$note" == "q" ]]; then
        break
    fi

    # Vérifie que la note est bien un nombre
    if ! [[ "$note" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Erreur : Veuillez entrer un nombre valide ou 'q' pour quitter."
        continue
    fi

    # Convertir en nombre flottant pour éviter les erreurs avec bc
    note=$(echo "$note")

    # Vérifie si la note est négative (condition d'arrêt)
    if (( $(echo "$note < 0") )); then
        break
    fi

    # Affichage du message correspondant
    if (( $(echo "$note >= 16") )) && (( $(echo "$note <= 20") )); then
        echo "Très bien"
    elif (( $(echo "$note >= 14") )) && (( $(echo "$note < 16") )); then
        echo "Bien"
    elif (( $(echo "$note >= 12") )) && (( $(echo "$note < 14") )); then
        echo "Assez bien"
    elif (( $(echo "$note >= 10") )) && (( $(echo "$note < 12") )); then
        echo "Moyen"
    elif (( $(echo "$note < 10") )); then
        echo "Insuffisant"
    else
        echo "Erreur : La note doit être entre 0 et 20."
        continue
    fi

    # Mise à jour des variables pour la moyenne
    total_notes=$((total_notes + 1))
    somme_notes=$((somme_notes + $note))
done

# Affichage des résultats finaux
if (( total_notes > 0 )); then
    moyenne=$(scale=2; $somme_notes/$total_notes)
    echo "Nombre de notes saisies : $total_notes"
    echo "Moyenne des notes : $moyenne"
else
    echo "Aucune note valide saisie."
fi

echo "Programme terminé."
