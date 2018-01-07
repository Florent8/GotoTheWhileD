# GotoTheWhileD
Challenge dans le cadre des 50 ans de l'[IUT de Belfort-Montbéliard](http://www.iut-bm.univ-fcomte.fr/)

Pour installer les paquets des langages c'est [ici](https://github.com/Florent8/GotoTheWhileD/blob/master/%C3%89preuve_2_%E2%80%94_multi-lang/Installation.md).

## Épreuve 1 : « *one-lining* »
**Objectif :** Il faut créer un programme Java dont le code source ne fait pas plus de 1024 octets et qui doit tenir sur une seule ligne. Peu importe qu'il soit écrit de façon lisible (ce qui est impossible sur une seule ligne d'ailleurs) du moment qu'il effectue un traitement remarquable. Ce traitement peut être toucher n'importe quel domaine : calcul, graphisme, base de donnée, etc.<br/>
Par exemple, le code suivant est recevable, quand bien même il fait quelque chose de minable :
```Java
class H{public static void main(String[]a){System.out.println("Salut "+a[0]);}}
```

+ Contraintes :
    + Le programme doit reposer uniquement sur l'API Java standard et donc ne pas utiliser de packages externes.
    + Il doit utiliser une version de Java <= 8.
    + Il doit être sur une seule ligne.
    + Sa taille en octets doit être <= 1024.
    + Son résultat doit être vérifiable/consultable soit au cours de l'exécution, soit après. Par exemple, si le résultat est juste en mémoire sans être mis dans un fichier ou affiché, ce n'est pas recevable.
+ Évaluation :
    + Les contraintes seront verifiées avec un simple `wc -c` pour la taille et un `wc -l` pour le nombre de lignes.
    + Le programme sera ensuite compilé et lancé avec un SDK java v8 d'oracle.
    + Les programmes seront classés en fonction de la complexité (voire beauté) du traitement qu'ils effectuent.
+ Rendu :
    + Le programme source.
    + Un petit document décrivant ce qu'il fait, comment l'utiliser et éventuellement des cas d'exemples d'exécution.
    + Si besoin tout ensemble de fichiers nécessaires à l'execution du programme. Par exemple, s'il fait un traitement sur un type de fichier particulier, il faut fournir des fichiers de ce type.
+ Conseils :
    + Écrivez d'abord un programme qui permet de supprimer les retours à la ligne, les espaces avant/après « = », etc. dans un fichier texte et qui écrit le résultat à l'écran ou dans un fichier. Vous pourrez ainsi développer votre programme source de façon normale et ensuite le « compacter » en une seule ligne.
    + Vérifiez toujours que votre programme compacté compile correctement.

## Épreuve 2 : multi-lang
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
