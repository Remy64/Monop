with Ada.Unchecked.Deallocation;

package body Listes_Proprietes is
   
   procedure Init_Liste_Proprietes(L : Liste_Proprietes) is
   begin
      L := null;
   end Init_Liste_Proprietes;
   
   function Possede_Propriete(L : Liste_Proprietes ; C : Numero_Case) return Boolean is
      Trouve : Boolean;
      Aux : Liste_Proprietes;
   begin
      Trouve := False;
      Aux := L;
      while Aux /= null loop
	 if Aux.all.Propriete.Num_Case = C then
	    Trouve := True;
	 end if;
	 Aux := Aux.all.Suiv;
      end loop;
      return Trouve;
   end Possede_Propriete;
   
   procedure Ajouter_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes) is
   begin
      L := new Cellule'((C, 0, False), L);
   end Ajouter_Propriete;

   procedure Supprimer_Propriete(C : in Numero_Case ; L : in out Liste_Proprietes) is
      Aux : Liste_Proprietes;
   begin
      if L=null then
	 raise Liste_Proprietes_Vide;
      elsif L.all.Propriete.Num_Case = C then
	 Aux := L;
	 L := L.all.Suiv;
	 Free(Aux);
      else
	 Supprimer_Propriete(C, L.all.Suiv);
      end if;
   end Supprimer_Propriete;

   function Nb_Maisons_Propriete(L : Liste_Proprietes ; C : Numero_Case) return N_Maison is
   begin
      return 0;
   end Nb_Maisons_Propriete;

end Listes_Proprietes;
