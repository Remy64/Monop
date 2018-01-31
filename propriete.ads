package Proprietes is
   type L_Proprietes
   type P_Proprietes is access L_Proprietes ;
   type L_Proprietes is record
      Proprietes : Proprietes ;
      Suivant : P_Proprietes ;
   end record ;
   
   procedure Affecter_Propriete(C : Une_Case, J : Joueur) ;
   procedure Marquer_Hypotheque(C : Une_Case, J : Joueur) ;
   
   
end Proprietes ;
