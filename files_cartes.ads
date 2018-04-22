with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Files_Cartes is
   
   type File_Cartes is limited private;
   type Une_Carte is private;
   type Un_Effet is private;
   type Un_Destinataire is private;
   
   procedure Melanger (F : in out File_Cartes) ;
   
   procedure Init(F : in out File_Cartes);
   
   procedure Tourner(F : in out File_Cartes ; C : out Une_Carte);
   
   function Titre_Carte(C : in Une_Carte) return String;
   
   function Description_Carte(C : in Une_Carte) return String;
   
   function Effet_Carte(C : in Une_Carte) return Un_Effet;
   
   function Montant_Carte(C : in Une_Carte) return Integer;
   
   function Destinataire_Carte(C : in Une_Carte) return Un_Destinataire;
   
private
   
   type Un_Effet is (Argent, Prison, Bouger, Aller_A, Hotel); --Effet de la carte
   
   type Un_Destinataire is (Banque, Autres_Joueurs, Aucun);

   type Une_Carte is record
         Titre : Ada.Strings.Unbounded.Unbounded_String;
         Description : Ada.Strings.Unbounded.Unbounded_String;
         Effet : Un_Effet;
         Montant : Integer;
	 Destinataire : Un_Destinataire; -- seulement si Effet=Argent
	                     -- Argent : Montant gagné (négatif si montant perdu)
	                     -- Prison : 0 sortie prison, 1 entrée prison
			     -- Bouger : nombre de cases dont on se déplace, négatif si on recule
			     -- Aller_A : numéro de la case à atteindre
   end record;
   
   Nb_Cartes : constant Positive := 32;
   
   type Tab_File is array(Integer range <>) of Une_Carte;
   
   subtype Indice_Tab is Natural range 0..Nb_Cartes-1;
   
   type File_Cartes is record
      Deb : Indice_Tab := 0;
      Tab : Tab_File(0..Nb_Cartes-1);
   end record;
   
end Files_Cartes;
