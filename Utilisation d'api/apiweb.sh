#!/bin/bash

API_URL="https://jsonplaceholder.typicode.com/users"

# Répertoire de logs
LOG_DIR="/var/log/api_logs"
LOG_FILE="$LOG_DIR/api_log_$(date +%Y-%m-%d).log"

envoyer_requete() {
    local url="$1"
    local response=""
    
    response=$(curl -s "$url")
    
    if [ $? -eq 0 ]; then
        logger -t API "Requête: GET $url"
        logger -t API "Réponse: $response"
        
        echo "Réponse de l'API :"
        echo "$response"
    else
        logger -t API "Erreur : Impossible d'envoyer la requête à l'API."
        exit 1
    fi
}

if [ ! -d "$LOG_DIR" ]; then
    mkdir -p "$LOG_DIR"
fi

envoyer_requete "$API_URL"
