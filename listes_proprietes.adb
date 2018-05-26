package body Listes_Proprietes is
   
   procedure Init_Liste_Proprietes(L : in out Liste_Proprietes) is
   begin
      L := null;
   end Init_Liste_Proprietes;
   
   function Est_Vide(L : in Liste_Proprietes) return Boolean is
   begin
      return L = null ;   
   end Est_Vide ;
   
   function Suiv(L : Liste_Proprietes) return Liste_Proprietes is
   begin
      if L = null then
	 raise Liste_Proprietes_Vide ;
      end if ;
      return L.all.Suiv;
   end Suiv;
   
   function Possede_Propriete(C : Numero_Case ; L : Liste_Proprietes) return Boolean is
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
   
   procedure Ajouter_Enlever_Maison(Aj : Boolean ; C : Numero_Case ; L : in  Liste_Proprietes) is
      Auxi : Liste_Proprietes;
   begin
      if not Possede_Propriete(C, L) then raise Propriete_Non_Possedee;
      else
	 Auxi := L;
	   while Auxi.all.Propriete.Num_Case /= C loop
	   Auxi := Auxi.all.Suiv;
	   end loop;	   
      end if;
      if Aj then Auxi.all.Propriete.Nb_Maisons  := Auxi.all.Propriete.Nb_Maisons + 1;
      else 
	 Auxi.all.Propriete.Nb_Maisons := Auxi.all.Propriete.Nb_Maisons +1;
      end if;
   end Ajouter_Enlever_Maison;

   procedure Hypothequer_Desypothequer_Propriete(Hyp : in Boolean; C : in Numero_Case ; L : in out Liste_Proprietes) is	 
      Auxi : Liste_Proprietes;
   begin
      if not Possede_Propriete(C, L) then raise Propriete_Non_Possedee;
      else
	 Auxi := L;
	   while Auxi.all.Propriete.Num_Case /= C loop
	   Auxi := Auxi.all.Suiv;
	   end loop;	   
      end if;
      Auxi.all.Propriete.Hypotheque := Hyp;
   end Hypothequer_Desypothequer_Propriete;


   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison is
      Auxi : Liste_Proprietes;
   begin
      if not Possede_Propriete(C, L) then raise Propriete_Non_Possedee;
      else
	 Auxi := L;
	   while Auxi.all.Propriete.Num_Case /= C loop
	   Auxi := Auxi.all.Suiv;
	   end loop;
      end if;
      return Auxi.all.Propriete.Nb_Maisons;
   end Nb_Maisons_Propriete;
   
   function N_Maisons(L : Liste_Proprietes) return N_Maison is
      
   begin
      
      return L.all.Propriete.Nb_Maisons ;
      
   end N_Maisons ;
   
   
   function N_Case(L : Liste_Proprietes) return Numero_Case is 
   begin
      if L = null then
	 raise Liste_Proprietes_Vide;
      end if;
      return L.all.Propriete.Num_Case;
   end N_Case;
   
   function Hypo(L : Liste_Proprietes ; C : Numero_Case) return Boolean is
      Auxi : Liste_Proprietes;
   begin
      if not Possede_Propriete(C, L) then
	 raise Propriete_Non_Possedee;
      else
	 Auxi := L;
	 while Auxi.all.Propriete.Num_Case /= C loop
	    Auxi := Auxi.all.Suiv;
	 end loop;
      end if;
      return Auxi.all.Propriete.Hypotheque;
   end Hypo ;
   
   function Nb_Gares(L : Liste_Proprietes) return Natural is 
      Resultat : Natural;
   begin
      Resultat := 0;
      for I in 0..3 loop
	 if Possede_Propriete(6+I*10, L) then -- Gares situees cases (6, 16, 26, 36)
	    Resultat := Resultat + 1;
	 end if;
      end loop;
      return Resultat;
   end Nb_Gares;
   
   function Nb_Rues_Meme_Couleur (L : Liste_Proprietes ; Col : Couleur_Case) return Natural is
      Auxi : Liste_Proprietes;
      Resultat : Natural;
   begin
      Resultat := 0;
      Auxi := L;
      while Auxi /= null loop
	 if Type_Case(Plat(Auxi.all.Propriete.Num_Case)) = Rue and then Couleur(Plat(Auxi.all.Propriete.Num_Case)) = Col then 
	    Resultat := Resultat +1;
	 end if;
	 Auxi := Auxi.all.Suiv;
      end loop;
      return Resultat;
   end Nb_Rues_Meme_Couleur;
   
   function Nb_Compagnies(L : Liste_Proprietes) return Natural is 
      Resultat : Natural;
   begin 
      Resultat := 0;   
      if Possede_Propriete(13, L) then
	 Resultat := Resultat + 1;
      end if;
      if Possede_Propriete(29, L) then 
	 Resultat := Resultat + 1;
      end if;
      return Resultat;
   end Nb_Compagnies;
   
   function Case_Presente(L : Liste_Proprietes ; C : Numero_Case) return Boolean is
      Aux : Liste_Proprietes;
      Trouve : Boolean;
   begin
      Aux := L;
      Trouve := False;
      while Aux/=null and not Trouve loop
	 if Aux.all.Propriete.Num_Case = C then
	    Trouve := True;
	 end if;
	 Aux := Aux.all.Suiv;
      end loop;
      return Trouve;
   end Case_Presente;
   
   function Couleur_Complete(L : Liste_Proprietes ; Col : Couleur_Case) return Boolean is
      
      N : Natural;
   begin
      N := Nb_Rues_Meme_Couleur(L, Col);
      if Col = (148, 72, 40) or Col = (2, 104, 179) then
	 return N=2;
      elsif Col = (186, 228, 250) or Col = (215, 47, 135) or Col = (244, 145, 0) or Col = (227, 0, 17) or Col = (253, 237, 2) or Col = (31, 165, 76) then
	 return N=3;
      else
         raise Couleur_Inexistante; Return False;
      end if;
   end Couleur_Complete;
   
   function Moins_De_2_Decart_Cons(L : Liste_Proprietes; C : Numero_Case) return Boolean is
      
      Auxi : Liste_Proprietes := L ;
      Min : Natural ;
   begin
      Min := 5;
      while not Est_Vide(Auxi) loop
	 if Couleur(Plat(N_Case(Auxi))) = Couleur(Plat(C)) then
	    if Min > N_Maisons(Auxi) then
	       Min := N_Maisons(Auxi) ;
	    end if;
	 end if;
	 Auxi := Suiv(Auxi) ;
      end loop ;
      return (Nb_Maisons_Propriete(L, C) + 1) - Min < 2 ;
   end Moins_De_2_Decart_Cons;
   
   function Moins_De_2_Decart_Vent(L : Liste_Proprietes; C : Numero_Case) return Boolean is
      
      Auxi : Liste_Proprietes := L ;
      Max : Natural ;
      
      
   begin
      
      Max := 0;
      
      
      while not Est_Vide(Auxi) loop
	 if Couleur(Plat(N_Case(Auxi))) = Couleur(Plat(C)) then
	    
	    if Max < N_Maisons(Auxi) then
	       
	       Max := N_Maisons(Auxi) ;
	    end if;
	    
	    
	 end if;
	 Auxi := Suiv(Auxi) ;
      end loop ;
      return (Max - Nb_Maisons_Propriete(L, C) - 1)  < 2 ;
   end Moins_De_2_Decart_Vent;


end Listes_Proprietes;
