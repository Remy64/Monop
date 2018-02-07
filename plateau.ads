with Cases ;
use Cases ;
package Plateau is

   subtype Numero_Case is Positive in 1..36 ; -- correspond aux numéros des cases de 1 à 36 (car 36 cases)
   type Plateau is array 1..36 of Cases ; -- définit un tableau composé des 36 cases du plateau (le type "Cases" est défini dans le paquetage "Cases")
   procedure Bouger(N : Integer, J : Joueur) ; -- permet de se déplacer d'un certain nombre de cases (un nbre négatif permet de reculer)
   procedure Aller_A(N : Numero_Case, J : Joueur) ; -- permet d'atteindre une case particulière
   procedure Initialiser ; -- permet d'initialiser le plateau avec tous les joueurs sur la case départ

end Plateau ;
