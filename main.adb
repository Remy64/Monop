with Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;
use Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;

procedure Main is
   
   Fin_Partie : Boolean; -- grosse condition que l'on défnira probablement à la fin pour terminer la partie
   Lanc : Un_Lancer; -- variable pour enregistrer le lancer des dés
   Cartes_Chance : File_Cartes;
   
   function Choix_Binaire return Boolean is -- fonction qui demande au joueur de répondre par oui ou par non et qui renvoie le résultat sous forme de booléen
      Available : Boolean; -- indique si un caractère a été entré au clavier, utilisé par Get_Immediate également
      Ch : Character; -- un enregistreur de caractères auxiliaire utilisé par la procédure Get_Immediate
   begin
      Available := False;
      while (not Available) and then Ch /= 'o' and Ch /= 'n' loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre à la question enoncée plus haut
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
	 Ajouter_Argent(Proprio, Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C))); -- alors là c'est la merde mais en gros :
													      -- Proprietes_Joueur(N) renvoie la liste des proprietes du joueur N
													      -- Nb_Maisons_Proprietes utilise cette liste pour trouver le nombre de maisons possédées par le joueur N sur la case de numéro C ; parce qu'en plus C ça peut être une case ou un numéro de case :(
													      -- Plat(C) transforme C le numéro en C la case (joie)
													      -- Loyer de toute cette merde calcule le loyer à partir de la case (et pas du numéro de la case => je veux me pendre) et du nombre de maisons sur la case
													      -- Sans surprise, Proprietaire_Case(C) renvoie le numéro du joueur qui possède la case (0 si personne ne la possède mais on a déjà traité ce cas)
													      -- Et mon tout est la mort, enfin... je veux dire que c'est l'action de transférer de l'argent sur le compte de la personne à qui tu payes le loyer donc probablement toi
      else -- cas où le joueur possède le terrain
	 null;
	 -- là il va falloir prendre en compte les couleurs pour voir si on peut construire des maisons ou pas
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
	 
	 if N_Maisons(L) = 5 then Nb_Hotels := Nb_Hotels +1 ; -- il faut analyser le nombre de maisons pour chaque case, pas en général. 
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
      
   begin
      
      Tourner(Cartes_Chance, Ca) ;
      Put_Line(Titre_Carte(Ca)) ;
      Put_Line(Description_Carte(Ca)) ;
      
      case Effet_Carte(Ca) is 
	 when Argent => Carte_Argent(Ca, N);
	 when Prison => Case_Est_Prison(N); -- c'est la même procédure donc je la réutilise
	 when Bouger => Avancer(N, Montant_Carte(Ca));
	 when Aller_A =>
	    Pos_Prec := Position_Joueur(N);
	    Atteindre_Position(N, Montant_Carte(Ca));
	    Argent_Case_Depart(N, Pos_Prec); -- teste si le joueur est passé par la case départ et si oui lui donne son dû
	 when Hotel => Carte_Hotel(Ca); -- je virerais ça à ta place...
      end case;	
      
   end Case_Est_Pioche ;
   
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
       	       case Couleur(Ca) is
		  when (148, 72, 40) => return "Marron";
		  when (186, 228, 250) => return "Bleu Ciel";
		  when (215, 47, 135) => return "Rose";
		  when (244, 145, 0) => return "Orange";
		  when (227, 0, 17) => return "Rouge";
		  when (253, 237, 2) => return "Jaune";    
		  when (31, 165, 16) => return "Vert";
		  when (2, 104, 179) => return "Bleu";
		  when others => return "Couleur inconnue";
	       end case;
	    when Prison => return "Prison";
	    when Place => return "Place";
	    when Pioche => return "Pioche";
	    when Taxe => return "Taxe";
	 end case;
      end Type_Couleur_Case;
      
      function Inutile(S : Natural) return String is
      begin
	 if S = 0 then
	    return "T'as perdu, non ?";
	 elsif S < 100 then
	    return "Achète un manteau et une écharpe, il fait froid dans la rue.";
	 elsif S < 500 then
	    return "Tu sais que la banque peut prendre ta maison ?";
	 elsif S < 1000 then
	    return "Tu es un mouton de la classe moyenne, oppresseur cis-genre";
	 elsif S < 2000 then
	    return "Ça va ? Tranquille ?";
	 elsif S < 3000 then
	    return "Et sinon, t'as combien d'hôtels ?";
	 elsif S < 4000 then
	    return "Toi, tu vas voir quand on va faire une révolution marxiste-léniniste";
	 else
	    return "Prolétaires de tous les pays, unissez-vous !";
	 end if;	 
      end Inutile;
      
      procedure Afficher_Proprietes(N : Un_Num_Joueur) is
	 L : Liste_Proprietes := Proprietes_Joueur(N);
      begin
	 for I in 1..Nb_Rue loop
	     if Case_Presente(L, I) then
		Put_Line("• " & Nom_Case(I) & " : " & Type_Couleur_Case(Plat(I)));
		Put_Line("   - Hypothéquée : " & Hypo(L, I));
		if Type_Case(Plat(I)) = Rue then
		   Put_Line("   - Nombre de maisons : " & Nb_Maisons_Propriete(L, I));
		end if;
	     end if;
	 end loop;
      end Afficher_Proprietes;
      
   begin
      Put_Line(Joueur_N & " :"); -- numéro
      Put_Line("Position : " & Num_Ca & ", " & Nom_Case(Ca) & " (" & Type_Couleur_Case(Ca) & ")"); -- position
      Put_Line("Solde : " & Integer'Image(Compte_Joueur(N)) & " (" & Inutile(Compte_Joueur(N)) & ")"); -- solde
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
	    Pos_Prec := Position_Joueur(N);
	    Avancer(Lancer);
	    Argent_Case_Depart(N, Pos_Prec);
	 
	    case Type_Case(Plat(Position_Joueur(N))) is -- analyse le type de la case sur la quelle le joueur est tombé
	       when Gare =>
	          Case_Est_Gare(N, Plat(Position_Joueur(N)));
	       when Service =>
	          Case_Est_Service(N, Plat(Position_Joueur(N)));
	       when Rue =>
	          Case_Est_Rue(N, Plat(Position_Joueur(N)));
	       when Prison =>
	          Case_Est_Prison(N, Plat(Position_Joueur(N)));
	       when Place =>
	          null;
	       when Pioche =>
	          Case_Est_Pioche(N, Plat(Position_Joueur(N)));
	       when Taxe =>
	          Case_Est_Taxe(N, Plat(Position_Joueur(N)));
	    end case;
	    
	 end if;
	 
      end loop;
      
   end loop;
   
end Main;
