with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

package body Files_Cartes is
   
   package Tirage_Aleatoire is new Ada.Numerics.Discrete_Random(Indice_Tableau) ;
   use Tirage_Aleatoire ;
   
   Generateur : Generator ;
   
   
   
   procedure Melanger(F : in out File_Cartes) is
      
      Auxi : Carte ;
      Alea : Indice_Tableau ;
   begin
      
      for I in F.Tab'Range loop
	 Alea := Random(Generateur) ;
	 Auxi := F.Tab(I) ;
	 F.Tab(I) := F.Tab(Alea) ;
	 F.Tab(Alea) := F.Tab(Auxi) ;
      end loop ;
      
      end Melanger ;
	 
      
      
      
      
      
   
   procedure Init(F : in out File_Cartes) is
   begin
      -- à modifier avec "Open" et un txt
      null;
   end Init;
   
   procedure Tourner(F : in out File_Cartes ; C : out Carte) is
   begin
      C := F.Tab(F.Deb);
      if F.Deb = F.Tab'Last then
	 F.Deb := 0;
      else
	 F.Deb := F.Deb+1;
      end if;
   end Tourner;
   
end Files_Cartes;
