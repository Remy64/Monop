

package body Listes_Proprietes is
   
   
    procedure Init_Liste_Proprietes(L : in out Liste_Proprietes) is
   begin
      L := null;
end Init_Liste_Proprietes;
   
   function Possede_Propriete(L : Liste_Proprietes ; C : Numero_Case) return Boolean is
      Trouve : Boolean;
      Aux : Liste_Proprietes;
   begin
      Trouve := False;
      Aux := L;
      while not Trouve and Aux /= null loop
	 if Aux.all.Propriete.Num_Case = C then
	    Trouve := True;
	 end if;
	 Aux := Aux.all.Suiv;
      end loop;
      return Trouve;
   end Possede_Propriete;
   
   procedure Ajouter_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes) is
   begin
      L := new Cellule'((C, 0, False), L);
   end Ajouter_Propriete;

   procedure Supprimer_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes) is
      Aux : Liste_Proprietes;
   begin
      
      if L= null then raise Liste_Proprietes_Vide ;
      elsif L.all.Propriete.Num_Case = C then
	 Aux := L;
	 L := L.all.Suiv;
	 Free(Aux);
      else
	 Supprimer_Propriete(C, L.all.Suiv);
      end if;
   end Supprimer_Propriete;

   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison is
      
      Auxi : Liste_Proprietes ;
   begin
      
      if not Possede_Propriete(L, C) then raise Propriete_Non_Possedee ;
      else
	 Auxi := L ;
	   while Auxi.all.Propriete.Num_Case /= C loop
	   Auxi := Auxi.all.Suiv ;
	   end loop;
      end if ;
      return Auxi.all.Propriete.Nb_Maisons ;

   end Nb_Maisons_Propriete;
   
   function Nb_Gares(L : Liste_Proprietes) return Natural is 
      Resultat : Natural ;
      
   begin
      Resultat := 0 ;
      for I in 0..3 loop
	 if Possede_Propriete(L, 6+I*10) then -- Gares situees cases (6, 16, 26, 36)
	    Resultat := Resultat + 1 ;
	 end if ;
      end loop ;
      return Resultat ;
   end Nb_Gares ;
   
   function Nb_Rues_Meme_Couleur (L : Liste_Proprietes ; Col : Couleur_Case) return Natural is
      
      Auxi : Liste_Proprietes ;
      Resultat : Natural ;
          
   begin
      
      Resultat := 0;
      Auxi := L ;
      while Auxi /= null loop
	 if Couleur(Plat(Auxi.all.Propriete.Num_Case)) = Col then 
	    Resultat := Resultat +1 ;
	 end if ;
	 Auxi := Auxi.all.Suiv ;
	 
      end loop ;
      
      return Resultat ;
      
   end Nb_Rues_Meme_Couleur ;
   
   function Nb_Compagnies(L : Liste_Proprietes) return Natural is 
      
      Resultat : Natural ;
      
   begin 
      
      Resultat := 0 ;
      
      if Possede_Propriete(L, 13) then
	 Resultat := Resultat + 1 ;
      end if ;
      if Possede_Propriete(L, 29) then 
	 Resultat := Resultat + 1 ;
      end if ;
      
      return Resultat ;
   end Nb_Compagnies ;
   
      
      
   
   
	 
      
      
      

end Listes_Proprietes;
