
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
   
   
      procedure Afficher_Infos_Joueur(N : Un_Num_Joueur) is
      Joueur_N : constant String := "Joueur " & Integer'Image(N);
      Num_Ca : Numero_Case := Position_Joueur(N);
      Ca : Cases := Plat(Num_Ca);
      
     
      
      
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
   
   procedure Choix_Menu(A : out Une_Action ; N : in Un_Num_Joueur) is
      
      function Une_Collection_Complete(L : Liste_Proprietes) return Boolean is
	 
	 Resultat : Boolean ;
	 
	 
      begin
	 
	 if Est_Vide(L) then Resultat := False ;
	 elsif Type_Case(Plat(N_Case(L))) = Rue  then
	    Resultat := Couleur_Complete(L, Couleur(Plat(N_Case(L)))) or else Une_Collection_Complete(Suiv(L)) ;
	    
	 else 
	    Resultat := Une_Collection_Complete(Suiv(L)) ;
	    
	    
	 end if;
	 
	 return Resultat ;
	 
      end Une_Collection_Complete ;
      
      Saisie_Clavier : Character ;
      
      begin
      
      if Une_Collection_Complete(Proprietes_Joueur(N)) then
	 Put_Line("Selectionnez votre action : Hypothequer, Construire une maison, Passer le tour : 'h'/'c'/'p'") ;
	 Skip_Line ;
	 Get_Immediate(Saisie_Clavier) ;
	 
	 if Saisie_Clavier = 'p' then
	    A := Passer_Tour ;
	 elsif Saisie_Clavier = 'c' then
	    A := Construire ;
	 elsif Saisie_Clavier = 'h' then
	    A := Hypothequer ;
	 else
	    raise Saisie_Invalide ;
	   
	 end if ;
	 
      elsif not Est_Vide(Proprietes_Joueur(N)) then
	 Put_Line("Selectionnez votre action : Hypothequer, Passer le tour : 'h'/'p'");
	 Skip_Line ;
	 Get_Immediate(Saisie_Clavier) ;
	 if Saisie_Clavier = 'h' then 
	    A := Hypothequer ;
	 elsif Saisie_Clavier = 'p' then
	    A := Passer_Tour ;
	 else
	    raise Saisie_Invalide ;
	    
	 end if ;
	 
      else
	 
	 Put_Line("Confirmez la fin de votre tour : 'p'") ;
	 Skip_Line ;
	 Get_Immediate(Saisie_Clavier) ; 

	 if Saisie_Clavier = 'p' then
	    A := Passer_Tour ;
	 else
	    raise Saisie_Invalide ;
	    
	 end if ;
      end if ;
      
	 
      end Choix_Menu ;
      
      procedure Menu_Hypothequer(N : Un_Num_Joueur; K : out Numero_Case) is
	 	 
	 
	 L : Liste_Proprietes := Proprietes_Joueur(N);
	 C : Numero_Case ;
	 
      begin
	 Put_Line("Liste des proprietes hypothecables : ");
	 while not Est_Vide(L) loop
	    C := N_Case(L) ;
	    if not Hypo(L, C) then 
	     
		Put_Line("• " &"Case n°"&Numero_Case'Image(C)& Nom_Case(Plat(C)) & " : " & Type_Couleur_Case(Plat(C)));
	        
		if Type_Case(Plat(C)) = Rue then
		   Put_Line("   - Nombre de maisons : " & Integer'Image(Nb_Maisons_Propriete(L, C)));
		end if;
	    end if ;
	    L := Suiv(L) ;
	 end loop ;
	 L := Proprietes_Joueur(N) ;
	 C := N_Case(L) ;
	 
	 New_Line ;
	 Put_Line("Liste des proprietes hypothequees") ;
	 
	 while not Est_Vide(L) loop
	   
	   if Hypo(L, C) then 
	   
	   Put_Line("• " &"Case n°"&Numero_Case'Image(C)& Nom_Case(Plat(C)) & " : " & Type_Couleur_Case(Plat(C)));
	   
	   if Type_Case(Plat(C)) = Rue then
	      Put_Line("   - Nombre de maisons : " & Integer'Image(Nb_Maisons_Propriete(L, C)));
	   end if;
	   end if ;
	   
	   L := Suiv(L) ;
	 end loop; 
	 New_Line ;
	 Put_Line("Entrez le numero de la propriete que vous souhaitez hypothequer ou sur laquelle vous souhaitez lever l'hypotheque") ;
	 
	 Skip_Line ;
	 Get(K);   
	 
	 
      end Menu_Hypothequer ;
      
      procedure Menu_Construction(N : in Un_Num_Joueur; K : out Numero_Case; B : out Boolean) is
	 L : Liste_Proprietes ;
	 C : Numero_Case ;
	 
	 
	 
      begin
	 L := Proprietes_Joueur(N) ;
	 
	 Put_Line("Voulez vous achetez(o) ou vendre(n) une maison ? : o/n");
	 
	 B := Choix_Binaire ;
	 
	 if B then
	    
	    Put_Line("Liste des rues constructibles") ;
	      while not Est_Vide(L) loop 
	      
	      C := N_Case(L) ;
	      if Type_case(Plat(C)) = Rue and then Couleur_Complete(Proprietes_Joueur(N), Couleur(Plat(C))) and then  Moins_De_2_Decart_Cons(Proprietes_Joueur(N), C) and then N_Maisons(L) < 5 then
		 
		 Put_Line("• " &"Case n°"&Numero_Case'Image(C)& Nom_Case(Plat(C)) & " : " & Type_Couleur_Case(Plat(C)));
		 Put_Line("   - Nombre de maisons : " & Integer'Image(Nb_Maisons_Propriete(L, C)));
	      end if ;
	      L := Suiv(L) ;
	     
	    end loop ;
	    
	    Put_Line("Entrez le numero de la propriété sur laquelle vous souhaitez faire construire") ;
	    Skip_Line ;
	    Get(K) ;
	    
	    
	 else
	    
	    Put_Line("Liste des rues avec des maisons à vendre :");
	    
	    while Not Est_Vide(L) loop
	       C := N_Case(L) ;
	        if Type_case(Plat(C)) = Rue and then Couleur_Complete(Proprietes_Joueur(N), Couleur(Plat(C))) and then  Moins_De_2_Decart_Vent(Proprietes_Joueur(N), C) and then N_Maisons(L) > 0 then
		 
		 Put_Line("• " &"Case n°"&Numero_Case'Image(C)& Nom_Case(Plat(C)) & " : " & Type_Couleur_Case(Plat(C)));
		 Put_Line("   - Nombre de maisons : " & Integer'Image(Nb_Maisons_Propriete(L, C)));
	      end if ;
	      L := Suiv(L) ;
	     
	    end loop ;
	    
	    Put_Line("Entrez le numero de la rue sur laquelle vous souhaitez vendre une maison");
	    Skip_Line ;
	    Get(K) ;
	    
	      
	    
	    
	 end if ;
	 
	    
	    
	 
        
	 
      end Menu_Construction ;
      
      
	      
	   

      
   
   end Interface_Joueur_Machine ;
   
