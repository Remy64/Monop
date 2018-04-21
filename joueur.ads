with Liste_Proprietes, Des_Cases, Un_Plateau;
use Liste_Proprietes, Des_Cases, Un_Plateau;

package Joueur is
   
   Nb_Joueurs : constant Positive := 6;
   
   type Un_Joueur is record
      Position : Un_Num_Rue;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
   end record;
   
   type Un_Tab_Joueurs is array 1..Nb_Joueurs of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
   subtype Un_Num_Joueur is Positive range Joueurs'Range;
   
   procedure Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Un_Num_Rue;
   
   procedure Definir_Position_Joueur(N : Un_Num_Joueur ; P : Un_Num_Rue);
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes;
   
end Joueur;
