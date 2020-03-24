#include "hmg.ch"

declare window Main

Function main_button_2_action

cFile2 := PutFile ({{'Arquivos do tipo DBF','*.dbf'}},'Salvar arquivo como...','c:\sinannet\basedbf',.F.,"meu_arquivo.dbf")
Main.Label_2.value := (cFile2)

Return Nil
