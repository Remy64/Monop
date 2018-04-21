with Liste_Proprietes;
use Liste_Proprietes;

package body Joueur is
   subtype Un_Nb_Joueurs is Positive range 1..6;
   
   type Un_Joueur is record
      Compte : Natural;
      Proprietes : Liste_Proprietes;
   end record;
   
   type Un_Tab_Joueurs is array 1..Un_Nb_Joueurs of Un_Joueur;
   
   procedure Init_Joueurs(Joueurs : Un_Tab_Joueurs) is
   begin
      for I in Joueurs'Range loop
	 Joueurs(I).Compte := 1500;
	 Init_Liste_Proprietes(Joueurs(I).Proprietes);
      end loop;
   end Init_Joueurs;


end Joueur;
