# Docker Setup pour Symfony

## 🎯 **À propos**

Ce conteneur Docker permet de créer un **environnement de développement complet pour Symfony** sans rien installer sur votre machine. Il contient tout le nécessaire :

- **PHP 8.2-FPM** avec extensions MySQL
- **Composer** (gestionnaire de dépendances PHP)
- **Symfony CLI** (outil officiel pour créer des projets)
- **Git** (gestion de versions)
- **MySQL 8.0** (base de données)
- **phpMyAdmin** (interface d'administration DB)

*Le serveur web Symfony CLI est utilisé pour le développement.*

## 🚀 **Démarrage rapide**

```bash
# Depuis le dossier racine du projet
./start.sh
```

## 📁 **Structure des fichiers**

```
docker/
├── Dockerfile           # PHP 8.2 + Composer + Symfony CLI + Git
├── docker-compose.yml   # Services (PHP, MySQL, phpMyAdmin)
└── README.md           # Cette documentation
```

## ✅ **Vérification de l'installation**

Une fois vos conteneurs démarrés, vérifiez que tout fonctionne :

```bash
# Vérifier PHP
docker exec -it app_php php --version

# Vérifier Composer
docker exec -it app_php composer --version

# Vérifier Symfony CLI
docker exec -it app_php symfony version

# Vérifier Git
docker exec -it app_php git --version

# Voir tous les conteneurs actifs
docker ps
```

## 🔧 **Accès aux conteneurs**

```bash
# Accéder au conteneur PHP (le plus utilisé)
docker exec -it app_php bash

# Accéder au conteneur MySQL
docker exec -it app_mysql bash

# Accéder au conteneur phpMyAdmin
docker exec -it app_phpmyadmin bash
```

## 📦 **Créer un projet Symfony**

```bash
# Entrer dans le conteneur PHP
docker exec -it app_php bash

# Configurer Git (obligatoire avant de créer un projet)
git config --global user.email "votre@gmail.com"
git config --global user.name "Name"

# Se placer dans le répertoire de travail
cd /var/www

# Créer un projet web complet
symfony new votre-nom-projet --webapp

# Ou avec Composer (alternative)
composer create-project symfony/webapp-pack votre-nom-projet
```

## 🚀 **Démarrer le serveur Symfony**

```bash
# Entrer dans le conteneur PHP
docker exec -it app_php bash

# Aller dans votre projet
cd votre-nom-projet

# Démarrer le serveur (accessible depuis l'hôte)
symfony serve --allow-all-ip --port=8000
```

## 🌐 **Tous les accès disponibles**

- **Application Symfony** : http://localhost:8000
- **phpMyAdmin** : http://localhost:8081  
- **MySQL** : localhost:3306 (`user` / `password`)

## 🔧 **Commandes de développement courantes**

```bash
# Accéder au conteneur pour travailler
docker exec -it app_php bash

# Console Symfony (depuis le conteneur, dans votre projet)
php bin/console list
php bin/console make:controller
php bin/console make:entity

# Ou directement depuis l'hôte (remplacer 'mon-projet' par votre nom de projet)
docker exec -it app_php php mon-projet/bin/console about
docker exec -it app_php php mon-projet/bin/console debug:router

# Gestion base de données
docker exec -it app_php php mon-projet/bin/console doctrine:database:create
docker exec -it app_php php mon-projet/bin/console make:migration
docker exec -it app_php php mon-projet/bin/console doctrine:migrations:migrate
```

## 🔍 **Debugging et logs**

```bash
# Logs de tous les conteneurs
docker compose logs -f

# Logs d'un conteneur spécifique
docker logs -f app_php
docker logs -f app_mysql

# Logs Symfony (depuis le conteneur, dans votre projet)
docker exec -it app_php tail -f mon-projet/var/log/dev.log

# Vider le cache Symfony
docker exec -it app_php php mon-projet/bin/console cache:clear
```

## 💡 **Workflow de développement**

1. **Lancer l'environnement** : `./start.sh`
2. **Vérifier les installations** : Commandes de vérification ci-dessus
3. **Créer votre projet** : `symfony new mon-projet --webapp`
4. **Démarrer Symfony** : `symfony serve --allow-all-ip --port=8000`
5. **Développer** : Accéder à http://localhost:8000

## ⚠️ **Notes importantes**

- **Serveur Symfony CLI** : Utilisez `symfony serve --allow-all-ip --port=8000` dans le conteneur
- **Modifications en temps réel** : Vos changements de code sont automatiquement visibles
- **Port 8000** : L'application sera accessible sur http://localhost:8000
- **Base de données persistante** : Vos données MySQL sont sauvegardées entre redémarrages
- **Plusieurs projets possibles** : Vous pouvez créer plusieurs projets dans `/var/www`

## 🛠️ **Gestion des conteneurs**

```bash
# Démarrer les conteneurs
cd docker && docker compose up -d

# Arrêter les conteneurs
cd docker && docker compose down

# Reconstruire les conteneurs
cd docker && docker compose up -d --build

# Voir l'état des conteneurs
docker ps

# Nettoyer les conteneurs arrêtés
docker container prune
```

## 📦 **Outils installés**

- **PHP 8.2-FPM** avec extension MySQL
- **Composer** (gestionnaire de dépendances)
- **Symfony CLI** (outil officiel Symfony)
- **Git** (pour les projets Symfony)
