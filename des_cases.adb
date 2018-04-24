with Ada.Text_IO ;
use Ada.Text_IO ;

package body Des_Cases is
   
   
   
   function Creer_Case(Nom : String; Prix_Terrain : Natural; Prix_Maison : Positive; Loyer : Loyers; Fonction : Fonction_Case; Couleur : Couleur_Case) return Cases is
      C : Cases ;
   begin
      
      C.Nom := new String'(Nom) ;
      C.Prix_Terrain := Prix_Terrain ;
      C.Prix_Maison := Prix_Maison ;
      C.Loyer := Loyer ;
      C.Fonction := Fonction ;
      C.Couleur := Couleur ;
      return C ;
      end Creer_Case ;
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
      
      if C.Fonction /= Rue then raise Case_Sans_Couleur ;
      end if ;
      
      return C.Couleur ;
      
   end Couleur ;
   
   function Achetable(C : Cases) return Boolean is
      
   begin
      
      return C.Fonction = Gare or C.Fonction = Service or C.Fonction = Rue ;
      
   end Achetable ;
   
   end Des_Cases ;
   
      
   
   
   
