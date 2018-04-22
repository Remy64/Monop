with Ada.Text_IO, Des_Cases, Un_Plateau ;
use Ada.Text_IO, Des_Cases, Un_Plateau;

procedure Test_Plateau is
   
   procedure Afficher_Case(N : Numero_Case) is
      
   begin
      
      Put_Line("-------------------------------------------------");
      Put_Line("Case n°"&Positive'Image(N)&" :") ;
      Put_Line("Nom :"&Nom_Case(Plat(N)));
      New_Line ;
      Put_Line("Prix_Terrain :"&Natural'Image(Prix_Terrain(Plat(N))));
      New_Line ;
      Put_Line("Loyers : Terrain nu :"&Natural'Image(Loyer(Plat(N), 0))) ;
      Put_Line("1 maison : "&Natural'Image(Loyer(Plat(N), 1))) ;
      Put_Line("2 maisons : "&Natural'Image(Loyer(Plat(N), 2))) ;
      Put_Line("3 maisons : "&Natural'Image(Loyer(Plat(N), 3))) ;
      Put_Line("4 maisons : "&Natural'Image(Loyer(Plat(N), 4))) ;
      Put_Line("1 hotel : "&Natural'Image(Loyer(Plat(N), 5))) ;
      New_Line ;
      Put_Line("Type de la case :"&Fonction_Case'Image(Type_Case(Plat(N)))) ;
      New_Line ;
      Put_Line("Couleur: "&RGB'Image(Couleur(Plat(N)).R)&RGB'Image(Couleur(Plat(N)).G)&RGB'Image(Couleur(Plat(N)).B)) ;
      New_Line ;
      Put_Line("Achetable ? : "&Boolean'Image(Achetable(Plat(N)))) ;
      
   exception
      
      when Case_Non_Achetable => Put_Line("La case n'est pas achetable") ;
      when Case_Sans_Couleur => Put_Line("La case n'a pas de couleur") ;
	 
      
   end Afficher_Case ;
   
begin
   for N in Numero_Case loop
      Afficher_Case(N) ;
   end loop ;
   
end Test_Plateau ;
  
  
  
  
  
  
