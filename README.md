# ETNA Virtualisation

[![N|Solid](http://www.cidj.com/sites/default/files/images/etna_logo.jpg)

## Fonctionnalités
Service permettant de virtualiser sur une VM des conteneurs Docker d'exercices :   
  - Accès étudiant via API ETNA.  
        - Manager les exercices.  
        - Informations du groupe.  
  - Accès professeur via API ETNA.  
        - Créer des UE.  
        - Créer des exercices.  
        - Créer ses propres images docker d'exercice.  

## Technologies

Apache : Dédié à la distribution du site étudiant ::80.  
Ruby (framework Sinatra) : API dédiée à l'execution de scripts systèmes : instanciation des conteneurs docker ::81.  
Docker :   
   - Reverse proxy : Seul accès extérieur -> reroute sur les conteneurs adéquat en fonction de la demande (/login) ::443.  
   - Conteneurs d'exercice des étudiants ::0.  

## Installation
> apt-get install apache2

Cloner le dépot et placer les sources dans `/var/www/html`
> cd /var/www/html/server && chmod +x * && ruby server.rb -p 81 -o 0.0.0.0

## Commandes a connaitre
Lancer un exercice manuellement :
> docker run -td -h bedmin_j --name bedmin_j exercice1

Connecter le proxy au conteneur et l'initialiser :
> docker run -p "443:80" -td --name proxy --link bedmin_j proxy


## Exemple de Dockerfile d'exercice
> FROM tutum/lamp.  
> EXPOSE 80 443 3306.  
> CMD ./run.sh &&  service apache2 restart && tail -F /var/log/mysql/error.log.  

## Informations sur l'API ruby (routes) :
Créer une UE et demarrer tous les conteneurs étudiants :
> GET 213.32.21.139:81/instantiate_etape?login=bedmin_j&container=exercice1

Importer et créer une image docker via un Dockerfile au format texte :
> POST 213.32.21.139:81/instantiate_docker
> `{"name":"exercice3", "dockerfile":"FROM debian\nCMD ./run.sh"}`

Démarrer un conteneur pour un étudiant / changer d'exercice
> POST 213.32.21.139:81/instantiate_ue
> `{"container":"container_name", "logins": ["bedmin_j","rollan_t"]}`