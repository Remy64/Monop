with Files_Cartes, Ada.Text_IO ;
use Files_Cartes, Ada.Text_IO ;

procedure Test_Files_Cartes is
   
   procedure Afficher(C : Une_Carte) is
      
   begin
      
      Put_Line(Titre_Carte(C)) ;
      New_Line ;
      Put_Line(Description_Carte(C)) ;
      New_Line ;
      Put_Line("Effet de la carte"&Un_Effet'Image(Effet_Carte(C))) ;
      New_Line ;
      Put_Line("Le montant :"&Integer'Image(Montant_Carte(C))) ;
      New_Line ;
      Put_Line("Destinataire :"&Un_Destinataire'Image(Destinataire_Carte(C))) ;
      
   end Afficher;
   
   procedure Afficher_Nom(C : Une_Carte) is
      
   begin
      
      Put_Line(Titre_Carte(C)) ;
      
   end Afficher_Nom ;
   
      
      
   procedure Afficher_Tous(F : in out File_Cartes)  is 
      
      C : Une_Carte ;
   begin
      
      for I in 1..32 loop 
      
      Tourner(F,C) ;
      Afficher(C) ;
      
      end loop ;
      
   end Afficher_Tous ;
   
      
   procedure Afficher_Tous_Noms(F : in out File_Cartes) is 
      
      C : Une_Carte ;
      
   begin
      
      
      
	 for I in 1..32 loop 
	    
	    Tourner(F, C) ;
	    Afficher_Nom(C) ;
	    
	 end loop ;
	 
   end Afficher_Tous_Noms ;

	 
   
   F : File_Cartes ;
   
   
begin
   
   Init(F) ;
   Melanger(F) ;
   Put_Line("Melange n°1 : ") ;
   Afficher_Tous_Noms(F) ;
   New_Line ;
   New_Line ;
   Melanger(F) ;
   Put_Line("Melange n°2 : ") ;
   Afficher_Tous_Noms(F) ;
   
end Test_Files_Cartes ;
