with Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau, Afficher;
use Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau, Afficher;

procedure Main is
   
   
   Lanc : Un_Lancer; -- variable pour enregistrer le lancer des dés
   Cartes_Chance : File_Cartes;
   Pos_Prec :  Numero_Case ;
   A : Une_Action ;
   K : Numero_Case ;
   B : Boolean ;
   
   
      procedure Hypothequer(N : Un_Num_Joueur; C : Numero_Case) is
      
   begin
      
      if not Possede_Propriete(C, Proprietes_Joueur(N)) then raise Propriete_Non_Possedee ;
      else
	 Hyp(True, N, C) ;
	 Ajouter_Argent(N, Prix_Terrain(Plat(C))/2);
      end if ;
      end Hypothequer ;
   procedure Deficit(N : Un_Num_Joueur ; Du : Natural) is
      
      function  Patrimoine return Natural is 
	 L : Liste_Proprietes ;
	 Resultat : Natural ;
      begin
	 L := Proprietes_Joueur(N) ;
	 Resultat := 0 ;
	 while not Est_Vide(L) loop
	    if not Hypo(L, N_Case(L)) then
	       Resultat := Resultat + Prix_Terrain(Plat(N_Case(L)))/2 ;
	    end if ;
	    L := Suiv(L) ;
	 end loop ;
	 return Resultat ;
      end Patrimoine ;
      
      K : Numero_Case ;
   begin
      
      if Compte_Joueur(N) - Du + Patrimoine < 0 then Eliminer(N) ;
      else
	 while Compte_Joueur(N) - Du < 0 loop
	    Hypotheque_Forcee(N, K) ;
	    if Possede_Propriete(K, Proprietes_Joueur(N)) then
	       Hypothequer(N, K) ;
	    end if ;
	 end loop ;
	 Ajouter_Argent(N, -Du) ;
      end if ;
      
	 end Deficit ;
	
      
   
   procedure Argent_Case_Depart(N : Un_Num_Joueur; Pos_Prec : Numero_Case) is
   begin
      if Passe_Depart(Pos_Prec, Position_Joueur(N)) and not Est_En_Prison(N) then -- teste si le joueur est passé par la case départ, s'il est en prison il ne doit pas toucher d'argent
         Ajouter_Argent(N, 200);
      end if;
   end Argent_Case_Depart;
   

      
      
   
   
   procedure Deshypothequer(N : Un_Num_Joueur ; C : Numero_Case) is
      
   begin
      
      if not Possede_Propriete(C, Proprietes_Joueur(N)) then raise Propriete_Non_Possedee ;
      elsif Compte_Joueur(N) - Integer(Float((Prix_Terrain(Plat(C))/2))*1.1) < 0 then
	  Pas_Assez ;
	 null ;
      else
	 Hyp(False, N, C) ;
	 Ajouter_Argent(N, -Integer(Float((Prix_Terrain(Plat(C))/2))*1.1));
      end if ;
   end Deshypothequer ;
   
   procedure Gerer_Hypotheque(N : Un_Num_Joueur ; C : Numero_Case) is
      
      L : Liste_Proprietes := Proprietes_Joueur(N) ;
      
   begin
      
      if not Possede_Propriete(C, L) then
	 
	 Actualiser_Plateau(N);
	 
      elsif Hypo(L, C) then
	 
	 Deshypothequer(N, C) ;
	 
      else
	 Hypothequer(N,C) ;
	 
      end if ;
      
      end Gerer_Hypotheque ;
	 
   
   procedure Construire(N : Un_Num_Joueur ; C : Numero_Case) is
      

      
      List : Liste_Proprietes ;
      
   begin
      

      if not Possede_Propriete(C, Proprietes_Joueur(N)) then raise Propriete_Non_Possedee ;
      elsif not Couleur_Complete(Proprietes_Joueur(N), Couleur(Plat(C))) then
	 Actualiser_Plateau(N) ;
      elsif not Moins_De_2_Decart_Cons(Proprietes_Joueur(N), C) then
	Actualiser_Plateau(N) ;
      elsif Nb_Maisons_Propriete(Proprietes_Joueur(N), C) = 5 then
	 Actualiser_Plateau(N) ;
      elsif Compte_Joueur(N) -50*((C-1)/10+1) < 0 then
	 
	 Pas_Assez ;
	 
        
      else
	 
	 List := Proprietes_Joueur(N) ;
	 Ajouter_Enlever_Maison(True, C, List) ;
	 Ajouter_Argent(N, -50*((C-1)/10+1)) ;
	 
      end if ;
      
   end Construire ;

   procedure Vendre_Maison(N : Un_Num_Joueur; C : Numero_Case) is
      

      
      List : Liste_Proprietes ;
      
   begin
      

      if not Possede_Propriete(C, Proprietes_Joueur(N)) then raise Propriete_Non_Possedee ;
      elsif not Couleur_Complete(Proprietes_Joueur(N), Couleur(Plat(C))) then
	Actualiser_Plateau(N) ;
      elsif not Moins_De_2_Decart_Vent(Proprietes_Joueur(N), C) then
	Actualiser_Plateau(N) ;
      elsif Nb_Maisons_Propriete(Proprietes_Joueur(N), C) = 0 then
	Actualiser_Plateau(N) ;
      else
	 
	 List := Proprietes_Joueur(N) ;
	 Ajouter_Enlever_Maison(False, C, List) ;
	 Ajouter_Argent(N, (50*((C-1)/10+1))/2) ;
	 
      end if ;
      
   end Vendre_Maison ;
   
   
   
   
   
   
   
   
   
   
   
   
   procedure Case_Est_Prison(N : Un_Num_Joueur) is -- action à réaliser quand un joueur tombe sur la case "Aller en prison"
   begin
      if Possede_Carte_Lib(N) then
	 Retirer_Carte_Lib(N);
      else
	 Mettre_En_Prison(N);
	 Atteindre_Position(N, 11) ;
      end if;
   end Case_Est_Prison;
   
   procedure Case_Est_Rue(N : Un_Num_Joueur; C : Numero_Case) is -- algorithme d'Inception aussi appelé de la quadruple imbrication ou tueur de neurones
      Montant : Natural;
      Proprio : Natural;
      L : Liste_Proprietes;
   begin
      Proprio := Proprietaire_Case(C);
      Put_Line("Proprietaire Case : "&Natural'Image(Proprio)) ;
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
	 
	 
         if Choix_Binaire("Acheter"&Nom_Case(Plat(C))&" ?") then
	    if Compte_Joueur(N) - Prix_Terrain(Plat(C)) < 0 then 
	       Pas_Assez ;
	    else
	       
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    
	    Ajouter_Propriete_Joueur(N, C); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	    end if ;
	    
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 Montant := Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(Proprio), C));
	 Put("Vous devez payer un loyer de " & Integer'Image(Montant) & " au joueur " & Integer'Image(Proprio));
	 
	 begin
	    Ajouter_Argent(N, -Montant);
	 exception 
	    when Compte_Vide => Deficit(N, Montant) ;
	 end ;
	 
	 Ajouter_Argent(Proprio, Montant); 
	 
      else -- cas où le joueur possède le terrain
	 null;
	 
      end if;
      
   end Case_Est_Rue;
   
   procedure Case_Est_Service(N : Un_Num_Joueur; C : Numero_Case) is
      
      Montant : Natural;
      Proprio : Natural;
      
   begin
      Proprio := Proprietaire_Case(C);
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
        
	 
         if Choix_Binaire("Acheter"&Nom_Case(Plat(C))&" ?") then
	    
	    if Compte_Joueur(N) - Prix_Terrain(Plat(C)) < 0 then
	       Pas_Assez ;
	    else
	       Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	       
	       Ajouter_Propriete_Joueur(N, C);
	    end if ;
        
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 
	 if Nb_Compagnies(Proprietes_Joueur(Proprio)) = 1 then	    
	    Montant := Lanc.Des * 4;
	 elsif Nb_Compagnies(Proprietes_Joueur(Proprio)) = 2 then
	    Montant := Lanc.Des*10;
	 end if ;
	 
	 
	 begin
	    Ajouter_Argent(N, -Montant);
	 exception 
	    when Compte_Vide => Deficit(N, Montant) ;
	 end ;
	 Ajouter_Argent(Proprio, Montant);
	 
      end if ;
   end Case_Est_Service ;
   
   
   procedure Case_Est_Gare(N : Un_Num_Joueur; C : Numero_Case) is
      
      Montant : Natural;
      Proprio : Natural;
      
   begin
      Proprio := Proprietaire_Case(C);
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
	 
	 
         if Choix_Binaire("Acheter"&Nom_Case(Plat(C))&" ?") then
	    if Compte_Joueur(N) - Prix_Terrain(Plat(C)) < 0 then
	       Pas_Assez ;
	       else
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    Ajouter_Propriete_Joueur(N, C); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	    end if ;
        
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 
	 Montant := 25 *(2**(Nb_Gares(Proprietes_Joueur(Proprio))-1)) ;
	 
	 
	 begin
	    Ajouter_Argent(N, -Montant);
	 exception 
	    when Compte_Vide => Deficit(N, Montant) ;
	 end ;
	 Ajouter_Argent(Proprio, Montant);
      end if ;
   end Case_Est_Gare ;
   
   procedure Case_Est_Taxe(N : Un_Num_Joueur; C : Numero_Case) is
      
   begin
      
      
      Ajouter_Argent(N, -Prix_Terrain(Plat(C))) ;
      
   exception
      when Compte_Vide => Deficit(N, Prix_Terrain(Plat(C))) ;
      
   end Case_Est_Taxe ;
   
   procedure Tomb_Case_Incomplete(N : Un_Num_Joueur; C : Numero_Case) is
      
   begin
      
      case Type_Case(Plat(C)) is -- analyse le type de la case sur la quelle le joueur est tombé
	 when Gare =>
	    Case_Est_Gare(N,C) ;
	 when Service =>
	    Case_Est_Service(N, C);
	 when Rue =>
	    Case_Est_Rue(N,C);
	 when Prison =>
	    Case_Est_Prison(N);
	 when Place =>
	    null;
	 when Pioche =>
	    null;
	 when Taxe =>
	    Case_Est_Taxe(N,C);
      end case;
      
   end Tomb_Case_Incomplete ;
   
   procedure Case_Est_Pioche(N : Un_Num_Joueur; C : Numero_Case) is
      
      procedure Carte_Argent(Ca : Une_Carte; N : Un_Num_Joueur) is -- cas où la carte gère de l'argent
      begin	 
	 case Destinataire_Carte(Ca) is 
	    when Banque => Ajouter_Argent(N, Montant_Carte(Ca));
	    when Autres_Joueurs =>
	       for K in Un_Num_Joueur loop
	          if K /= N then
		     Ajouter_Argent(K, -Montant_Carte(Ca)); 
	          else
		     Ajouter_Argent(K, Montant_Carte(Ca)*(Nb_Joueurs-1));
	          end if;
	       end loop;
	    when Aucun => null;
	 end case;
      end Carte_Argent;
      
      procedure Carte_Hotel(Ca : Une_Carte) is -- je pense qu'on ferait mieux de laisser tomber les cartes hotel et ce genre de subtilité en général
	 
	 L : Liste_Proprietes ;
	 Nb_Hotels : Natural ;
	 Nb_Maisons : Natural ;
	 
      begin
	 
	 L := Proprietes_Joueur(N) ;
	 Nb_Hotels := 0;
	 Nb_Maisons := 0;
	 
	 while not Est_Vide(L) loop
	    
	    if N_Maisons(L) = 5 then Nb_Hotels := Nb_Hotels +1 ;  
	    else 
	       Nb_Maisons := Nb_Maisons + N_Maisons(L) ;
	    end if ;
	    L := Suiv(L) ;
	 end loop ;
	 if Montant_Carte(Ca) = 40 then
	    Ajouter_Argent(N, -40*Nb_Maisons-110*Nb_Hotels) ;
	 else
	    Ajouter_Argent(N, -25*Nb_Maisons-110*Nb_Hotels) ;
	 end if ;
      end Carte_Hotel ;
      
      Ca : Une_Carte ;
      
      Pos_Prec : Numero_Case ;
      
   begin
      
      Tourner(Cartes_Chance, Ca) ;
      Afficher_Texte(Cote_Plat+20, Cote_Plat/2, Titre_Carte(Ca)&Character'Val(10)&Description_Carte(Ca)) ;
      delay 5.0 ;
      case Effet_Carte(Ca) is 
	 when Argent => Carte_Argent(Ca, N);
	 when Prison => Case_Est_Prison(N); -- c'est la même procédure donc je la réutilise
	 when Bouger => Pos_Prec := Position_Joueur(N) ;
	    Avancer(N, Montant_Carte(Ca));
	    Argent_Case_Depart(N, Pos_Prec) ;
	    if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	       Case_Est_Pioche(N,Position_Joueur(N)) ;
	    else
	       Tomb_Case_Incomplete(N,Position_Joueur(N)) ;
	    end if ;
	 when Aller_A =>
	    Pos_Prec := Position_Joueur(N);
	    Atteindre_Position(N, Montant_Carte(Ca));
	    Argent_Case_Depart(N, Pos_Prec);
	    
	    if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	       Case_Est_Pioche(N,Position_Joueur(N)) ;
	    else
	       Tomb_Case_Incomplete(N,Position_Joueur(N)) ;
	    end if ;
	 when Hotel => Carte_Hotel(Ca); -- je virerais ça à ta place...
      end case;	
      
   end Case_Est_Pioche ;
   
   procedure Tomber_Case(N : Un_Num_Joueur ; C : Numero_Case) is
      
   begin
      
      if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	 Case_Est_Pioche(N,Position_Joueur(N)) ;
      else
	 Tomb_Case_Incomplete(N,Position_Joueur(N)) ;
      end if ;
      
   end Tomber_Case ;
   
   procedure Gerer_Construction(N : Un_Num_Joueur ; C : Numero_Case ; B : Boolean) is 
      
   begin
      
      if B then 
	 Construire(N, C) ;
	 
      else
	 Vendre_Maison(N, C) ;
	 
      end if ;
      
   exception 
      
      when Propriete_Non_Possedee => Put_Line("Vous ne possedez pas cette proprietee") ;
   end Gerer_Construction ;
   
   
   
begin
   
   Init(Cartes_Chance) ;
   Melanger(Cartes_Chance) ;
   Init_Truquee;
   Init_Plateau ;
   
   
   
   while not Fin_Jeu loop
      
      for N in Un_Num_Joueur loop
	 
	 if not Elimine(N) then
	 
	
	 	 
	 Actualiser_Plateau(N) ;
	 if 1< Lanc.Des and Lanc.Des < 13 then
	    Lancer_De_De(Lanc) ;
	    end if ;
	 
	 if Trois_Tours(N) then -- on vérifie que le joueur n'a pas passé 3 tours en prison, sinon on le sort de prison
	    Sortir_De_Prison(N);
	    Ajouter_Argent(N, -50) ;
	    RAZ_Tour_Prison(N);
	 end if;
	 
	 if Est_En_Prison(N) then
	    
	    
            if Choix_Binaire("Voulez-vous payer 50€ pour sortir de prison ? o/n") then -- le joueur paie et sort de prison
	       Ajouter_Argent(N, -50);
	       Sortir_De_Prison(N);
	       RAZ_Tour_Prison(N);
	    else -- le joueur ne paie pas et tente un double
	       if Lanc.Double then
	          Sortir_De_Prison(N);
	          RAZ_Tour_Prison(N);
	       else
		  Incrementer_Tour_Prison(N); -- le double échoue et on marque qu'il a passé un tour de plus en prison
	       end if;
            end if;
	    
	 end if ;
	    
	 if not Est_En_Prison(N) then
	    
	    A := Hypothequer ;
	     while A /= Passer_Tour loop
	       
	       Choix_Menu(A, N) ;
	       if A = Hypothequer then
		  
		  Menu_Hypothequer(N, K) ;
		  Gerer_Hypotheque(N, K) ;
		  
	       elsif A = Construire then
		  
		  Menu_Construction(N, K, B) ;
		  Gerer_Construction(N, K, B) ;
		  
		  
		  
	       end if ;
	       
	    end loop ;
	    Lanc := Lancer;
	    Pos_Prec := Position_Joueur(N);
	    Avancer(N, Lanc.Des);
	    Argent_Case_Depart(N, Pos_Prec);
	   
	    
	    Actualiser_Plateau(N) ;
	    Lancer_De_De(Lanc) ;
	     
	    
	    Tomber_Case(N, Position_Joueur(N)) ;
	  
	    
	    
	    
	   
	    
	    
	    end if ;
	    
	    

	 end if ;
	 
      end loop;
      
   end loop;
   
   Afficher_Gagnant(Gagnant) ;
end Main;
