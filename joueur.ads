with Listes_Proprietes, Des_Cases, Un_Plateau;
use Listes_Proprietes, Des_Cases, Un_Plateau;

package Joueur is
         
   type Un_Joueur is private;
   
   
   
   Trop_De_Tours_En_Prison : exception;
   
   Nb_Joueurs : constant Positive := 4;
   
   subtype Un_Num_Joueur is Positive range 1..Nb_Joueurs;
   
   type Un_Tab_Joueurs is array (Un_Num_Joueur) of Un_Joueur;
   
   procedure Init_Joueurs; -- place les joueurs sur la case départ dans les conditions d'un début de partie (compte à 1500, pas de propriétés, libre)
   
   procedure Init_Truquee ;
   
   function Position_Joueur(N : Un_Num_Joueur) return Numero_Case; -- renvoie la position d'un joueur
   
   procedure Atteindre_Position(N : Un_Num_Joueur ; P : Numero_Case); -- le joueur atteint la case portant le numéro donné en argument
   
   procedure Avancer(N : Un_Num_Joueur ; D : Integer); -- on donne le nombre de cases dont on se déplace, un nombre négatif signifiant que le joueur recule
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural; -- renvoie le solde du compte d'un joueur
   
   procedure Ajouter_Argent(N : Un_Num_Joueur ; S : Integer); -- renfloue le compte d'un joueur d'une certaine somme, si cette somme est négative alors le joueur perd de l'argent
   
   function Proprietes_Joueur(N : in   Un_Num_Joueur) return Liste_Proprietes; -- renvoie la liste des prprietes d'un joueur
   
   procedure Ajouter_Propriete_Joueur(N : in Un_Num_Joueur; C : in Numero_Case);
   
   procedure Hyp(B : in Boolean ; N : in Un_Num_Joueur; C : in Numero_Case);
   
   function Passe_Depart(D : Numero_Case ; A : Numero_Case) return Boolean; -- indique à partir de l'ancienne position d'un joueur et de la nouvelle s'il est passé par la case départ
   
   function Est_En_Prison(N : Un_Num_Joueur) return Boolean; -- renvoie si le joueur est en prison
   
   procedure Mettre_En_Prison(N : Un_Num_Joueur); -- mets un joueur en prison
   
   procedure Sortir_De_Prison(N : Un_Num_Joueur); -- libère un joueur
   
   function Trois_Tours(N : Un_Num_Joueur) return Boolean; -- renvoie si le joueur a passé 3 tours en prison
   
   procedure Incrementer_Tour_Prison(N : Un_Num_Joueur); -- ajoute un tour au compteur des tours passés en prison d'un joueur
   
   procedure RAZ_Tour_Prison(N : Un_Num_Joueur); -- remets le nombre de tours passés en prison d'un joueur à zéro
   
   function Possede_Carte_Lib(N : Un_Num_Joueur) return Boolean; -- indique par un booléen si le joueur possède une carte pour se libérer de prison
   
   procedure Ajouter_Carte_Lib(N : Un_Num_Joueur); -- ajoute une carte pour se libérer de prison à un joueur
   
   procedure Retirer_Carte_Lib(N : Un_Num_Joueur); -- retire une carte de libération à un joueur
   
   function Proprietaire_Case(C : Numero_Case) return Natural;
   
   function Elimine(N : Un_Num_Joueur) return Boolean ;
   
   function Nb_Elimines return Natural ;
   
   function Fin_Jeu return Boolean ; 
      
private
   
   subtype Un_Nb_Tour_En_Prison is Natural range 0..3;
   
   type Prison is record
      En_Prison : Boolean;
      Nb_Tour_En_Prison : Un_Nb_Tour_En_Prison;
      Carte_Libe_Prison : Natural;
   end record;
   
   type Un_Joueur is record
      Position : Numero_Case;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
      Pris : Prison;
      Elimine : Boolean ;
   end record;
   
   
   
   Joueurs : Un_Tab_Joueurs;
   
end Joueur;
