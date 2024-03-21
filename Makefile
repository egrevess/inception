# Nom de votre fichier docker-compose
COMPOSE_FILE=srcs/docker-compose.yml

# Construire les images Docker sans les démarrer
build:
	docker-compose -f $(COMPOSE_FILE) build

# Démarrer les conteneurs en arrière-plan
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Arrêter les conteneurs
stop:
	docker-compose -f $(COMPOSE_FILE) stop

# Supprimer les conteneurs et les volumes créés
down:
	docker-compose -f $(COMPOSE_FILE) down -v

# Nettoyer le système Docker (Attention: cette commande supprime tous les conteneurs, images non utilisées, et volumes non gérés)
clean:
	docker system prune -af

# Affiche l'état actuel des conteneurs
status:
	docker-compose -f $(COMPOSE_FILE) ps

# Ajoutez d'autres cibles au besoin...

.PHONY: build up stop down clean status
