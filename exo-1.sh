# Demande à l'utilisateur de saisir une note
read -p "Entrez votre note (sur 20) : " note

# Vérifie que la note est un nombre
if ! [[ "$note" =~ ^[0-9]+$ ]] && ! [[ "$note" =~ ^[0-9]+\.[0-9]+$ ]]; then
    echo "Erreur : Veuillez entrer un nombre valide."
    exit 1
fi

# Vérification de l'intervalle et affichage du message correspondant
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
fi
