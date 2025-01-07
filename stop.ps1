# Liste des fichiers .yml à appliquer
$yamlFiles = @(

    "postgres-application.yml",
    "discovery-application.yml",
    "gateway-application.yml",
    "user-application.yml",
    "facture-application.yml",
    "payment-transaction-application.yml",
    "argocd-init.yml"

)

# Boucle pour appliquer chaque fichier .yml avec kubectl
foreach ($yamlFile in $yamlFiles) {
    if (Test-Path $yamlFile) {
        Write-Host "Supprimer le fichier: $yamlFile"
        kubectl delete -f $yamlFile
    } else {
        Write-Host "Le fichier $yamlFile n'existe pas."
    }
}

kubectl delete all --all -n ebanking
# Affichage de l'état des ressources déployées
Write-Host "Vérification de l'état des pods, services et autres ressources..."
kubectl get all