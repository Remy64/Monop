with Ada.Text_IO;
use Ada.Text_IO;

package body Files_Cartes is
   
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
