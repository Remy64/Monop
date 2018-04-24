with Liste_Proprietes, Des_Cases, Un_Plateau;
use Liste_Proprietes, Des_Cases, Un_Plateau;

package body Joueur is
   
   procedure Init_Joueurs is
   begin
      for I in Joueurs'Range loop
	 Joueurs(I).Compte := 1500;
	 Init_Liste_Proprietes(Joueurs(I).Proprietes);
      end loop;
   end Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Un_Num_Rue is
   begin
      return Joueurs(N).Position;
   end Position_Joueur;

   procedure Definir_Position_Joueur(N : Un_Num_Joueur ; P : Un_Num_Rue) is
   begin
      Joueurs(N).Position := P;
   end Definir_Position_Joueur;
   
   procedure Avancer(N : Un_Num_Joueur ; D : Integer) is
   begin
      Joueurs(N).Position := Joueurs(N).Position+D;
   end Avancer;
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural is
   begin
      return Joueurs(N).Compte;
   end Compte_Joueur;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes is
   begin
      return Joueurs(N).Proprietes;
   end Proprietes_Joueur;
   
   function Passe_Depart(D : Un_Num_Rue ; A : Un_Num_Rue) return Boolean is
   begin
      return D>A;
   end Passe_Depart;
     
   procedure Gagner_Carte_Lib(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.Carte_Libe_Prison := Joueurs(N).Pris.Carte_Libe_Prison+1;
   end Gagner_Carte_Lib;
   
   procedure Utiliser_Carte_Lib(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.En_Prison := False;   
   end Utiliser_Carte_Lib;
   
end Joueur;
