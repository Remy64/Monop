with Liste_Proprietes, Des_Cases, Un_Plateau;
use Liste_Proprietes, Des_Cases, Un_Plateau;

package Joueur is
         
   type Un_Joueur is private;
   
   Trop_De_Tours_En_Prison : exception;
   
   Nb_Joueurs : constant Positive := 6;
   
   subtype Un_Num_Joueur is Positive range 1..Nb_Joueurs;
   
   procedure Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Un_Num_Rue;
   
   procedure Atteindre_Position(N : Un_Num_Joueur ; P : Un_Num_Rue); -- le joueur atteint la case portant le numéro donné en argument
   
   procedure Avancer(N : Un_Num_Joueur ; D : Integer); -- on donne le nombre de cases dont on se déplace, un nombre négatif signifiant que le joueur recule
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes;
   
   function Passe_Depart(D : Un_Num_Rue ; A : Un_Num_Rue) return Boolean; -- indique à partir de l'ancienne position d'un joueur et de la nouvelle s'il est passé par la case départ
   
   procedure Mettre_En_Prison(N : Un_Num_Joueur);
   
   procedure Sortir_De_Prison(N : Un_Num_Joueur);
   
   procedure Incrementer_Tour_Prison(N : Un_Num_Joueur);
   
   procedure RAZ_Tour_Prison(N : Un_Num_Joueur);
   
   function Possede_Carte_Lib(N : Un_Num_Joueur);
   
   procedure Ajouter_Carte_Lib(N : Un_Num_Joueur);
   
   procedure Retirer_Carte_Lib(N : Un_Num_Joueur);
      
private
   
   subtype Un_Nb_Tour_En_Prison is Natural range 0..3;
   
   type Prison is record
      En_Prison : Boolean;
      Nb_Tour_En_Prison : Un_Nb_Tour_En_Prison;
      Carte_Libe_Prison : Natural;
   end record;
   
   type Un_Joueur is record
      Position : Un_Num_Rue;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
      Pris : Prison;
   end record;
   
   type Un_Tab_Joueurs is array Un_Num_Joueur of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
end Joueur;
