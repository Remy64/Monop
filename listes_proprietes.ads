with Un_Plateau, Des_Cases, Ada.Unchecked_Deallocation;
use Un_Plateau, Des_Cases ;

package Listes_Proprietes is
   
   
   Propriete_Non_Possedee, Liste_Proprietes_Vide, Couleur_Inexistante : exception ;
   type Liste_Proprietes is private;
   
   
   
   
   procedure Init_Liste_Proprietes(L : in out Liste_Proprietes) ;
   
   
   function Est_Vide(L : in Liste_Proprietes) return Boolean ;
   
   function Suiv(L : in Liste_Proprietes) return Liste_Proprietes ;
   
   function Possede_Propriete(C : in Numero_Case ; L : in Liste_Proprietes) return Boolean;
   
   procedure Ajouter_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes);
   
   procedure Supprimer_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes);
   
   procedure Ajouter_Enlever_Maison(Aj : in Boolean ; C : in Numero_Case ; L : in  Liste_Proprietes) ;
   
   procedure Hypothequer_Desypothequer_Propriete(Hyp : in Boolean; C : in Numero_Case ; L : in out Liste_Proprietes) ;
   
   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison;
   
   function N_Maisons(L : Liste_Proprietes) return N_Maison ;
   
   function N_Case(L : Liste_Proprietes) return Numero_Case ;
   
   function Hypo(L : Liste_Proprietes ; C : Numero_Case) return Boolean ;
   
   function Nb_Gares(L : Liste_Proprietes) return Natural ;
   
   function Nb_Rues_Meme_Couleur(L : Liste_Proprietes ; Col : Couleur_Case) return Natural ;
   
   function Nb_Compagnies(L : Liste_Proprietes) return Natural ;
   
   function Case_Presente(L : Liste_Proprietes ; C : Numero_Case) return Boolean;
   
   function Couleur_Complete(L : Liste_Proprietes ; Col : Couleur_Case) return Boolean;

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
   
   procedure Free is new Ada.Unchecked_Deallocation(Cellule, Liste_Proprietes);
end Listes_Proprietes;
