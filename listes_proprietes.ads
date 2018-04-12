package Listes_Proprietes is
   type Liste_Proprietes is private;
   subtype Numero_Case is Positive range 1..36;
   subtype N_Maison is Natural range 0..5;
   
   function Possede_Propriete(L : Liste_Proprietes ; C : Numero_Case) return Boolean;
   
   procedure Ajouter_Propriete(L : in out Liste_Proprietes);
   
   procedure Supprimer_Propriete(L : in out Liste_Proprietes);
   
   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison;

private
   type Cellule;
   type Liste_Proprietes is access Cellule;
   
   type Une_Propriete is record
      Num_Case : Numero_Case;
      Nb_Maisons : N_Maison;
      Hypotheque : Boolean;
   end record;
   
   type Cellule is record
      Propriete : Une_Propriete;
      Suiv : Liste_Proprietes;
   end record;
   
end Listes_Proprietes;
