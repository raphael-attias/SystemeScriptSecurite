#!/usr/bin/env python3

import subprocess

def installer_paquets():
    print("Installation des paquets nécessaires...")
    
    serveur_web = input("Voulez-vous installer Apache (A/a) ou Nginx (N/n) ? : ")
    if serveur_web.lower() == "a":
        subprocess.run(["sudo", "apt", "install", "apache2", "-y"])
    elif serveur_web.lower() == "n":
        subprocess.run(["sudo", "apt", "install", "nginx", "-y"])
    else:
        print("Choix non valide. Installation d'Apache par défaut.")
        subprocess.run(["sudo", "apt", "install", "apache2", "-y"])

    subprocess.run(["sudo", "apt", "install", "phpmyadmin", "-y"])

    base_de_donnees = input("Voulez-vous installer MySQL (M/m) ou MariaDB (R/r) ? : ")
    if base_de_donnees.lower() == "m":
        subprocess.run(["sudo", "apt", "install", "mysql-server", "-y"])
    elif base_de_donnees.lower() == "r":
        subprocess.run(["sudo", "apt", "install", "mariadb-server", "-y"])
    else:
        print("Choix non valide. Installation de MySQL par défaut.")
        subprocess.run(["sudo", "apt", "install", "mysql-server", "-y"])

    subprocess.run(["sudo", "apt", "install", "nodejs", "npm", "-y"])

    subprocess.run(["sudo", "apt", "install", "git", "-y"])

    print("Installation des paquets terminée.")

installer_paquets()
