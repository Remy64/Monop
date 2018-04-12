with Plateau;
use Plateau;

package Listes_Proprietes is
   type Liste_Proprietes is private;
   
   function Possede_Propriete(L : Liste_Proprietes, C : Numero_Case) return Boolean;
   
   procedure Ajouter_Propriete(L : in out Liste);
   
   procedure Supprimer_Propriete(L : in out Liste);
   
   function Nb_Maisons_Propriete(L : Liste_Propriete, C : Numero_Case) return N_Maison;

private
   type Cellule;
   type Liste_Proprietes is access Cellule;
   
   type Une_Propriete is record
      Num_Case : Numero_Case;
      Nb_Maisons : Un_Nb_Maisons;
      Hypotheque : Boolean;
   end record;
   
   type Cellule is record
      Propriete : Une_Propriete;
      Suiv : Liste_Proprietes;
   end record;
   
end Listes_Proprietes;
