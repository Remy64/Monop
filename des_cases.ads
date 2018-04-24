package Des_Cases is
   
   Case_Non_Achetable, Case_Sans_Couleur  : exception ;
   
   type Cases is private ;
   type Fonction_Case is (Gare, Service, Rue, Prison, Place, Pioche, Taxe) ; -- Ã©numÃ¨re les fonctions possibles des cases
   subtype RGB is Natural range 0..255;
   subtype N_Maison is Natural range 0..5 ;
     type Couleur_Case is record
      R : RGB ;
      G : RGB ;
      B : RGB ;
      end record ;
	
      
   type P_String is access String ;
   type Loyers is array (Integer range 0..5) of Positive ;
   
   function Creer_Case(Nom : String; Prix_Terrain : Natural; Prix_Maison : Positive; Loyer : Loyers; Fonction : Fonction_Case; Couleur : Couleur_Case) return Cases ;
   function Nom_Case( C : Cases) return String ;-- renvoie le nom de la case
   function Prix_Terrain(C : Cases) return Natural ; --renvoie le prix du terrain
   function Loyer(C : Cases ; N : N_Maison) return  Natural ; -- renvoie le loyer pour n hotel
   function Type_Case(C : Cases) return Fonction_Case ; --renvoie le type de la case
   function Couleur(C : Cases) return Couleur_Case ; --renvoie le RGB de la case
   function Achetable(C : Cases) return Boolean ;
   
     
      
   
   
   private
      
   type Cases is record
      Nom : P_String ; -- faire avec un pointeur
      Prix_Terrain : Natural ; -- prix d'achat de la case si achetable
      Prix_Maison : Positive ; -- prix de construction d'une maison si constructible
      Loyer : Loyers ; -- donne les loyers
      Fonction : Fonction_Case ; -- donne la fonction de la case
      Couleur : Couleur_Case ; -- donne la couleur de la case
    
   end record ;
   
   end Des_Cases ;

-- fonctions : case achetable, loyer, boolean pour dessiner la couleur
