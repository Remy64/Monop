with Liste_Proprietes, Des_Cases, Un_Plateau;
use Liste_Proprietes, Des_Cases, Un_Plateau;

package Joueur is
   
   Nb_Joueurs : constant Positive := 6;
         
   type Un_Joueur is private ; 
   
   subtype Un_Num_Joueur is Positive range 1..Nb_Joueurs ;
   
   type Un_Tab_Joueurs is array Un_Num_Joueur of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
   procedure Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Un_Num_Rue;
   
   procedure Definir_Position_Joueur(N : Un_Num_Joueur ; P : Un_Num_Rue); -- le joueur atteint la case portant le numéro donné en argument
   
   procedure Avancer(N : Un_Num_Joueur ; D : Integer); -- on donne le nombre de cases dont on se déplace, un nombre négatif signifiant que le joueur recule
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes;
   
   function Passe_Depart(D : Un_Num_Rue ; A : Un_Num_Rue) return Boolean;
   
   procedure Gagner_Carte_Lib(N : Un_Num_Joueur) ;
   
   procedure Utiliser_Carte_Lib(N : Un_Num_Joueur) ;
      
private
     
   type Prison is record
      En_Prison : Boolean ;
      Nb_Tour_En_Prison : Natural ;
      Carte_Libe_Prison : Natural ;
   end record;
   
   type Un_Joueur is record
      Position : Un_Num_Rue;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
      Pris : Prison ; 
   end record;
   
end Joueur;
