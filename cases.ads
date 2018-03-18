package Cases is
   type Fonction_Case is (Gare, Service, Rue, Prison, Rien, Pioche, Taxe, Depart) ; -- Ã©numÃ¨re les fonctions possibles des cases
   type Couleur_Case is (Rien, Marron, Bleu_Clair, Rose, Orange, Rouge, Jaune, Vert, Bleu) ; -- type record RGB
   type Loyers is record -- liste les loyers d'une case en fonction des possessions faire tableau
      Terrain_Nu : Positive ; -- loyer si terrain nu
      1_Maison : Positive ; -- loyer si 1 maison
      2_Maisons : Positive ; -- loyer si 2 maisons
      3_Maisons : Positive ; -- loyer si 3 maisons
      4_Maisons : Positive ; -- loyer si 4 maisons
      5_Maisons : Positive ; -- loyer si 5 maisons
   end record ;

   type Cases is record
      Nom : String ; -- faire avec un pointeur
      Prix_Terrain : Natural ; -- prix d'achat de la case si achetable
      Prix_Maison : Positive ; -- prix de construction d'une maison si constructible
      Loyer : Loyers ; -- donne les loyers
      Fonction : Fonction_Case ; -- donne la fonction de la case
      Couleur : Couleur_Case ; -- donne la couleur de la case
      Occupant : Natural ; -- à modifier, ne pas le mettre là
   end record ;

-- fonctions : case achetable, loyer, boolean pour dessiner la couleur
