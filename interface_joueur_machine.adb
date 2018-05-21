
package body Interface_Joueur_Machine is
   
      function Choix_Binaire return Boolean is 
      Ch : Character; -- un enregistreur de caractères auxiliaire utilisé par la procédure Get_Immediate
   begin
      
      Get_Immediate(Ch) ;
      while ( Ch /= 'o' and Ch /= 'n') loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre à la question enoncée plus haut
	 Get_Immediate(Ch);
      end loop;
      return Ch = 'o' ;
   end Choix_Binaire;
   
   
      procedure Afficher_Infos_Joueur(N : Un_Num_Joueur) is
      Joueur_N : constant String := "Joueur " & Integer'Image(N);
      Num_Ca : Numero_Case := Position_Joueur(N);
      Ca : Cases := Plat(Num_Ca);
      
      function Type_Couleur_Case(Ca : Cases) return String is -- renvoie la fonction de la case ; si c'est une rue, sa couleur
      begin
	 case Type_Case(Ca) is
	    when Gare => return "Gare";
	    when Service => return "Service";
	    when Rue =>
       	         
		  if Couleur(Ca) = (148, 72, 40) then return "Marron";
		  elsif Couleur(Ca) = (186, 228, 250) then return "Bleu Ciel";
		  elsif Couleur(Ca) = (215, 47, 135) then return "Rose";
		  elsif Couleur(Ca) = (244, 145, 0) then return "Orange";
		  elsif Couleur(Ca) = (227, 0, 17) then return "Rouge";
		  elsif Couleur(Ca) = (253, 237, 2) then return "Jaune";    
		  elsif Couleur(Ca) = (31, 165, 16) then return "Vert";
		  elsif Couleur(Ca) = (2, 104, 179) then return "Bleu";
		  else return "Couleur inconnue";
	       end if;
	    when Prison => return "Prison";
	    when Place => return "Place";
	    when Pioche => return "Pioche";
	    when Taxe => return "Taxe";
	 end case;
      end Type_Couleur_Case;
      
      
      procedure Afficher_Proprietes(N : Un_Num_Joueur) is
	 L : Liste_Proprietes := Proprietes_Joueur(N);
	 C : Numero_Case ;
      begin
	 while not Est_Vide(L) loop
	    C := N_Case(L) ;
	     
		Put_Line("• " & Nom_Case(Plat(C)) & " : " & Type_Couleur_Case(Plat(C)));
		if Hypo(L, C) then
		   Put_Line(" La propriété est hypothéquée");
		   end if;
		if Type_Case(Plat(C)) = Rue then
		   Put_Line("   - Nombre de maisons : " & Integer'Image(Nb_Maisons_Propriete(L, C)));
		end if;
	     L := Suiv(L) ;
	 end loop;
      end Afficher_Proprietes;
      
   begin
      Put_Line(Joueur_N & " :"); -- numéro
      Put_Line("Position : " & Integer'Image(Num_Ca) & ", " & Nom_Case(Ca) & " (" & Type_Couleur_Case(Ca) & ")"); -- position
      Put_Line("Solde : " & Integer'Image(Compte_Joueur(N))) ; -- solde
      Put_Line("En_Prison : " & Boolean'Image(Est_En_Prison(N))); -- prison
      Afficher_Proprietes(N);
   end Afficher_Infos_Joueur ;
   
   
   procedure Afficher_Plateau is
   begin
      for I in 1..Nb_Rue loop
	 Put("Case" & Integer'Image(I) & " :");
	 for N in Un_Num_Joueur loop
	    if Position_Joueur(N)=I then
	       Put(" " & Integer'Image(N));
	    end if;
	
	 end loop;
	 New_Line;
      end loop;
   end Afficher_Plateau;
   
   end Interface_Joueur_Machine ;
   
