package Joueur is
   subtype Positive in 1..40
   Numero_Joueur : Positive ;
   type T_Proprietes is array 1..Nb_Rues of Cases ;
   type Un_Pion is record
      Compte : Natural ;
      Proprietes : T_Proprietes ;
   end record ;
   
     
     
end Joueur ;
