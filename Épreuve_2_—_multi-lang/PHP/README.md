## Indication

Ce script php est � executer en ligne de commande (fonctionne sur windows et linux):
```
php -f bracket.php *<argv>*
```
Dans notre cas il faut ajouter des doubles cotes, on aurais par exemple : 
- ```php -f bracket.php "{ad({gez[e1]})}"``` pour le correctement parenth�s�e,
- ```php -f bracket.php "{ad({gez[e1]}})"``` pour le mal parenth�s�e 