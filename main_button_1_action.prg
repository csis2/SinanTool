#include "hmg.ch"

declare window Main

Function main_button_1_action

 cFile := Getfile ({{'Arquivos do tipo DBF','*.dbf'}},'Abrir arquivo','c:\sinannet\basedbf',.F.)
 Main.Label_1.value := (cFile)

Return Nil
