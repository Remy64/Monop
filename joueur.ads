with Liste_Proprietes, Des_Cases, Un_Plateau;
use Liste_Proprietes, Des_Cases, Un_Plateau;

package Joueur is
   
   Nb_Joueurs : constant Positive := 6;
   
   type Prison is record
      En_Prison : Boolean ;
      Nb_Tour_En_Prison : Natural ;
      Carte_Libe_Prison : Natural ;
      
      type Un_Joueur is private ;
      
      
      
   type Un_Joueur is record
      Position : Un_Num_Rue;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
      Pris : Prison ;
      Libere_De_Prison : Natural ;
   end record;
   
   subtype Un_Num_Joueur is Positive range 1..Nb_Joueurs ;
   
   type Un_Tab_Joueurs is array Un_Num_Joueur of Un_Joueur;
   
   Joueurs : Un_Tab_Joueurs;
   
   
   
   procedure Init_Joueurs;
   
   function Position_Joueur(N : Un_Num_Joueur) return Un_Num_Rue;
   
   procedure Definir_Position_Joueur(N : Un_Num_Joueur ; P : Un_Num_Rue);
   
   function Compte_Joueur(N : Un_Num_Joueur) return Natural;
   
   function Proprietes_Joueur(N : Un_Num_Joueur) return Liste_Proprietes;
   
   procedure Gagner_Carte_Lib(N : Un_Num_Joueur) ;
   
   procedure Utiliser_Carte_Lib(N : Un_Num_Joueur) ;
   
   procedure
      
   
   private 
      
       type Un_Joueur is record
      Position : Un_Num_Rue;
      Compte : Natural;
      Proprietes : Liste_Proprietes;
      Pris : Prison ;
     
   end record;
      
   
end Joueur;
