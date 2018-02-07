package De is
   subtype Valeurs_Des is Positive range 1..6 ;
   function Lancer return Valeurs_De ;  
   function Double return Boolean ; -- Le joueur rejoue une deuxieme fois lorsque il a fait un double ; 
end De ;
