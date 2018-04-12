with Ada.Text_IO ;
with Ada.Numerics.Discrete_Random ;

package body Des is
     
   package Txt renames Ada.Text_IO ;
   package Lancer_Aleatoire is new Ada.Numerics.Discrete_Random(Valeur_De) ;
   
   Generateur : Lancer_Aleatoire.Generator ;
   
   function Lancer_Un_De return Valeur_De is 
      
      Resultat : Valeur_De ;
   begin
      
      Resultat := Lancer_Aleatoire.Random(Generateur) ;
      
      return Resultat ;
      
   end Lancer_Un_De ;
     
   
   function Lancer return Un_Lancer is
      
      A : Valeur_De ;
      B : Valeur_De ;
      
   begin
      
      A := Lancer_Un_De ;
      B := Lancer_Un_De ;
      
      return (A+B, A=B) ;
      
      end Lancer ;
      
      
  begin    
     
Lancer_Aleatoire.Reset(Generateur) ;
   
end Des ;
