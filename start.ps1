# Liste des fichiers .yml à appliquer
$yamlFiles = @(
    "argocd-init.yml",
    "postgres-application.yml",
    "discovery-application.yml",
    "gateway-application.yml",
    "user-application.yml",
    "facture-application.yml",
    "payment-transaction-application.yml",
    "operators-application.yml"

)

# Boucle pour appliquer chaque fichier .yml avec kubectl
foreach ($yamlFile in $yamlFiles) {
    if (Test-Path $yamlFile) {
        Write-Host "Appliquons le fichier: $yamlFile"
        kubectl apply -f $yamlFile
    } else {
        Write-Host "Le fichier $yamlFile n'existe pas."
    }
}

# Affichage de l'état des ressources déployées
Write-Host "Vérification de l'état des pods, services et autres ressources..."
kubectl get all