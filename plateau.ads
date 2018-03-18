with Cases ;
use Cases ;

package Plateau is

   subtype Numero_Case is Positive in 1..36 ; -- correspond aux numÃ©ros des cases de 1 Ã  36 (car 36 cases)
   type Plateau is array 1..36 of Cases ; -- dÃ©finit un tableau composÃ© des 36 cases du plateau (le type "Cases" est dÃ©fini dans le paquetage "Cases")
   procedure Bouger(N : Integer, J : Joueur) ; -- permet de se dÃ©placer d'un certain nombre de cases (un nbre nÃ©gatif permet de reculer)
   procedure Aller_A(N : Numero_Case, J : Joueur) ; -- permet d'atteindre une case particuliÃ¨re
   procedure Initialiser ; -- permet d'initialiser le plateau avec tous les joueurs sur la case dÃ©part

end Plateau ;
