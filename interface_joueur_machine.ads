with Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO;
use Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO;

package Interface_Joueur_Machine is
   
   type Une_Action is (Hypothequer, Passer_Tour, Construire);
   
   
   function Choix_Binaire return Boolean ;
   
   procedure Afficher_Infos_Joueur(N : in Un_Num_Joueur) ;
   procedure Afficher_Plateau;
   procedure Choix_Menu(A : in out Une_Action) ;
   
   
end Interface_Joueur_Machine;

   
     
     

