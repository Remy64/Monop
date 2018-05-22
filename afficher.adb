with GAda.Graphics, GAda.Advanced_Graphics, Un_Plateau, Des_Cases, Joueur, Listes_Proprietes;
use GAda.Graphics, GAda.Advanced_Graphics, Un_Plateau, Des_Cases, Joueur, Listes_Proprietes;

package body Afficher is
   
   procedure Init_Plateau is
   begin
      Put_Image(0, Cote_Plat, Image_Plateau); -- affiche l'image du plateau
      
      Put_Text(9*Cote_Plat/13, 14*Cote_Plat/26, "J1 = ", 10); -- légende joueur 1
      Put_Image(10*Cote_Plat/13, 14*Cote_Plat/26, Image_Maison_1);
      Disque(11*Cote_Plat/13, 14*Cote_Plat/26, 10, (255, 196, 33));
      
      Put_Text(9*Cote_Plat/13, 13*Cote_Plat/26, "J2 = ", 10); -- légende joueur 2
      Put_Image(10*Cote_Plat/13, 13*Cote_Plat/26, Image_Maison_2);
      Disque(11*Cote_Plat/13, 13*Cote_Plat/26, 10, (124, 110, 255));      
      
      Put_Text(9*Cote_Plat/13, 12*Cote_Plat/26, "J3 = ", 10); -- légende joueur 3
      Put_Image(10*Cote_Plat/13, 12*Cote_Plat/26, Image_Maison_3);
      Disque(11*Cote_Plat/13, 12*Cote_Plat/26, 10, (255, 0, 0));
      
      Put_Text(9*Cote_Plat/13, 11*Cote_Plat/26, "J4 = ", 10); -- légende joueur 4
      Put_Image(10*Cote_Plat/13, 11*Cote_Plat/26, Image_Maison_4);
      Disque(11*Cote_Plat/13, 11*Cote_Plat/26, 10, (7, 217, 0));
   end Init_Plateau;
   
   procedure Ajouter_Maisons(N : Integer ; J : Integer ; C : Integer) is
      X, Y : Natural;
   begin
      if C = 2 then X := 21*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 4 then X := 17*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 6 then X := 13*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 7 then X := 11*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 9 then X := 6*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 10 then X := 4*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      
      elsif C = 12 then X := 11*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
      elsif C = 13 then X := 11*Cote_Plat/104 ; Y := 7*Cote_Plat/26;
      elsif C = 14 then X := 11*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
      elsif C = 15 then X := 11*Cote_Plat/104 ; Y := 11*Cote_Plat/26;
      elsif C = 16 then X := 11*Cote_Plat/104 ; Y := 13*Cote_Plat/26;
      elsif C = 17 then X := 11*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
      elsif C = 19 then X := 11*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
      elsif C = 20 then X := 11*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
      
      elsif C = 22 then X := 4*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 24 then X := 8*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 25 then X := 11*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 26 then X := 13*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 27 then X := 15*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 28 then X := 17*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 29 then X := 19*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 30 then X := 21*Cote_Plat/26 ; Y := 93*Cote_Plat/104; 
      
      elsif C = 32 then X := 91*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
      elsif C = 33 then X := 91*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
      elsif C = 35 then X := 91*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
      elsif C = 36 then X := 91*Cote_Plat/104 ; Y := 13*Cote_Plat/26;
      elsif C = 38 then X := 91*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
      elsif C = 40 then X := 91*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
      end if;
      
      if J = 1 then 
	 Put_Image(X, Y, Image_Maison_1);
      elsif J = 2 then
	 Put_Image(X, Y, Image_Maison_2);
      elsif J = 3 then
	 Put_Image(X, Y, Image_Maison_3);
      elsif J = 4 then
	 Put_Image(X, Y, Image_Maison_4);
      end if;
      
      Put_Text(X, Y-5, " " & Integer'Image(N), 10);
   end Ajouter_Maisons;
   
   procedure Placer_Pions is
      X, Y : Natural;
      C : Numero_Case;
   begin
      for J in Un_Num_Joueur loop
	 C := Position_Joueur(J);
	 if C = 1 then X := 25*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 2 then X := 22*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 3 then X := 19*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 4 then X := 17*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 5 then X := 15*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 6 then X := 13*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 7 then X := 11*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 8 then X := 9*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 9 then X := 6*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 10 then X := 4*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 
	 elsif C = 11 then X := 4*Cote_Plat/104 ; Y := 2*Cote_Plat/26;
	 elsif C = 12 then X := 4*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
	 elsif C = 13 then X := 4*Cote_Plat/104 ; Y := 7*Cote_Plat/26;
	 elsif C = 14 then X := 4*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
	 elsif C = 15 then X := 4*Cote_Plat/104 ; Y := 11*Cote_Plat/26;
	 elsif C = 16 then X := 4*Cote_Plat/104 ; Y := 13*Cote_Plat/26;
	 elsif C = 17 then X := 4*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
	 elsif C = 18 then X := 4*Cote_Plat/104 ; Y := 17*Cote_Plat/26;
	 elsif C = 19 then X := 4*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
	 elsif C = 20 then X := 4*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
	 
	 elsif C = 21 then X := 2*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 22 then X := 4*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 23 then X := 6*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 24 then X := 9*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 25 then X := 11*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 26 then X := 13*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 27 then X := 15*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 28 then X := 17*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 29 then X := 19*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 30 then X := 22*Cote_Plat/26 ; Y := 100*Cote_Plat/104; 
	 
	 elsif C = 31 then X := 98*Cote_Plat/104 ; Y := 24*Cote_Plat/26;
	 elsif C = 32 then X := 98*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
	 elsif C = 33 then X := 98*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
	 elsif C = 34 then X := 98*Cote_Plat/104 ; Y := 17*Cote_Plat/26;
	 elsif C = 35 then X := 98*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
	 elsif C = 36 then X := 98*Cote_Plat/104 ; Y := 13*Cote_Plat/26;
	 elsif C = 37 then X := 98*Cote_Plat/104 ; Y := 11*Cote_Plat/26;
	 elsif C = 38 then X := 98*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
	 elsif C = 39 then X := 98*Cote_Plat/104 ; Y := 7*Cote_Plat/26;
	 elsif C = 40 then X := 98*Cote_Plat/104 ; Y := 4*Cote_Plat/26;
	 end if;
	 
         if J = 1 then 
	    Disque(X, Y, 10, (255, 196, 33));
	 elsif J = 2 then
	    Disque(X, Y, 10, (124, 110, 255));
	 elsif J = 3 then
	    Disque(X, Y, 10, (255, 0, 0));
	 elsif J = 4 then
	    Disque(X, Y, 10, (7, 217, 0));
	 end if;
      end loop;
   end Placer_Pions;
   
   procedure Actualiser_Plateau is
      L : Liste_Proprietes;
   begin
      Init_Plateau;
      Placer_Pions;
      for J in Un_Num_Joueur loop
   	 L := Proprietes_Joueur(J);
   	 while not Est_Vide(L) loop
	    Ajouter_Maisons(Nb_Maisons_Propriete(L, N_Case(L)), J, N_Case(L));
   	    L := Suiv(L) ;
   	 end loop;
      end loop;
   end Actualiser_Plateau;
   
begin
   
   Resize(Cote_Plat, Cote_Plat); -- crée et redimensionne la fenêtre
   
end Afficher;
