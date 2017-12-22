## Indication

Ce script php est à executer en ligne de commande (fonctionne sur windows et linux):
```
php -f bracket.php *<argv>*
```
Dans notre cas il faut ajouter des doubles cotes, on aurais par exemple : 
- ```php -f bracket.php "{ad({gez[e1]})}"``` pour le correctement parenthésée,
- ```php -f bracket.php "{ad({gez[e1]}})"``` pour le mal parenthésée 