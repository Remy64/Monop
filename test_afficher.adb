with Afficher, Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;
use Afficher, Ada.Text_IO, Des, Des_Cases, Files_Cartes, Joueur, Listes_Proprietes, Un_Plateau;

procedure Test_Afficher is
begin
   Init_Joueurs;
   
   Actualiser_Plateau;
   
   Atteindre_Position(1, 35);
   Atteindre_Position(2, 25);
   Atteindre_Position(3, 15);
   Atteindre_Position(4, 5);
   
   Ajouter_Propriete_Joueur(1, 2);
   Ajouter_Propriete_Joueur(1, 4);
   Ajouter_Propriete_Joueur(2, 7);
   Ajouter_Propriete_Joueur(4, 40);
   
   Ajouter_Enlever_Maison(True, 7, Proprietes_Joueur(2));
   Ajouter_Enlever_Maison(True, 7, Proprietes_Joueur(2));
   Ajouter_Enlever_Maison(True, 4, Proprietes_Joueur(1));
   
   delay 3.0;
   Actualiser_Plateau;
   
   Ajouter_Propriete_Joueur(3, 38);
   Ajouter_Enlever_Maison(True, 7, Proprietes_Joueur(2));
   
   delay 3.0;
   Actualiser_Plateau;
   
   Afficher_Texte(5*Cote_Plat/13, 9*Cote_Plat/13, Boolean'Image(Choix_Binaire("Voilà.")));
   
end Test_Afficher;
