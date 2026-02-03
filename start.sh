#!/bin/bash

echo "🔍 Vérification de l'état des conteneurs..."

# Vérifier si les conteneurs tournent
RUNNING_CONTAINERS=$(docker ps -q -f name=app_php -f name=app_mysql -f name=app_phpmyadmin)

if [ ! -z "$RUNNING_CONTAINERS" ]; then
    echo "🔄 Conteneurs détectés en cours d'exécution - Redémarrage propre..."
    docker compose down
    echo "⏳ Arrêt terminé, redémarrage..."
    docker compose up -d --build
    echo "🚀 Redémarrage terminé !"
else
    echo "🚀 Aucun conteneur détecté - Démarrage initial..."
    docker compose up -d --build
    echo "✅ Démarrage terminé !"
fi

echo ""
echo "🎯 Environnement Docker prêt !"
echo "🌐 Application Symfony : http://localhost:8000 (après 'symfony serve')"
echo "🗄️ phpMyAdmin : http://localhost:8081"
echo "📊 MySQL : localhost:3306 (user/password)"
echo ""
echo "💡 Pour démarrer votre projet Symfony :"
echo "   docker exec -it app_php bash"
echo "   cd votre-projet"
echo "   symfony serve --allow-all-ip --port=8000"