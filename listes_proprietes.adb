package body Listes_Proprietes is
   
   function Possede_Propriete(L : Liste_Proprietes ; C : Numero_Case) return Boolean is
   begin
     return True;
   end Possede_Propriete;
   
   procedure Ajouter_Propriete(L : in out Liste_Proprietes) is
   begin
      null;
   end Ajouter_Propriete;

   procedure Supprimer_Propriete(L : in out Liste_Proprietes) is
   begin
      null;
   end Supprimer_Propriete;

   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison is
   begin
      return 0;
   end Nb_Maisons_Propriete;

end Listes_Proprietes;
