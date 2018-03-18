package De is
   SUBTYPE Valeurs_Des IS Positive RANGE 1..6 ;
   --type record contient somme des dés + boolean pour le double
   function Lancer return Valeurs_De ; -- renvoie le record
   FUNCTION Double RETURN Boolean ; -- Le joueur rejoue une deuxieme fois lorsque il a fait un double ;

-- Lancer déterministe

end De ;
