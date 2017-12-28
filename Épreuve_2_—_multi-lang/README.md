# Épreuve 2 : multi-lang

## Langages utilisés
+ C
+ Java
+ Javascript
+ Kotlin
+ PHP
+ Python
+ Ruby

## Rappel de l'énoncé
**Objectif :** Écrire un programme vérifiant le bon parenthésage d'une ligne de texte dans le plus de langages possibles. Les parenthèses considérées sont de trois type : [], () et {}<br/>
Par exemple :
- `{ad({gez[e1]})}` est correctement parenthésée ;
- `{ad({gez[e1]}})` ne l'est pas : la première accolade est refermée avant que la première parenthèse (située après) ne le soit.

+ Contraintes :
    + Le programme prend en paramètre la ligne de texte à vérifier.
    + La ligne de texte contient uniquement : des lettres, des chiffres et bien entendu des () [] et {}.
    + Le programme affiche « *YES* » ou « *NO* » selon que la ligne est correctement parenthésée ou non.
    + Le langage peut être soit compilé, soit interprété, mais il doit être existant et être indépendant du système d'exploitation. Cela suppose entre autre que l'on peut installer le compilateur/interpréteur sur un systeme Linux/windows, à partir d'un paquet d'install.
+ Évaluation :
    + Un simple compte du nombre de langage est fait. Attention, les différentes versions d'un langage ne compte que pour une. Par exemple, il ne sera fait aucune différence entre du Java 4 et Java 8. De même, les différentes versions de shell (bash, csh, ksh, ...), même si leur syntaxe diffère un peu, ne compterons que pour un seul langage, idem pour le basic, le pascal, etc.En revanche, le C et C++ seront considéré comme distincts.
    + En cas d'égalité, c'est le volume de code qui servira à départager. Plus le code est compact, mieux c'est.
+ Rendu :
    + Une archive avec un répertoire par langage, contenant le programme.
    + Un document contenant les liens vers les paquets permettant d'installer les compilateurs/interpréteurs, à part pour les langages communs (style C, C++, Java, etc.).
+ Conseils :
    + Essayez d'abord avec les langages que vous connaissez.
