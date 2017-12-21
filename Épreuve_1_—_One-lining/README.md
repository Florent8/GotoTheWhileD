# Épreuve 1 : « *one-lining* »

## Notre programme

## Rappel de l'énoncé
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
