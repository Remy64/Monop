with Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;
use Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;

procedure Main is
   
   Fin_Partie : Boolean; -- grosse condition que l'on défnira probablement à la fin pour terminer la partie
   Ch : Character; -- un enregistreur de caractères auxiliaire utilisé par la procédure Get_Immediate
   Available : Boolean; -- indique si un caractère a été entré au clavier, utilisé par Get_Immediate également
   Lanc : Un_Lancer; -- variable pour enregistrer le lancer des dés
   
   procedure Case_Est_Prison(N : Un_Num_Joueur) is -- action à réaliser quand un joueur tombe sur la case "Aller en prison"
   begin
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
	 
         Available := False;
	 
         while (not Available) and Ch /= 'o' and Ch /= 'n' loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre la question enoncée plus haut
	    Get_Immediate(Ch, Available);
         end loop;
	 
         if Ch = 'o' then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 elsif Ch = 'n' then
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
	 
         Available := False;
	 
         while (not Available) and Ch /= 'o' and Ch /= 'n' loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre la question enoncée plus haut
	    Get_Immediate(Ch, Available);
         end loop;
	 
         if Ch = 'o' then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 elsif Ch = 'n' then
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
	 
         Available := False;
	 
         while (not Available) and Ch /= 'o' and Ch /= 'n' loop -- demande au joueur d'appuyer sur 'o' ou 'n' pour répondre la question enoncée plus haut
	    Get_Immediate(Ch, Available);
         end loop;
	 
         if Ch = 'o' then
	    Ajouter_Argent(N, -Prix_Terrain(Plat(C))); -- retire le montant de l'achat du compte du joueur
	    L := Proprietes_Joueur(N) ;
	    Ajouter_Propriete(C, L); -- ajoute une propriété à la liste des propriétés du joueur ciblé
	 elsif Ch = 'n' then
	    Put("Il faut prendre des risques en affaires ! Demandez conseil à Antoine et montez votre start-up !");
         end if;
	 
      elsif Proprio /= N then -- cas où le terrain appartient à un autre joueur
	 
	 Montant := 25 *2**(Nb_Gares(Proprietes_Joueur(Proprio))-1) ;
	 
	 Put("Vous devez payer un loyer de " & Integer'Image(Montant) & " au joueur " & Integer'Image(Proprio));
	 Ajouter_Argent(N, -Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 Ajouter_Argent(Proprio, Loyer(Plat(C), Nb_Maisons_Propriete(Proprietes_Joueur(N), C)));
	 
      end if ;
      end Case_Est_Gare ;
      
	 
	 
      
   
begin
   
   while not Fin_Partie loop
      
      for N in Un_Num_Joueur loop
	 
	 Lanc := Lancer;
	   
	 if Trois_Tours(N) then -- on vérifie que le joueur n'a pas passé 3 tours en prison, sinon on le sort de prison
	   Sortir_De_Prison(N);
	   RAZ_Tour_Prison(N);
	 end if;
	   
	 if Est_En_Prison(N) then
	   
	    Put("Voulez-vous payer 50€ pour sortir de prison ? o/n");
	    
	    while (not Available) and Ch /= 'o' and Ch /= 'n' loop
	       Get_Immediate(Ch, Available);
            end loop;
      
            if Ch = 'o' then -- le joueur paie et sort de prison
	       Ajouter_Argent(N, -50);
	       Sortir_De_Prison(N);
	       RAZ_Tour_Prison(N);
	    elsif Ch = 'n' then -- le joueur ne paie pas et tente un double
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
	    
	 
	    if Passe_Depart(Pos_Prec, Position_Joueur(N)) and not Est_En_Prison(N) then -- teste si le joueur est passé par la case départ, s'il est en prison il ne doit pas toucher d'argent
	       Ajouter_Argent(N, 200);
	    end if;
	 
	    case Type_Case(Plat(Position_Joueur(N))) is -- analyse le type de la case sur la quelle le joueur est tombé
	       when Gare =>
	          null;
	       when Service =>
	          null;
	       when Rue =>
	          Case_Est_Rue;
	       when Prison =>
	          Case_Est_Prison;
	       when Place =>
	          null;
	       when Pioche =>
	          null;
	       when Taxe =>
	          null;
	    end case;
	    
	 end if;
	 
      end loop;
      
   end loop;
   
end Main;
