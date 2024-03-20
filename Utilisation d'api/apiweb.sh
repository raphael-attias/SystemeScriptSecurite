#!/bin/bash

# URL de l'API JSONPlaceholder pour récupérer des utilisateurs
API_URL="https://jsonplaceholder.typicode.com/users"

# Répertoire de logs
LOG_DIR="/var/log/api_logs"
LOG_FILE="$LOG_DIR/api_log_$(date +%Y-%m-%d).log"

# Fonction pour envoyer une requête à l'API
envoyer_requete() {
    local url="$1"
    local response=""
    
    # Envoi de la requête à l'API avec curl
    response=$(curl -s "$url")
    
    # Vérification du code de réponse HTTP
    if [ $? -eq 0 ]; then
        # Log de la requête et de la réponse dans un fichier
        logger -t API "Requête: GET $url"
        logger -t API "Réponse: $response"
        
        # Affichage de la réponse
        echo "Réponse de l'API :"
        echo "$response"
    else
        # Enregistrement de l'erreur dans les logs
        logger -t API "Erreur : Impossible d'envoyer la requête à l'API."
        exit 1
    fi
}

# Vérification si le répertoire de logs existe sinon le créer
if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

# Appel de la fonction pour envoyer la requête à l'API
envoyer_requete "$API_URL"
