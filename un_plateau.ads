with Des_Cases;
use Des_Cases;

package Un_Plateau is
   
   type Plateau is limited private;
   
   Nb_Rues : constant Positive := 40;
   
   subtype Un_Num_Rue is Positive range 1..Nb_Rues;

   procedure Initialiser(P : in out Plateau); -- permet d'initialiser le plateau avec tous les joueurs sur la case dÃ©part
   
   function Obtenir_Case(N : Un_Num_Rue) return Cases;
   
private
   
   type Plateau is array( 1..Nb_Rues) of Cases; -- dÃ©finit un tableau composÃ© des 36 cases du plateau (le type "Cases" est dÃ©fini dans le paquetage "Cases")
   
   P : Plateau;
   
end Un_Plateau;
