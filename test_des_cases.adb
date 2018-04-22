with Ada.Text_IO, Des_Cases;
use Ada.Text_IO, Des_Cases;

procedure Test_Des_Cases is
   
   C : Cases ;
   
begin
   
   C := Creer_Case("Case_test", 250, 25, (1, 1, 2, 3, 4, 5), Gare, (255, 255, 255)) ;
   
   Put_Line("Nom de la case : "&Nom_Case(C)) ;
   Put_Line("Prix du terrain :"&Natural'Image(Prix_Terrain(C))) ;
   Put_Line("Loyers du Terrain : Terrain nu"&Natural'Image(Loyer(C, 0)));
   Put_Line("1 Maison : "&Natural'Image(Loyer(C,1)));
   Put_Line("2 Maisons : "&Natural'Image(Loyer(C,2)));
   Put_Line("3 Maisons : "&Natural'Image(Loyer(C,3)));
   Put_Line("4 Maisons : "&Natural'Image(Loyer(C,4)));
   Put_Line("1 Hotel : "&Natural'Image(Loyer(C,5)));
   Put_Line("Type de la case : "&Fonction_Case'Image(Type_Case(C))) ;
   Put_Line("Couleur de la case :"&Natural'Image(Couleur(C).R)&Natural'Image(Couleur(C).G)&Natural'Image(Couleur(C).B)) ;
   
   Put_Line("Achetable ? :"&Boolean'Image(Achetable(C))) ; 
   
   end Test_Des_Cases ;
