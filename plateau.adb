with Cases ;
use Cases ;

package body Plateau is
   Plateau : constant Plateau := (("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien),
				  ("Départ", 0, 0, (0, 0, 0, 0, 0, 0), Depart, Rien)) ;
   
   subtype Numero_Joueur is Natural in 0..4 ;
   
   function Position(J : Joueur) return Numero_Case is
      I : Numero_Case ;
   begin
      I := 1 ;
      while Plateau(I).Occupant /= J loop
	 I := I+1;
      end loop ;
      return I ;
   end Position ;
   
   procedure Bouger(N : in Integer ; J : in Numero_Joueur) is
   begin
      Plateau(Position(J)+N).Occupant := J ;
      Plateau(Position(J)).Occupant := 0 ;
   end Bouger ;
   
   procedure Aller_A(N : in Numero_Case ; J : in Joueur) is
   begin
      Plateau(N).Occupant := J ;
      Plateau(Position(J)).Occupant := 0 ;
   end Aller_A ;

   procedure Initialiser is
   begin
      for I in Plateau'Range loop
	 Plateau(I).Occupant := 0 ;
      end loop ;
   end Initialiser ;
end Plateau ;
