package Plateau is

   subtype Numero_Case is Positive in 1..36 ;
   type Plateau is array 1..36 of Cases ;
   procedure Bouger(N : Integer, J : Joueur) ;
   procedure Aller_A(N : Numero_Case, J : Joueur) ;
   procedure Initialiser ;
   

   
end Plateau ;
