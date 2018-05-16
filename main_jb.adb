with Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;
use Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;

procedure Main is
   
   Fin_Partie : Boolean; -- grosse condition que l'on défnira probablement à la fin pour terminer la partie
   Lanc : Un_Lancer; -- variable pour enregistrer le lancer des dés
   Cartes_Chance : File_Cartes;
   Pos_Prec :  Numero_Case ;
   L : Liste_Proprietes;
   C : Numero_Case;
   
   procedure Afficher_Plateau is
      S : String(1..40);
   begin
      S := (others => " ");
      for I in 1..Nb_Rue loop
	 S(3*I) := '0';
	 for N in Un_Num_Joueur loop
	    if Position_Joueur(N)=I then
	       S(3*I) := Integer'Image(N)(0);
	    end if;
	 end loop;
      end loop;
      Put_Line("  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20");
      Put_Line(S(1..20));
      Put_Line(" 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40");
      Put_Line(S(21..40));
   end Afficher_Plateau;
   
   function Choix_Binaire return Boolean is -- fonction qui demande au joueur de répondre par oui ou par non et qui renvoie le résultat sous forme de booléen
      Available : Boolean; -- indique si un caractère a été entré au clavier, utilisé par Get_Immediate également
      Ch : Character; -- un enregistreur de caractères auxiliaire utilisé par la procédure Get_Immediate
   begin
      Available := False;
      Get_Immediate(Ch, Available) ;
      while (not Available) and then( Ch /= 'o' and Ch /= 'n') loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre à la question enoncée plus haut
	 Get_Immediate(Ch, Available);
      end loop;
      return Ch = 'o' ;
   end Choix_Binaire;
   
   procedure Argent_Case_Depart(N : Un_Num_Joueur; Pos_Prec : Numero_Case) is
   begin
      if Passe_Depart(Pos_Prec, Position_Joueur(N)) and not Est_En_Prison(N) then -- teste si le joueur est passé par la case départ, s'il est en prison il ne doit pas toucher d'argent
         Ajouter_Argent(N, 200);
      end if;
   end Argent_Case_Depart;
   
   procedure Case_Est_Prison(N : Un_Num_Joueur) is -- action à réaliser quand un joueur tombe sur la case "Aller en prison"
   begin
      Atteindre_Position(N, 11) ;
      if Possede_Carte_Lib(N) then
	 Retirer_Carte_Lib(N);
      else
	 Mettre_En_Prison(N);
      end if;
   end Case_Est_Prison;
   
   procedure Case_Est_Rue(N : Un_Num_Joueur; C : Numero_Case) is -- algorithme d'Inception aussi appelé de la quadruple imbrication ou tueur de neurones
      Montant : Natural;
      Proprio : Natural;
      L : Liste_Proprietes;
   begin
      Proprio := Proprietaire_Case(C);
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
	 Put("Voulez-vous acheter " & Nom_Case(Plat(C)) & ", joueur " & Integer'Image(N) & " ?  o/n");
	 
         if Choix_Binaire then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 else
	    Put("Il faut prendre des risques en affaires ! Demandez conseil à Antoine et montez votre start-up !");
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 Montant := Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C));
	 Put("Vous devez payer un loyer de " & Integer'Image(Montant) & " au joueur " & Integer'Image(Proprio));
	 Ajouter_Argent(N, -Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 Ajouter_Argent(Proprio, Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C))); 
      else -- cas où le joueur possède le terrain
	 null;
      end if;
      
   end Case_Est_Rue;
   
   procedure Case_Est_Service(N : Un_Num_Joueur; C : Numero_Case) is
      
      Montant : Natural;
      Proprio : Natural;
      L : Liste_Proprietes;
   begin
      Proprio := Proprietaire_Case(C);
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
	 Put("Voulez-vous acheter " & Nom_Case(Plat(C)) & ", joueur " & Integer'Image(N) & " ?  o/n");
	 
         if Choix_Binaire then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 else
	    Put("Il faut prendre des risques en affaires ! Demandez conseil à Antoine et montez votre start-up !");
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 
	 if Nb_Compagnies(Proprietes_Joueur(Proprio)) = 1 then	    
	    Montant := Lanc.Des * 4;
	 elsif Nb_Compagnies(Proprietes_Joueur(Proprio)) = 2 then
	    Montant := Lanc.Des*10;
	 end if ;
	 
	 Put("Vous devez payer un loyer de " & Integer'Image(Montant) & " au joueur " & Integer'Image(Proprio));
	 Ajouter_Argent(N, -Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 Ajouter_Argent(Proprio, Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 
      end if ;
   end Case_Est_Service ;
   
      
         procedure Case_Est_Gare(N : Un_Num_Joueur; C : Numero_Case) is
      
      Montant : Natural;
      Proprio : Natural;
      L : Liste_Proprietes;
   begin
      Proprio := Proprietaire_Case(C);
      if Proprio = 0 then -- cas où le terrain n'appartient à personne
	 
	 Put("Voulez-vous acheter " & Nom_Case(Plat(C)) & ", joueur " & Integer'Image(N) & " ?  o/n");
	 
         if Choix_Binaire then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 else
	    Put("Il faut prendre des risques en affaires ! Demandez conseil à Antoine et montez votre start-up !");
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 
	 Montant := 25 *2**(Nb_Gares(Proprietes_Joueur(Proprio))-1) ;
	 
	 Put("Vous devez payer un loyer de " & Integer'Image(Montant) & " au joueur " & Integer'Image(Proprio));
	 Ajouter_Argent(N, -Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 Ajouter_Argent(Proprio, Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
      end if ;
   end Case_Est_Gare ;
   
   procedure Case_Est_Taxe(N : Un_Num_Joueur; C : Numero_Case) is
      
   begin
      
      Put_Line("Vous devez payer une taxe de"&Natural'Image(Prix_Terrain(Plat(C)))) ;
      Ajouter_Argent(N, -Prix_Terrain(Plat(C))) ;
      
   end Case_Est_Taxe ;
   
     procedure Tomb_Case_Incomplete(N : Un_Num_Joueur; C : Numero_Case) is
      
   begin
      
       case Type_Case(Plat(Position_Joueur(N))) is -- analyse le type de la case sur la quelle le joueur est tombé
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
      Put_Line(Titre_Carte(Ca)) ;
      Put_Line(Description_Carte(Ca)) ;
      
      case Effet_Carte(Ca) is 
	 when Argent => Carte_Argent(Ca, N);
	 when Prison => Case_Est_Prison(N); -- c'est la même procédure donc je la réutilise
	 when Bouger => Pos_Prec := Position_Joueur(N) ;
	    Avancer(N, Montant_Carte(Ca));
	    Argent_Case_Depart(N, Pos_Prec) ;
	      if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	       Case_Est_Pioche(N,C) ;
	    else
	       Tomb_Case_Incomplete(N,C) ;
	    end if ;
	 when Aller_A =>
	    Pos_Prec := Position_Joueur(N);
	    Atteindre_Position(N, Montant_Carte(Ca));
	    Argent_Case_Depart(N, Pos_Prec);
	    
	      if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	       Case_Est_Pioche(N,C) ;
	    else
	       Tomb_Case_Incomplete(N,C) ;
	    end if ;
	 when Hotel => Carte_Hotel(Ca); -- je virerais ça à ta place...
      end case;	
      
   end Case_Est_Pioche ;
   
      procedure Tomber_Case(N : Un_Num_Joueur ; C : Numero_Case) is
      
      begin
      
      if Type_Case(Plat(Position_Joueur(N))) = Pioche then
	       Case_Est_Pioche(N,C) ;
	    else
	       Tomb_Case_Incomplete(N,C) ;
      end if ;
      
      end Tomber_Case ;
      
   
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
   
begin
   
   Init(Cartes_Chance) ;
   Melanger(Cartes_Chance) ;
   Init_Joueurs;
   
   while not Fin_Partie loop
      
      for N in Un_Num_Joueur loop
	 
	 Lanc := Lancer;
	   
	 if Trois_Tours(N) then -- on vérifie que le joueur n'a pas passé 3 tours en prison, sinon on le sort de prison
	    Sortir_De_Prison(N);
	    Ajouter_Argent(N, -50) ;
	   RAZ_Tour_Prison(N);
	 end if;
	   
	 if Est_En_Prison(N) then
	   
	    Put("Voulez-vous payer 50€ pour sortir de prison ? o/n");
      
            if Choix_Binaire then -- le joueur paie et sort de prison
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
	    
	 else
	    
	    L := Proprietes_Joueur(N);
	    while not Est_Vide(L) loop
	       C := N_Case(L) ;
	       if Type_Case(Plat(C)) = Rue and then Couleur_Complete(L, Couleur(Plat(C))) then
		  Put_Line("Voulez-vous construire une maison à " & Nom_Case(Plat(C)) & " ?");
		  if Choix_Binaire then
		     Ajouter_Enlever_Maison(True, C, L);
		  else
		     Put_Line("Voulez-vous détruire une maison à " & Nom_Case(Plat(C)) & " ?");
		     if Choix_Binaire then
			Ajouter_Enlever_Maison(False, C, L);
		     end if;
		  end if;
	       end if;
	       L := Suiv(L) ;
            end loop;

	    
	    Pos_Prec := Position_Joueur(N);
	    Avancer(N, Lancer.Des);
	    Argent_Case_Depart(N, Pos_Prec);
	    
	    Tomber_Case(N, Position_Joueur(N)) ; 
	 

	 end if;
	 
      end loop;
      
   end loop;
   
end Main;
