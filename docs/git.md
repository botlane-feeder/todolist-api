# Git

## Initialiser le projet

Faire une branche Main et une branch Dev
- faire une branche Feat1 et écrire le paragraphe 1 avec 1 commit puis MR
- faire une branche Feat2 et écrire le paragraphe 2 avec 1 commit puis MR
- faire une branche Feat3 et écrire le paragraphe 3 avec 1 commit puis MR

## Supprimer la feat 1

- faire une branche feat1 à partir du commit après le paragraphe 1 : pour sauvegarde
  - `git branch feat1 ${IdCommit}`
- rebase dev à partir du 
  - `git rebase -i HEAD~3` : `-i` pour interactive
    - laisser à `pick` les commit à garder, `squash` pour en fusionner, `drop` pour les supprimer
  - Suivre l'évolution du rebase

- À tout moment, on peut abandonner le rebase en cours, tant qu'il n'est pas publié
  - `git rebase --abort`

**Dès que le commit est publié, alors tous les historiques commit du projet sont à recharger, au risque de créer des conflits à chaque publication**