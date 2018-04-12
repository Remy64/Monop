with Ada.Text_IO ;
use Ada.Text_IO ;

package body Cases is
   
   function Nom_Case(C : Cases) return String is
      
   begin
      
      return C.Nom.all ;
      
   end Nom_Case ;
   
   function Prix_Terrain(C : Cases) return Natural is
      
   begin
      if C.Fonction =  Place or C.Fonction = Pioche or C.Fonction = Prison  then
	 raise Case_Non_Achetable ;
	 end if ;
      return C.Prix_Terrain ;
      
   end Prix_Terrain ;
   
   function Loyer(C : Cases ; N : N_Maison) return Natural is 
      
   begin
      
      return C.Loyer(N) ;
      
   exception 
      
      when Constraint_Error => Put_Line("Il ne peut y avoir qu'entre 0 et 5 maisons") ;
   end Loyer ;
   
   function Type_Case(C : Cases) return Fonction_Case is
      
   begin
      
      return C.Fonction ;
      
   end Type_Case ;
   
   function Couleur(C : Cases) return Couleur_Case is 
      
   begin
      
      return C.Couleur ;
      
   end Couleur ;
   
   function Achetable(C : Cases) return Boolean is
      
   begin
      
      return C.Fonction = Gare or C.Fonction = Service or C.Fonction = Rue ;
      
   end Achetable ;
   
   end Cases ;
   
      
   
   
   
