with Des_Cases ;
use Des_Cases ;

package Un_Plateau is
   
   
   type Plateau is limited private ;
   
   Nb_Rue : constant Positive := 40 ;
   subtype Numero_Case is Positive range 1..Nb_Rue ; 
   

  
   function Plat(N : Numero_Case) return Cases ;
   
   
private 
   
   
   type Plateau is array( Numero_Case) of Cases ; -- dÃ©finit un tableau composÃ© des 36 cases du plateau (le type "Cases" est dÃ©fini dans le paquetage "Cases")
end Un_Plateau ;
