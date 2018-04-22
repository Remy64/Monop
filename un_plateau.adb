

package body Un_Plateau is
   

      
      P : Plateau := (
	    1 => Creer_Case("Depart", 200, 1, (1, 1, 1, 1, 1, 1), Place, (0, 0, 0) ),
	    2 => Creer_Case("Boulevard de Belleville", 60, 50, (2, 10, 30, 90, 160, 250), Rue, (148, 72, 40) ) ,
	    3 => Creer_Case("Caisse de Communaute", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0) ),
	    4 =>Creer_Case("Rue Lecourbe", 60, 50, (4, 20, 60, 180, 320, 450), Rue, (168, 72, 40) ) ,
	    5 => Creer_Case("Impot sur le revenu", 200, 1, (1, 1, 1, 1, 1, 1), Taxe, (0, 0, 0) ),
	    6 => Creer_Case("Gare Montparnasse", 200, 1, (1, 1, 1, 1, 1, 1), Gare, (0, 0, 0)),
	    7 => Creer_Case("Rue de Vaugirard", 100, 50, (6, 30, 90, 270, 400, 550), Rue, (186, 228, 250)),
	    8 => Creer_Case("Chance", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0)),
	    9 => Creer_Case("Rue de Courcelles", 100, 50, (6, 30, 90, 270, 400, 550), Rue, (186, 228, 250) ),
	    10 => Creer_Case("Avenue de la Republique", 120, 50, (8, 40, 100, 300, 450, 600), Rue, (186, 228, 250) ),
	    11 => Creer_Case("Simple visite/Prison", 1, 1, (1, 1, 1, 1, 1, 1), Place, (0, 0, 0)) ,
	    12 => Creer_Case("Boulevard de la Vilette", 140, 100, (10, 50, 150, 450, 620, 750), Rue, (215, 47, 135) ),
	    13 => Creer_Case("Compagnie de distribution de l'electricite", 150, 1, (1, 1, 1, 1, 1, 1), Service, (0, 0, 0)),
	    14 => Creer_Case("Avenue de Neuilly", 140, 100, (10, 50, 150, 450, 620, 750), Rue, (215, 47, 135) ),
	    15 => Creer_Case("Rue de Paradis", 160, 100, (12, 60, 180, 500, 700, 900), Rue, (215, 47, 135) ),
	    16 => Creer_Case("Gare de Lyon", 200, 1, (1, 1, 1, 1, 1, 1), Gare, (0, 0, 0)) ,
	    17 => Creer_Case("Avenue Mozart", 180, 100, (14, 70, 200, 550, 750, 950), Rue, (244, 145, 0)),
	    18 => Creer_Case("Caisse de Communaute", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0)),
	    19 => Creer_Case("Boulevard Saint-Michel", 180, 100, (14, 70, 200, 550, 750, 950), Rue, (244, 145, 0)),
	    20 => Creer_Case("Place Pigalle", 200, 100, (16, 80, 220, 600, 800, 1000), Rue, (244, 145, 0)),
	    21 => Creer_Case("Parc gratuit", 1, 1, (1, 1, 1, 1, 1, 1), Place, (0, 0, 0)),
	    22 => Creer_Case("Avenue Matignon", 220, 150, (18, 90, 250, 700, 875, 1050), Rue, (227, 0, 17)),
	    23 => Creer_Case("Chance", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0)),
	    24 => Creer_Case("Boulevard Malesherbes", 220, 150, (18, 90, 250, 700, 875, 1050), Rue, (227, 0, 17) ),
	    25 => Creer_Case("Avenue Henri-Martin", 240, 150, (20, 100, 300, 750, 925, 1100), Rue, (227, 0, 17 ) ),
	    26 => Creer_Case("Gare du Nord", 200, 1, (1, 1, 1, 1, 1, 1), Gare, (0, 0, 0)),
	    27 => Creer_Case("Faubourg Saint-Honore", 260, 150, (22, 110, 330, 800, 975, 1150), Rue, (253, 237, 2) ),
	    28 => Creer_Case("Place de la Bourse", 260, 150, (22, 110, 330, 800, 975, 1150), Rue, (253, 237, 2)),
	    29 => Creer_Case("Compagnie de distribution des eaux", 150, 1, (1, 1, 1, 1, 1, 1), Service, (0, 0, 0)),
	    30 => Creer_Case("Rue la Fayette", 280, 150, (24, 120, 360, 850, 1025, 1200), Rue, (253, 237, 2) ),
	    31 => Creer_Case("Allez en prison", 1, 1, (1, 1, 1, 1, 1, 1), Prison, (0, 0, 0)),
	    32 => Creer_Case("Avenue de Breteuil", 300, 200, (26, 130, 390, 900, 1100, 1275), Rue, (31, 165, 76) ),
	    33 => Creer_Case("Avenue Foch", 300, 200, (26, 130, 390, 900, 1100, 1275), Rue, (31, 165, 76) ),
	    34 => Creer_Case("Caisse de communaute", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0)),
	    35 => Creer_Case("Boulevard des Capucines", 320, 200, (28, 150, 450, 1000, 1200, 1400), Rue, (31, 165, 76) ),
	    36 => Creer_Case("Gare Saint-Lazare", 200, 1, (1, 1, 1, 1, 1, 1), Gare, (0, 0, 0)),
	    37 => Creer_Case("Chance", 1, 1, (1, 1, 1, 1, 1, 1), Pioche, (0, 0, 0)),
	    38 => Creer_Case("Avenue des Champs-Elysees", 350, 200, (35, 175, 500, 1100, 1300, 1500), Rue, (2, 104, 179) ),
	    39 => Creer_Case("Taxe de luxe", 100, 1, (1, 1, 1, 1, 1, 1), Taxe, (0, 0, 0)),
	    40 => Creer_Case("Rue de la paix", 400, 200, (50, 200, 600, 1400, 1700, 2000), Rue, (2, 104, 179))
	   ) ;
      
      function Plat(N : Numero_Case) return Cases is 
	 
      begin
	 
	 return P(N) ;
      end Plat ;
      
  
	    end Un_Plateau ;
	      
	      
	
	
