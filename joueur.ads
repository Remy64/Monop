with Liste_Proprietes;
use Liste_Proprietes;

package Joueur is
   subtype Un_Nb_Joueurs is Positive range 1..6;
   
   Nb_Joueurs : Un_Nb_Joueurs := constant 6;
   
   type Un_Joueur is record
      Compte : Natural;
      Proprietes : Liste_Proprietes;
   end record;
   
   type Un_Tab_Joueurs is array 1..Un_Nb_Joueurs of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
   procedure Init_Joueurs(Joueurs : Un_Tab_Joueurs);


end Joueur;
