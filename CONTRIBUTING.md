# 🤝 Guide de Contribution - Projet R-Type

Bienvenue dans le guide de contribution de R-Type. Ce document définit notre organisation, nos rôles et nos standards techniques. Notre objectif est de maintenir la branche `main` dans un état toujours déployable, tout en fluidifiant le travail à 3 développeurs.

## 📋 Gestion de Projet (GitHub Projects)

Nous utilisons les GitHub Projects pour le suivi des tâches. Chaque **Issue** créée doit obligatoirement comporter les éléments suivants :

1. **Titre clair :** Décrit précisément l'objectif de la tâche.
2. **Description :** Le contexte et les critères d'acceptation.
3. **Priorité :** Niveau d'urgence de la tâche.
4. **Ranking (MoSCoW) :**
   - *Must* (Indispensable au fonctionnement de base)
   - *Should* (Important mais contournable temporairement)
   - *Could* (Bonus / Polish)
5. **Lien PR (Obligatoire) :** Dès qu'une Pull Request est ouverte pour cette issue, elle doit y être liée (via le mot-clé `Closes #issue_number`).

---

## 🌿 Stratégie de Branches

* Tout le développement se fait sur des **branches éphémères** (short-lived branches).
* Le nom de la branche doit refléter la fonctionnalité ou le correctif (ex: `feat/server/broadcast` ou `fix/gui/animations`).
* Une fois le travail terminé, la branche est fusionnée dans `main` via une Pull Request.
* **Règle d'or :** La branche `main` doit toujours être dans un état stable et déployable.

---

## 🛠️ Outillage et Hooks Locaux

Nous utilisons des hooks Git pour garantir que seul du code propre et bien formaté est commit.

**Action obligatoire après avoir cloné le dépôt :**
Veillez à configurer et installer les dépendances de vos environnements locaux pour activer les vérifications automatiques lors de vos commits.

**Formatage Automatique (Pre-commit) :**
* **C++ :** Le code est formaté automatiquement.

**Conventions de Commit :**
Nous suivons les conventions de type Angular/Airbnb pour la structure de nos messages de commit. Un hook vérifiera la syntaxe à chaque validation.
*Format attendu :* `<type>(<scope>): <description>` (ex: `feat(ai): ajout de l'arbre de décision`).

---

## 🔍 Processus de Code Review (Pull Requests)

Pour fusionner du code sur `main`, les règles suivantes s'appliquent strictement :

* **1 seule approbation requise :** La review doit être effectuée par au moins un autre membre de l'équipe.
* **Pas d'auto-approbation :** Il est formellement interdit d'approuver sa propre PR.
* **Délai :** Une review demandée doit être traitée dans les **48 heures** pour ne pas bloquer l'équipe.

**Ce que le Reviewer doit vérifier :**
1. **La compilation :** Le code compile-t-il sans erreur ni warning majeur en local ?
2. **L'architecture :** La logique respecte-t-elle la séparation des responsabilités ?
3. **La "qualité" du code :** Le code est-il propre, lisible, bien nommé et compréhensible sans effort excessif ?

---

## 🚀 Intégration Continue et Déploiement (CI/CD)

Notre pipeline CI (GitHub Actions) est conçu pour évoluer tout au long du projet :

* **Actuellement :**
  * Miroir automatique (Push vers le dépôt de rendu officiel).
* **À venir (Next Steps) :**
  * Vérification stricte de la compilation (`cmake`).
  * Lancement des tests unitaires.
