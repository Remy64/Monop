with Listes_Proprietes, Des_Cases, Un_Plateau, Ada.Text_IO;
use Listes_Proprietes, Des_Cases, Un_Plateau, Ada.Text_IO;

package body Joueur is
   
   procedure Init_Joueurs is
   begin
      for I in Joueurs'Range loop
	 Joueurs(I).Position := 1;
	 Joueurs(I).Compte := 1500;
	 Init_Liste_Proprietes(Joueurs(I).Proprietes);
	 Joueurs(I).Pris := (False, 0, 0);
	 Joueurs(I).Elimine := False ;
      end loop;
   end Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Numero_Case is
   begin
      return Joueurs(N).Position;
   end Position_Joueur;

   procedure Atteindre_Position(N : Un_Num_Joueur ; P : Numero_Case) is
   begin
      Joueurs(N).Position := P;
   end Atteindre_Position;
   
   procedure Avancer(N : Un_Num_Joueur ; D : Integer) is
   begin
      if Joueurs(N).Position + D <= 40 then
	Joueurs(N).Position := (Joueurs(N).Position+D) ;
      else
	 Joueurs(N).Position := (Joueurs(N).Position+D) mod Nb_Rue;
      end if ;
      
      end Avancer;
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural is
   begin
      return Joueurs(N).Compte;
   end Compte_Joueur;
   
   procedure Ajouter_Argent(N : Un_Num_Joueur ; S : Integer) is
   begin
      if Joueurs(N).Compte+S < 0 then
	 Joueurs(N).Elimine := True ;
	 Put_Line("LE JOUEUR "&Natural'Image(N)&"EST ELIMINE") ;
	 else
	    Joueurs(N).Compte := Joueurs(N).Compte+S;
      end if ;
      
   end Ajouter_Argent;
   
   function Proprietes_Joueur(N : in  Un_Num_Joueur) return Liste_Proprietes is
   begin
      return Joueurs(N).Proprietes;
   end Proprietes_Joueur;
   
   procedure Ajouter_Propriete_Joueur(N : in Un_Num_Joueur; C : in Numero_Case) is
  
   begin
      
      Ajouter_Propriete(C, Joueurs(N).Proprietes) ;
   end Ajouter_Propriete_Joueur ;
   
   
   function Passe_Depart(D : Numero_Case ; A : Numero_Case) return Boolean is
   begin
      return D>A;
   end Passe_Depart;
   
   function Est_En_Prison(N : Un_Num_Joueur) return Boolean is
   begin
      return Joueurs(N).Pris.En_Prison;
   end Est_En_Prison;
   
   procedure Mettre_En_Prison(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.En_Prison := True;
   end Mettre_En_Prison;

   procedure Sortir_De_Prison(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.En_Prison := False;
   end Sortir_De_Prison;
   
   function Trois_Tours(N : Un_Num_Joueur) return Boolean is
   begin
      return Joueurs(N).Pris.Nb_Tour_En_Prison = 3;
   end Trois_Tours;
   
   procedure Incrementer_Tour_Prison(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.Nb_Tour_En_Prison := Joueurs(N).Pris.Nb_Tour_En_Prison+1;
   exception
      when Constraint_Error =>
	 raise Trop_De_Tours_En_Prison;
   end Incrementer_Tour_Prison;

   procedure RAZ_Tour_Prison(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.Nb_Tour_En_Prison := 0;
   end RAZ_Tour_Prison;
   
   function Possede_Carte_Lib(N : Un_Num_Joueur) return Boolean is
   begin
      return Joueurs(N).Pris.Carte_Libe_Prison /= 0;
   end Possede_Carte_Lib;
   
   procedure Ajouter_Carte_Lib(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.Carte_Libe_Prison := Joueurs(N).Pris.Carte_Libe_Prison+1;
   end Ajouter_Carte_Lib;
   
   procedure Retirer_Carte_Lib(N : Un_Num_Joueur) is
   begin
      Joueurs(N).Pris.Carte_Libe_Prison := Joueurs(N).Pris.Carte_Libe_Prison-1;
   end Retirer_Carte_Lib;
   
   function Proprietaire_Case(C : Numero_Case) return Natural is
      N : Natural;
      Trouve : Boolean;
   begin
      N := 1;
      Trouve := False;
      while N <= Nb_Joueurs and not Trouve loop
	 Trouve := Possede_Propriete(C, Proprietes_Joueur(N));
	 N := N+1;
      end loop;
      if Trouve then
	 
	 return N-1;
      else
	 return 0; -- 0 indique que la case n'est possédée par aucun joueur
      end if;
   end Proprietaire_Case;
   
   function Elimine(N : Un_Num_Joueur) return Boolean is
      
   begin
      
      return Joueurs(N).Elimine ;
   end Elimine ;
   
   function Nb_Elimines return Natural is    
      Compteur : Natural;
   
   begin
      
      Compteur := 0 ;
      for I in Joueurs'Range loop 
	 if Elimine(I) then
	    Compteur := Compteur + 1 ;
	 end if ;
      end loop ;
      return Compteur ;
      
   end Nb_Elimines ;
   
   function Fin_Jeu return Boolean is 
   
begin
   
   return Nb_Elimines = Nb_Joueurs -1 ;
   
end Fin_Jeu ;
end Joueur;


