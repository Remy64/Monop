with Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO;
use Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO;

package Interface_Joueur_Machine is
   
   
   Saisie_Invalide : exception ;
   
   type Une_Action is (Hypothequer, Passer_Tour, Construire);
   
   
   function Choix_Binaire return Boolean ;
   
   procedure Afficher_Infos_Joueur(N : in Un_Num_Joueur) ;
   procedure Afficher_Plateau;
   procedure Choix_Menu(A : out Une_Action; N : in Un_Num_Joueur) ;
   procedure Menu_Hypothequer ;
   procedure Menu_Construction ;
   
   
   
end Interface_Joueur_Machine;

   
     
     

