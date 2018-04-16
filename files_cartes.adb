with Ada.Strings.Unbounded, Ada.Numerics.Discrete_Random;
use Ada.Strings.Unbounded;
package body Files_Cartes is
   
   function TUS(S : String) return Unbounded_String renames To_Unbounded_String;
   
   package Tirage_Aleatoire is new Ada.Numerics.Discrete_Random(Indice_Tab) ;
   use Tirage_Aleatoire ;
   
   Generateur : Generator ;
   
   procedure Melanger(F : in out File_Cartes) is
      Auxi : Une_Carte ;
      Alea : Indice_Tab ;
   begin
      for I in F.Tab'Range loop
	 Alea := Random(Generateur) ;
	 Auxi := F.Tab(I) ;
	 F.Tab(I) := F.Tab(Alea) ;
	 F.Tab(Alea) := Auxi ;
      end loop ;
   end Melanger;
   
   procedure Init(F : in out File_Cartes) is
   begin
      F.Tab(F.Deb) := (TUS("Oups !"), TUS("Vous êtes libéré de prison. Cette carte peut être conservée jusqu'à ce qu'elle soit utilisée ou vendue"), Prison, 0, Aucun);
      F.Tab(F.Deb+1) := (TUS("Un nouveau prof"), TUS("L'Université vous recrute pour donner un cours, recevez 10 euros."), Argent, 10, Banque);
      F.Tab(F.Deb+2) := (TUS("Les aléas du GMM"), TUS("Vous avez été convoqué dans le bureau de Loïc Lacouture(Prison) car vous avez eu un malus en mathématiques. Ne passez pas par la case départ, ne recevez pas 200 euros."), Prison, 1, Aucun);
      F.Tab(F.Deb+3) := (TUS("Les aléas du GEI"), TUS("Alors que vous vous promenez dans le GEI, attiré par la chaleur des serveurs, vous voyez une salle entrouverte et vous découvrez la joie d'assiter à un cours donné par Michel Castan.Vous rentrez en grave dépression et payez 500 euros pour le psychiatre"), Argent, -500, Banque);
      F.Tab(F.Deb+4) := (TUS("Logement"), TUS("Recevez 50 euros de dédommagement pour un logement de médiocre qualité"), Argent, 50, Banque);
      F.Tab(F.Deb+5) := (TUS("Revenu"), TUS("Recevez votre revenu annuel de 100 euros"), Argent, 100, Banque);
      F.Tab(F.Deb+6) := (TUS("Renouvellement"), TUS("Vous devez renouveler votre matériel, payer 15 euros."), Argent, -15, Banque);
      F.Tab(F.Deb+7) := (TUS("Déplacement"), TUS("Rendez-vous à l'Avenue Henri-Martin. Si vous passez par la case départ, recevez 200 euros."), Aller_A, 25, Aucun);
      F.Tab(F.Deb+8) := (TUS("Un nouveau président"), TUS("Vous avez été président du conseil d'administration. Versez 50 eursos à chaque joueur."), Argent, -50, Autres_Joueurs);
      F.Tab(F.Deb+9) := (TUS("On aura tout vu"), TUS("La banque vous reverse un dividende de 50 euros"), Argent, 50, Banque);
      F.Tab(F.Deb+10) := (TUS("Vous aimez les trains"), TUS("Avancez jusqu'à la gare Saint-Lazare. Si elle n'appartient à personne, vous pouvez l'acheter auprès de la Banque. Si elle appartient déjà à un autre joueur, payez le loyer dû."), Aller_A, 36, Aucun);
      F.Tab(F.Deb+11) := (TUS("Freine Jamy, Freine !"), TUS("Amende pour excès de vitesse : payer 15 euros."), Argent, -15, Banque);
      F.Tab(F.Deb+12) := (TUS("Quelle chance !"), TUS("Rendez-vous à la rue de la paix"), Aller_A, 40, Aucun);
      F.Tab(F.Deb+13) := (TUS("Et ça repart !"), TUS("Avancez jusqu'à la case départ (recevez 200 euros)"), Aller_A, 1, Aucun);
      F.Tab(F.Deb+14) := (TUS("Les eaux, toujours les eaux"), TUS("Avancez jusqu'à la compagnie de distribution des eaux. Si elle n'appartient à personne, vous pouvez l'acheter auprès de la Banque. Si elle appartient déjà à un autre joueur, payez le montant dû."), Aller_A, 29, Aucun);
      F.Tab(F.Deb+15) := (TUS("Viste touristique de la capitale"), TUS("Avancez au bouleveard de la villette. Si vous passez par la case départ, recevez 200 euros."), Aller_A, 12, Aucun);
      F.Tab(F.Deb+16) := (TUS("Le temps c'est de l'argent"), TUS(" Votre immeuble et votre prêt rapportent. Vous devez toucher 150 euros."), Argent, 150, Banque);
      F.Tab(F.Deb+17) := (TUS("Vous adorez les trains"), TUS("Allez à la gare montparnasse. Si vous passez par la case départ, recevez 200 euros."), Aller_A, 6, Aucun);
      F.Tab(F.Deb+19) := (TUS("Oups !"), TUS("Vous avez une colle de maths avec Loïc Lactouture. Vous échouez lamentablement et êtes donc convoqué dans le bureau de Loïc Lacouture pour une sanction appropriée. Ne passez pas par la case départ. Ne gagnez pas 200 euros."), Prison, 1, Aucun);
      F.Tab(F.Deb+20) := (TUS("Une bonne affaire"), TUS("La vente de votre stock de cocaïne vous rapporte 50 euros."), Argent, 50, Banque);
      F.Tab(F.Deb+21) := (TUS("Une malencontreuse visite du GEI"), TUS("Vous vous baladez par hasard au GEI et tomber sur Michel Castan qui souhaite vous apprendre le lilas. Vous prenez peur et tentez de fuir en sautant par la fenêtre du 1er étage. Vous vous foulez la cheville et devez payer la visite chez le médecin 50 euros."), Argent, -50, Banque);
      F.Tab(F.Deb+22) := (TUS("Héritage"), TUS("Votre cousin Maurice meurt et vous lègue 100 euros."), Argent, 100, Banque);
      F.Tab(F.Deb+23) := (TUS("On aura vraiment tout vu"), TUS("Votre assurance vie vous rapporte 100 euros."), Argent, 100, Banque);
      F.Tab(F.Deb+24) := (TUS("Un bon placement"), TUS("Votre investissement dans l'entreprise HyperLoop vous rapporte grâce au bon fonctionnement de la ligne Toulouse-Montpellier"), Argent, 100, Banque);
      F.Tab(F.Deb+25) := (TUS("Macronpital"), TUS("Vous vous êtes fracturé le cerveau en maths-algo et avez besoin d'être hospitalisé. Malheureusement, depuis les récentes réformes d'Emmanuel Macron, vous devez payer intégralement vos frais d'hospitalisation c'est-à-dire 200 euros."), Argent, -200, Banque);
      F.Tab(F.Deb+26) := (TUS("Erreur dans les impôts"), TUS("Les impôts se sont trompés et vous remboursent 20 euros."), Argent, 20, Banque);
      F.Tab(F.Deb+27) := (TUS("Joyeux Anniversaire !"), TUS("C'est votre anniversaire : chaque joueur doit vous donner 10 euros."), Argent, 10, Autres_Joueurs);
      F.Tab(F.Deb+28) := (TUS("Commission d'expert immobilier"), TUS("Vos terrains sont bien entretenus, vous recevez 25 euros car vous êtes un exemple."), Argent, 25, Banque);
      F.Tab(F.Deb+29) := (TUS("Payer pour étudier"), TUS("Depuis les récentes réformes de Jupiter mi-Raptor mi-Jésus, vous devez payer l'école maternelle de vos enfants c'est-à-dire 200 euros."), Argent, -200, Banque);
   end Init;
   
   procedure Tourner(F : in out File_Cartes ; C : out Une_Carte) is
   begin
      C := F.Tab(F.Deb);
      F.Deb := (F.Deb+1) mod Nb_Cartes;
   end Tourner;
   
   function Titre_Carte(C : in Une_Carte) return String is
   begin
      return Ada.Strings.Unbounded.To_String(C.Titre);
   end Titre_Carte;
   
   function Description_Carte(C : in Une_Carte) return String is
   begin
      return Ada.Strings.Unbounded.To_String(C.Description);
   end Description_Carte;

   function Effet_Carte(C : in Une_Carte) return Un_Effet is
   begin
      return C.Effet;
   end Effet_Carte;

   function Montant_Carte(C : in Une_Carte) return Integer is
   begin
      return C.Montant;
   end Montant_Carte;

   function Destinataire_Carte(C : in Une_Carte) return Un_Destinataire is
   begin
      return C.Destinataire;
   end Destinataire_Carte;
   
end Files_Cartes;
