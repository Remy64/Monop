with Des_Cases ;
use Des_Cases ;

package Un_Plateau is
   
   
   type Plateau is limited private ;
   

  
   procedure Initialiser(P : in out Plateau) ; -- permet d'initialiser le plateau avec tous les joueurs sur la case dÃ©part
   
   
private 
   
   Nb_Rue : constant Positive := 40 ;
   type Plateau is array( 1..Nb_Rue) of Cases ; -- dÃ©finit un tableau composÃ© des 36 cases du plateau (le type "Cases" est dÃ©fini dans le paquetage "Cases")
end Un_Plateau ;
