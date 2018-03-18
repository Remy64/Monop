-- agit sur plateau
--maisons contenues dans plateau
package Commerce is
   procedure Hypothequer(J : Joueur, N : Numero_Case) ; -- le joueur proprietaire perÃ§oit la moitie de la valeur d'achat de la propriete & le loyer du terrain nu = 0 ;
   procedure Acheter_Terrain(J : Joueur, N : Numero_Case) ; -- le joueur doit tomber sur la propriete pour l'acheter ;
   procedure Acheter_Maison(J : Joueur, N : Numero_Case) ; -- possible uniquement quand le joueur possede les 3 proprietes d'une meme couleur et uniquement quand c'est a son tour de jouer ;
   PROCEDURE Vendre_Maison(J : Joueur, N : Numero_Case) ; -- possible uniquement quand c'est a son tour de jouer ;

end Commerce ;


