import csv

donnees = [
	["Jean", 25, "Paris"],
	["Marie", 30, "Lyon"],
	["Pierre", 22, "Marseille"],
	["Sophie", 35, "Toulouse"]
]

cible_csv = "donnees.csv"

with open(cible_csv, mode='w', newline='') as fichier_csv:
	writer = csv.writer(fichier_csv)
	writer.writerow(['Nom', 'Age', 'Ville'])
	writer.writerows(donnees)

print("Les donnes sont bien dans le csv")
