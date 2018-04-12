package Files_Cartes is
   
   type File_Cartes is limited private;
   
   Erreur_File_Vide, Erreur_File_Pleine : exception;
   
   procedure Init(F : in out File_Cartes); -- procédure de lecture du txt et d'initialisation
   
   procedure Tourner(F : in out File_Cartes, C : out Carte);
   
private
   
   Longueur_Max : constant Positive := 50;
   
   type Tab_File is array(Integer range <>) of Integer;
   
   type File_Cartes is record
      Deb : Natural := 0;
      Tab : Tab_File(0..Longueur_Max-1);
   end record;
   
end Files_Cartes;
