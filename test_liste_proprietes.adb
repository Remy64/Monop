with Un_Plateau, Des_Cases, Listes_Proprietes, Ada.Text_IO ;
use Un_Plateau, Des_Cases, Listes_Proprietes, Ada.Text_IO ;

procedure Test_Liste_Proprietes is
   
   procedure Afficher(L : Liste_Proprietes) is
      
      Auxi : Liste_Proprietes ;
      
   begin
      
      Auxi := L ;
      
      while not Est_Vide(Auxi) loop
	 
	 Put_Line("-----------------------------------------------") ;
	 Put_Line("Case n°"&Numero_Case'Image(N_Case(Auxi))) ;
	 New_Line ;
	 Put_Line("Nombre de maison :"&N_Maison'Image(Nb_Maisons_Propriete(Auxi, N_Case(Auxi)))) ;
	 New_Line ;
	 Put_Line("Hypothequee ? "&Boolean'Image(Hypo(Auxi, N_Case(Auxi)))) ;
	 
	 Auxi := Suiv(Auxi) ;
	 
      end loop ;
      
   end Afficher ;
   
	 
		  
      
      
   
   L : Liste_Proprietes ;
   
begin
   
   
   Init_Liste_Proprietes(L) ;
   
   Put_Line("Liste vide ? : "&Boolean'Image(Est_Vide(L))) ;
   
   Ajouter_Propriete(14, L) ;
   
   Put_Line("Liste vide ? :"&Boolean'Image(Est_Vide(L))) ;
   
   Ajouter_Propriete(13, L) ;
   
   Ajouter_Propriete(29, L) ;
   
   Ajouter_Propriete(2, L) ;
   
   Put_Line("Propriete 14 possedee ?"&Boolean'Image(Possede_Propriete(14, L))) ;
   
   New_Line ;
   
   Afficher(L) ;
   
   Supprimer_Propriete(14, L) ;
   
   Put_Line("Propriete 14 possedee ?"&Boolean'Image(Possede_Propriete(14, L))) ;
   
   New_Line ;
   
   Ajouter_Enlever_Maison(True, 2, L) ;
   
   Hypothequer_Desypothequer_Propriete(True, 13, L) ;
   
   Afficher(L) ;
   
   New_Line ;
   
   Put_Line("Nombre de gares : "&Natural'Image(Nb_Gares(L))) ;
   
   Ajouter_Propriete(36, L) ;
   
   Ajouter_Propriete(26, L) ;
   
   Put_Line("Nombre de gares : "&Natural'Image(Nb_Gares(L))) ;
   
   
   
   Put_Line("Nombre de Compagnie :"&Natural'Image(Nb_Compagnies(L))) ;
   
   Put_Line("Nombre de rues marron :"&Natural'Image(Nb_Rues_Meme_Couleur(L, Couleur(Plat(2))))) ;
   
   Ajouter_Propriete(4, L) ;
   
   Put_Line("Nombre de rues marron :"&Natural'Image(Nb_Rues_Meme_Couleur(L, Couleur(Plat(2))))) ;
   
   
     
   
   
   
end Test_Liste_Proprietes ;
