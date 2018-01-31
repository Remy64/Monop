package Joueur is
   subtype Positive in 1..40
   Nb_Rues : constant Positive := 28 ;
   type T_Proprietes is array 1..Nb_Rues of Cases ;
   type Un_Pion is record
      
      Compte : Natural ;
      Proprietes : T_Proprietes ;
   end record ;
   
     
     
end Joueur ;
