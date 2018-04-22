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
      F.Tab(F.Deb+1) := (TUS("Excès de vitesse"), TUS("Amende pour excès de vitesse : Payez 15"), Argent, -15, Banque);
      F.Tab(F.Deb+2) := (TUS("Retour sur investissement"), TUS("La banque vous verse un dividende de 50"), Argent, 50, Banque);
      F.Tab(F.Deb+3) := (TUS("Réparation de voirie"), TUS("Vous êtes imposé pour les reparations de voirie a raison de : 40 par maison et 115 par hotel"), Hotel, 1, Aucun);
      F.Tab(F.Deb+4) := (TUS("Départ"), TUS("Avancez jusqu'à la case départ"), Aller_A, 1, Aucun);
      F.Tab(F.Deb+5) := (TUS("Frais de scolarite"), TUS("Payez les frais de scolarité : 150"), Argent, -150, Banque);
      F.Tab(F.Deb+6) := (TUS("Rue de la Paix"), TUS("Rendez-vous rue de la paix"), Aller_A, 40, Aucun);
      F.Tab(F.Deb+7) := (TUS("Henri-Martin"), TUS("Rendez-vous à l'Avenue Henri-Martin. Si vous passez par la case départ, recevez 200 euros."), Aller_A, 25, Aucun);
      F.Tab(F.Deb+8) := (TUS("Réparations"), TUS("Faites des réparations dans toutes vos maisons : 25 par maison et 100 par hotel"), Hotel, 0, Aucun);
      F.Tab(F.Deb+9) := (TUS("Boulevard de la Vilette"), TUS("Avancez au Boulevard de la Vilette, si vous passez par la case départ, recevez 200"), Aller_A, 12, Aucun);
      F.Tab(F.Deb+10) := (TUS("Vous aimez les trains"), TUS("Avancez jusqu'à la gare de Lyon. Si elle n'appartient à personne, vous pouvez l'acheter auprès de la Banque. Si elle appartient déjà à un autre joueur, payez le loyer dû."), Aller_A, 16, Aucun);
      F.Tab(F.Deb+11) := (TUS("Rentrée d'argent"), TUS("Votre immeuble et votre prêt vous rapporte, Vous devez toucher 150"), Argent, 150, Banque);
      F.Tab(F.Deb+12) := (TUS("Prison"), TUS("Aller en prison, ne passez pas par la case départ, ne touchez pas 200"), Prison, 1, Aucun);
      F.Tab(F.Deb+13) := (TUS("Embouteillages"), TUS("Reculez de 3 cases"), Bouger, -3, Aucun);
      F.Tab(F.Deb+14) := (TUS("L'alcool tue"), TUS("Amande pour état d'ivresse : payez 20."), Argent, -20, Banque);
      F.Tab(F.Deb+15) := (TUS("Mots-croisés"), TUS("Vous avez gagné le prix des mots croisés Recevez 100"), Argent, 100, Banque);
      F.Tab(F.Deb+16) := (TUS("Joyeux anniversaire !"), TUS("C'est votre anniversaire, chaque joueur doit vous donner 10"), Argent, 10, Autres_Joueurs);
      F.Tab(F.Deb+17) := (TUS("Frais médicaux"), TUS("Payez l'hôpital : 100."), Argent, -100, Banque);
      F.Tab(F.Deb+18) := (TUS("Prix de beauté"), TUS("Vous avez gagné le second prix de beauté : recevez 10"), Argent, 10, Banque);
      F.Tab(F.Deb+19) := (TUS("Le malheur des uns..."), TUS("Erreur de la banque en votre faveur, recevez 200"), Argent, 200, Banque);
      F.Tab(F.Deb+20) := (TUS("Epargne"), TUS("Recevez votre intérêt sur l'emprunt à 7% : 25."), Argent, 25, Banque);
      F.Tab(F.Deb+21) := (TUS("Amende"), TUS("Payez une amende de 10"), Argent, -10, Banque);
      F.Tab(F.Deb+22) := (TUS("Belleville"), TUS("Allez à Belleville, si vous passez par la case départ, recevez 200"), Aller_A, 2, Aucun);
      F.Tab(F.Deb+23) := (TUS("Revenu annuel"), TUS("Recevez votre revenu annuel : 100"), Argent, 100, Banque);
      F.Tab(F.Deb+24) := (TUS("Prison"), TUS("Allez en prison. Avancez tout droit en prison. Ne passez pas apr la case départ. Ne recevez pas 200"), Prison, 1, Aucun);
      F.Tab(F.Deb+25) := (TUS("Depart"), TUS("Placez vous sur la case départ"), Aller_A, 1, Aucun);
      F.Tab(F.Deb+26) := (TUS("Médecin"), TUS("Payez la note du médecin 50."), Argent, -50, Banque);
      F.Tab(F.Deb+27) := (TUS("police d'assurance"), TUS("Payez votre police d'assurance : 50"), Argent, -50, Banque);
      F.Tab(F.Deb+28) := (TUS("Contributions"), TUS("Les contributions vous remboursent la somme de 20"), Argent, 20, Banque);
      F.Tab(F.Deb+29) := (TUS("Héritage"), TUS("Vous héritez de 100"), Argent, 100, Banque);
      F.Tab(F.Deb+30) := (TUS("Boursicotage"), TUS("La vente de votre stock vous rapporte 50"), Argent, 50, Banque);
      F.Tab(F.Deb+31) := (TUS("Libéré"), TUS("Vous êtes libéré de prison. Cette carte peut être conservée jusqu'à ce qu'elle soit utilisée ou vendue"), Prison, 0, Aucun);
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
