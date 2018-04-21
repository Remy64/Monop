with Liste_Proprietes;
use Liste_Proprietes;

package body Joueur is
   
   procedure Init_Joueurs is
   begin
      for I in Joueurs'Range loop
	 Joueurs(I).Compte := 1500;
	 Init_Liste_Proprietes(Joueurs(I).Proprietes);
      end loop;
   end Init_Joueurs;
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural is
   begin
      return Joueurs(N).Compte;
   end Compte_Joueur;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes is
   begin
      return Joueurs(N).Proprietes;
   end Proprietes_Joueur;
   
   end Joueur;
