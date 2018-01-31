package Cases is
   type Fonction_Case is (Gare, Service, Rue, Prison, Rien, Visite, Pioche, Taxe, Depart) ;
   type Couleur_Case is (Rien, Marron, Bleu_Clair, Rose, Orange, Rouge, Jaune, Vert, Bleu) ;
   type Loyers is record
      Terrain_Nu : Positive ;
      1_Maison : Positive ;
      2_Maisons : Positive ;
      3_Maisons : Positive ;
      4_Maisons : Positive ;
      Hotel : Positive ;
   end record ;
   
   type Cases is record
      Nom : String ;
      Prix_Terrain : Positive ;
      Prix_Maison : Positive ;
      Hypotheque : Positive ;
      Loyer : Loyers ;
      Fonction : Fonction_Case ;
      Couleur : Couleur_Case ;
      Occupe : Boolean ;
      Occupant : Pion ; 
   end record ;
