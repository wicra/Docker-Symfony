#!/bin/bash
echo "🚀 Démarrage des conteneurs..."

docker-compose up -d --build

echo ""
echo "✅ Terminé !"
echo "🌐 Application : http://localhost:8080"
echo "🗄️ phpMyAdmin : http://localhost:8081"
echo "📊 MySQL : localhost:3306 (user/password)"