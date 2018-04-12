with Des, Ada.Text_Io ; 
use Des, Ada.Text_IO  ;

procedure Test_Des is 
   
   A : Un_Lancer ;
   begin
   
   
   
   -- Ici nous affichons 10 nombres aléatoires
   for Num in 1..10 loop
      Put_Line("Voici un nombre aleatoire : " & Integer'Image(Lancer_Un_De));
   end loop ;
   for Num in 1..10 loop
      A := Lancer ;
      Put_Line("Voici 4 lancers aleatoire : " & Integer'Image(A.Des) & Boolean'Image(A.Double));
   end loop ;
   
   
   end Test_Des ;
