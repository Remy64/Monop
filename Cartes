package Cartes is
   Nb_Cartes : constant Positive := 50 ;
   
   type Un_Effet is (Argent, Prison, Bouger) ;
   
   type Une_Carte is record
      Titre : String ;
      Description : String ;
      Effet : Un_Effet ;
      Montant : Integer ;
   end record ;
   
   type Pile_De_Cartes is array 1..Nb_Cartes of Une_Carte ;
   
   Pile : Pile_De_Cartes ;
     
   procedure Passer_Dessous(Pile : in out Pile_De_Cartes) ;
   function Piocher_Carte(Pile : in Pile_De_Cartes) ;
   
end Cartes ;
