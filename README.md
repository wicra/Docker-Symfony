# Docker Setup pour Symfony

## 🎯 **À propos**

Ce conteneur Docker permet de créer un **environnement de développement complet pour Symfony** sans rien installer sur votre machine. Il contient tout le nécessaire :

- **PHP 8.2-FPM** avec extensions MySQL
- **Composer** (gestionnaire de dépendances PHP)
- **Symfony CLI** (outil officiel pour créer des projets)
- **Git** (gestion de versions)
- **Nginx** (serveur web optimisé pour Symfony)
- **MySQL 8.0** (base de données)
- **phpMyAdmin** (interface d'administration DB)

## 🚀 **Démarrage rapide**

Un fichier `start.sh` permet de lancer directement l'environnement :

```bash
# Depuis le dossier racine du projet
./start.sh
```

## ✅ **Vérification de l'installation**

Une fois vos conteneurs démarrés, vous pouvez vérifier que tout fonctionne avec les commandes suivantes :

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

## 📦 **Créer un projet Symfony**

Pour créer un nouveau projet Symfony, utilisez la commande suivante :

```bash
# Créer un projet web complet
docker exec -it app_php symfony new votre-nom-projet --webapp

# Ou avec Composer (alternative)
docker exec -it app_php composer create-project symfony/webapp-pack votre-nom-projet
```

## 🔧 **Configuration pour votre projet**

### **1. Modifier le fichier `.env`**

Pour que votre conteneur démarre sur votre projet, modifiez le fichier `docker/.env` :

```bash
# Spécifiez le nom de votre projet
PROJECT_NAME=votre-nom-projet

# Configuration base de données
DATABASE_URL="mysql://user:password@mysql:3306/app_db"
```

### **2. Redémarrer les conteneurs**

Après avoir modifié `.env`, redémarrez pour appliquer les changements :

```bash
cd docker
docker compose down
docker compose up -d
```

### **3. Accéder à votre application**

Votre projet Symfony sera maintenant accessible sur :

**http://localhost:8080**

## 🌐 **Tous les accès disponibles**

- **Application Symfony** : http://localhost:8080
- **phpMyAdmin** : http://localhost:8081  
- **MySQL** : localhost:3306 (`user` / `password`)

## 🔧 **Commandes de développement courantes**

```bash
# Accéder au conteneur PHP pour travailler
docker exec -it app_php bash

# Console Symfony (depuis le conteneur ou en direct)
docker exec -it app_php php ${PROJECT_NAME}/bin/console list
docker exec -it app_php php ${PROJECT_NAME}/bin/console make:controller

# Gestion base de données
docker exec -it app_php php ${PROJECT_NAME}/bin/console doctrine:database:create
docker exec -it app_php php ${PROJECT_NAME}/bin/console make:migration

# Voir les logs en temps réel
docker compose logs -f
```

## � **Structure des fichiers**

```
docker/
├── Dockerfile           # Configuration PHP avec tous les outils
├── docker-compose.yml   # Orchestration des services
├── nginx.conf          # Serveur web optimisé pour Symfony
├── .env                # Variables d'environnement (nom du projet)
└── README.md           # Cette documentation
```

## 💡 **Workflow de développement**

1. **Lancer l'environnement** : `./start.sh`
2. **Vérifier les installations** : Commandes de vérification ci-dessus
3. **Créer votre projet** : `symfony new mon-projet --webapp`
4. **Configurer l'accès** : Modifier `docker/.env` avec le nom du projet
5. **Redémarrer** : `docker compose down && docker compose up -d`
6. **Développer** : Accéder à http://localhost:8080

## ⚠️ **Notes importantes**

- **Un seul projet actif** : Le système gère un projet Symfony à la fois
- **Modifications en temps réel** : Vos changements de code sont automatiquement visibles
- **Pas besoin de `symfony server:start`** : Nginx gère déjà le serveur web
- **Base de données persistante** : Vos données MySQL sont sauvegardées entre redémarrages