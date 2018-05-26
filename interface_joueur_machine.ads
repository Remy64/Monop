with Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO, Ada.Integer_Text_IO;
use Un_Plateau, Joueur, Listes_Proprietes, Des_Cases, Files_Cartes, Ada.Text_IO, Ada.Integer_Text_Io;

package Interface_Joueur_Machine is
   
   
   Saisie_Invalide : exception ;
   
   type Une_Action is (Hypothequer, Passer_Tour, Construire);
   
   
   function Choix_Binaire return Boolean ;
   
   procedure Afficher_Infos_Joueur(N : in Un_Num_Joueur) ;
   procedure Afficher_Plateau;
   procedure Choix_Menu(A : out Une_Action; N : in Un_Num_Joueur) ;
   procedure Menu_Hypothequer(N : in Un_Num_Joueur; K : out Numero_case) ;
   procedure Menu_Construction(N : in Un_Num_Joueur; K : out Numero_Case; B : out Boolean) ;
   
   
   
end Interface_Joueur_Machine;

   
     
     

