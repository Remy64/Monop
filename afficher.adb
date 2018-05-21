with GAda.Graphics, GAda.Advanced_Graphics; --, Des_Cases, Joueur, Liste_Proprietes;
use GAda.Graphics, GAda.Advanced_Graphics; --, Des_Cases, Joueur, Liste_Proprietes;

procedure Afficher is
   
   Image_Plateau : constant Image := Load_Image("plateau.jpg");
   Cote_Plat : constant Integer := Largeur_Image(Image_Plateau);
   Image_Maison_1 : constant Image := Load_Image("maison_1.png");
   Image_Maison_2 : constant Image := Load_Image("maison_2.png");
   Image_Maison_3 : constant Image := Load_Image("maison_3.png");
   Image_Maison_4 : constant Image := Load_Image("maison_4.png");
   
   procedure Init_Plateau is
   begin
      Resize(Cote_Plat, Cote_Plat);
      Put_Image(0, Cote_Plat, Image_Plateau);
      Put_Text(9*Cote_Plat/13, 14*Cote_Plat/26, "J1 = ", 10);
      Put_Image(10*Cote_Plat/13, 14*Cote_Plat/26, Image_Maison_1);
      Put_Text(9*Cote_Plat/13, 13*Cote_Plat/26, "J2 = ", 10);
      Put_Image(10*Cote_Plat/13, 13*Cote_Plat/26, Image_Maison_2);
      Put_Text(9*Cote_Plat/13, 12*Cote_Plat/26, "J3 = ", 10);
      Put_Image(10*Cote_Plat/13, 12*Cote_Plat/26, Image_Maison_3);
      Put_Text(9*Cote_Plat/13, 11*Cote_Plat/26, "J4 = ", 10);
      Put_Image(10*Cote_Plat/13, 11*Cote_Plat/26, Image_Maison_4);
   end Init_Plateau;
   
   procedure Ajouter_Maisons(N : Integer ; J : Integer ; C : Integer) is
      X, Y : Integer;
   begin
      if C = 2 then X := 21*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 4 then X := 17*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 7 then X := 11*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 9 then X := 6*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      elsif C = 10 then X := 4*Cote_Plat/26 ; Y := 13*Cote_Plat/104;
      
      elsif C = 12 then X := 11*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
      elsif C = 14 then X := 11*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
      elsif C = 15 then X := 11*Cote_Plat/104 ; Y := 11*Cote_Plat/26;
      elsif C = 17 then X := 11*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
      elsif C = 19 then X := 11*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
      elsif C = 20 then X := 11*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
      
      elsif C = 22 then X := 4*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 24 then X := 8*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 25 then X := 11*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 27 then X := 15*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 28 then X := 17*Cote_Plat/26 ; Y := 93*Cote_Plat/104;
      elsif C = 30 then X := 21*Cote_Plat/26 ; Y := 93*Cote_Plat/104; 
      
      elsif C = 32 then X := 91*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
      elsif C = 33 then X := 91*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
      elsif C = 35 then X := 91*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
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
      X, Y : Integer;
      C : Integer; --C : N_Rue;
   begin
      for J in 1..4 loop
	 C := 10*J; --C := Position_Joueur(J);
	 if C = 2 then X := 21*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 4 then X := 17*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 7 then X := 11*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 9 then X := 6*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 elsif C = 10 then X := 4*Cote_Plat/26 ; Y := 6*Cote_Plat/104;
	 
	 elsif C = 12 then X := 4*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
	 elsif C = 14 then X := 4*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
	 elsif C = 15 then X := 4*Cote_Plat/104 ; Y := 11*Cote_Plat/26;
	 elsif C = 17 then X := 4*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
	 elsif C = 19 then X := 4*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
	 elsif C = 20 then X := 4*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
	 
	 elsif C = 22 then X := 4*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 24 then X := 8*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 25 then X := 11*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 27 then X := 15*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 28 then X := 17*Cote_Plat/26 ; Y := 100*Cote_Plat/104;
	 elsif C = 30 then X := 21*Cote_Plat/26 ; Y := 100*Cote_Plat/104; 
	 
	 elsif C = 32 then X := 98*Cote_Plat/104 ; Y := 22*Cote_Plat/26;
	 elsif C = 33 then X := 98*Cote_Plat/104 ; Y := 20*Cote_Plat/26;
	 elsif C = 35 then X := 98*Cote_Plat/104 ; Y := 15*Cote_Plat/26;
	 elsif C = 38 then X := 98*Cote_Plat/104 ; Y := 9*Cote_Plat/26;
	 elsif C = 40 then X := 98*Cote_Plat/104 ; Y := 5*Cote_Plat/26;
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
   
   
   
begin
   Init_Plateau;
   Ajouter_Maisons(0, 1, 2);
   Ajouter_Maisons(0, 2, 4);
   Ajouter_Maisons(0, 3, 7);
   Ajouter_Maisons(0, 4, 9);
   Ajouter_Maisons(0, 1, 10);
   Ajouter_Maisons(1, 1, 12);
   Ajouter_Maisons(0, 1, 14);
   Ajouter_Maisons(0, 1, 15);
   Ajouter_Maisons(3, 1, 17);
   Ajouter_Maisons(0, 1, 19);
   Ajouter_Maisons(0, 1, 20);
   Ajouter_Maisons(0, 1, 22);
   Ajouter_Maisons(5, 1, 24);
   Ajouter_Maisons(0, 1, 25);
   Ajouter_Maisons(0, 1, 27);
   Ajouter_Maisons(0, 1, 28);
   Ajouter_Maisons(0, 1, 30);
   Ajouter_Maisons(0, 1, 32);
   Ajouter_Maisons(0, 1, 33);
   Ajouter_Maisons(0, 1, 35);
   Ajouter_Maisons(0, 1, 38);
   Ajouter_Maisons(0, 1, 40);
   
   Placer_Pions;
end Afficher;
