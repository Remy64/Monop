WITH Joueur ;
use Joueur ;
PACKAGE Cartes IS

      Nb_Cartes : constant Positive := 50 ; --Nombre

      type Un_Effet is (Argent, Prison, Bouger) ; --Effet de la carte

      TYPE Une_Carte IS RECORD
         Titre : String(1..20) ;
         Description : String(1..100) ;
         Effet : Un_Effet ;
         Montant : Integer ;
      END RECORD ;

      TYPE T_Cartes IS ARRAY (1..Nb_Cartes) OF Une_Carte ; -- Tableau de cartes

      TYPE Pile_Carte IS RECORD -- File de cartes
         Tab : T_Cartes ;
         Deb : Natural ;
         Fin : Natural ;

      END RECORD ;




      procedure Piocher_Carte (Pile : in out Pile_Carte; Joueur : Joueur) ;-- Applique l'effet de la carte au sommet de la pile
      procedure Tomber_Case_Chance(Pile : in out Pile_Carte; Joueur : Joueur) ; --Pioche une carte, applique son effet et la place sous la pile

   end Cartes ;
