with Liste_Proprietes;
use Liste_Proprietes;

package Joueur is
   
   Nb_Joueurs : Positive := constant 6;
   
   type Un_Joueur is record
      Compte : Natural;
      Proprietes : Liste_Proprietes;
   end record;
   
   type Un_Tab_Joueurs is array 1..Nb_Joueurs of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
   subtype Un_Num_Joueur is Positive range Joueurs'Range;
   
   procedure Init_Joueurs;
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes;
   
end Joueur;
