with Un_Plateau, Des_Cases, Ada.Unchecked_Deallocation;
use Un_Plateau, Des_Cases ;

package Listes_Proprietes is
   
   
   Propriete_Non_Possedee, Liste_Proprietes_Vide : exception ;
   type Liste_Proprietes is private;
   
   
   
   subtype N_Maison is Natural range 0..5;
   
   procedure Init_Liste_Proprietes(L : in out Liste_Proprietes) ;
   
   function Possede_Propriete(L : Liste_Proprietes ; C : Numero_Case) return Boolean;
   
   procedure Ajouter_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes);
   
   procedure Supprimer_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes);
   
   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison;
   
   function Nb_Gares(L : Liste_Proprietes) return Natural ;
   
   function Nb_Rues_Meme_Couleur(L : Liste_Proprietes ; Col : Couleur_Case) return Natural ;
   
   function Nb_Compagnies(L : Liste_Proprietes) return Natural ;

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
