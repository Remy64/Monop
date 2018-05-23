with GAda.Advanced_Graphics;
use GAda.Advanced_Graphics;

package Afficher is
   
   Image_Plateau : constant Image := Load_Image("plateau.jpg");
   Cote_Plat : constant Integer := Largeur_Image(Image_Plateau);
   Image_Maison_1 : constant Image := Load_Image("maison_1.png");
   Image_Maison_2 : constant Image := Load_Image("maison_2.png");
   Image_Maison_3 : constant Image := Load_Image("maison_3.png");
   Image_Maison_4 : constant Image := Load_Image("maison_4.png");
   
   procedure Init_Plateau;
   
   procedure Ajouter_Maisons(N : Integer ; J : Integer ; C : Integer);
   
   procedure Placer_Pions;
   
   procedure Actualiser_Plateau;
   
   function Choix_Binaire(M : String) return Boolean;
   
end Afficher;
