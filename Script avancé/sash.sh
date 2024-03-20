#!/bin/bash

repertoire_cible="Plateforme"
repertoire_sauvegarde="Document"
mkdir -p "repertoire_cible"
archive="backup_$(date +%Y%m%d%_%H%M%S) . tar.gz"
chemin_archive="$repertoire_cible/$archive"
tar -czf "$chemin_archive" "$repertoire_cible"
echo "Sauvegarde de $repertoire_cible fait dans $chemin_archive"
find "$repertoire_cible" -type f -mtime +7 -exec rm {} \;
