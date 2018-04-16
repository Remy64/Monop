with Carte;
use Carte ;

package Files_Cartes is
   
   type File_Cartes is limited private;
   
   Erreur_File_Vide, Erreur_File_Pleine : exception;
   
   Longueur_Max : constant Positive := 50 ;
   
   subtype Indice_Tableau is Natural range 0..(Longueur_Max-1) ;
   
   procedure Melanger (F : in out File_Cartes) ; -- melange la file de carte
   
   procedure Init(F : in out File_Cartes); -- procédure de lecture du txt et d'initialisation
   
   procedure Tourner(F : in out File_Cartes; C : out Une_Carte);
   
private
   
   
   
   type Tab_File is array(Indice_Tableau) of Une_Carte;
   
   type File_Cartes is record
      Deb : Natural := 0;
      Tab : Tab_File ;
   end record;
   
end Files_Cartes;
