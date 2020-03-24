#include "hmg.ch"

declare window Main

Function main_button_4_action

* Criando os campos na tabela de saída.

lCheck1 = Main.Check_1.value
lCheck2 = Main.Check_2.value
lCheck3 = Main.Check_3.value
lCheck4 = Main.Check_4.value
lCheck5 = Main.Check_5.value
	   use (cFile) new
	   aStruct := dbStruct( cFile )
	   if lCheck1 = .T.
	   aAdd( aStruct, { "mun_not", "C", 70, 0 } )
	   endif
	   if lCheck2 = .T.
	   aAdd( aStruct, { "regi_not", "C", 40, 0 } )
	   endif	   
	   if lCheck3 = .T.
	   aAdd( aStruct, { "unid_not", "C", 100, 0 } )
	   endif
	   if lCheck4 = .T.
	   aAdd( aStruct, { "mun_res", "C", 70, 0 } )	      
	   endif	
	   if lCheck5 = .T.
	   aAdd( aStruct, { "regi_res", "C", 40, 0 } )
	   endif	   	   	   
	   
* Cria uma tabela nova a partir da estrutura da tabela selecionada como arquivo de entrada.
* A tabela nova já contém os campos selecionados pelo usuario.	   
	   dbCreate( (cFile2) , aStruct )	   
	   close

* Transferindo os dados da tabela original para a tabela recem criada.
	   use (cFile2) new
	   append from ( cFile )
	   close

* Decodificando o codigo dos municipios de notificação e povoando o campo 'mun_not'.
if lCheck1 = .T.      
	  aArray := {}
      use c:\sinannet\basedbf\municnet.dbf
	  nRecs := reccount()
      FOR x := 1 TO nRecs
         AAdd( aArray, {alltrim(id_municip),nm_municip} )
		 skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor = alltrim(id_municip)
if empty(cValor) = .F.
nPlace := ascan( aArray, {|x| x[1] == (cValor) } )
begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceMunName := aArray[nPlace,2]
recover
msgbox ("Problema na varredura do array. Considere o codigo do municipio de notificação não estar no arquivo municnet.dbf.")
Main.Release()
end sequence

replace mun_not with nPlaceMunName
endif
skip
enddo

close
endif

* Decodificando o codigo das regionais dos municipios de notificação e povoando o campo 'regi_not'.
if lCheck2 = .T.      
	  aArray2 := {}
      use c:\sinannet\basedbf\regionet.dbf
	  nRecs2 := reccount()
      FOR y := 1 TO nRecs2
         AAdd( aArray2, {alltrim(id_rg_resi),nm_regiona} )
		 skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor2 = alltrim(id_regiona)
if empty(cValor2) = .F.
nPlace2 := ascan( aArray2, {|y| y[1] == (cValor2) } )
begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceRegName := aArray2[nPlace2,2]
recover
msgbox ("Problema na varredura do array. Considere o codigo da regional não estar no arquivo regionet.dbf.")
Main.Release()
end sequence

replace regi_not with nPlaceRegName
endif
skip
enddo

close
endif

* Decodificando o codigo das unidades notificadoras e povoando o campo 'unid_not'.
if lCheck3 = .T.      
	  aArray3 := {}
      use c:\sinannet\basedbf\unidanet.dbf
	  nRecs3 := reccount()
      FOR z := 1 TO nRecs3
         AAdd( aArray3, {alltrim(id_unidade),nm_unidade} )
		 skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor3 = alltrim(id_unidade)
if empty(cValor3) = .F.
nPlace3 := ascan( aArray3, {|z| z[1] == (cValor3) } )
begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceUnidName := aArray3[nPlace3,2]
recover
msgbox ("Problema na varredura do array. Considere o codigo da unidade não estar no arquivo unidanet.dbf.")
Main.Release()
end sequence

replace unid_not with nPlaceUnidName
endif
skip
enddo

close
endif

* Decodificando o codigo dos municipios de residencia e povoando o campo 'mun_res'.
if lCheck4 = .T.      
	  aArray4 := {}
      use c:\sinannet\basedbf\municnet.dbf
	  nRecs4 := reccount()
      FOR w := 1 TO nRecs4
         AAdd( aArray4, {alltrim(id_municip),nm_municip} )
		 skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor4 = alltrim(id_mn_resi)
if empty(cValor4) = .F.
nPlace4 := ascan( aArray4, {|w| w[1] == (cValor4) } )
begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceMunResName := aArray4[nPlace4,2]
recover
msgbox ("Problema na varredura do array. Considere o codigo do municipio de residencia não estar no arquivo municnet.dbf.")
Main.Release()
end sequence

replace mun_res with nPlaceMunResName
endif
skip
enddo

close
endif

* Decodificando o codigo das regionais dos municipios de residencia e povoando o campo 'regi_res'.
if lCheck5 = .T.      
	  aArray5 := {}
      use c:\sinannet\basedbf\regionet.dbf
	  nRecs5 := reccount()
      FOR t := 1 TO nRecs5
         AAdd( aArray5, {alltrim(id_rg_resi),nm_regiona} )
		 skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor5 = alltrim(id_rg_resi)
if empty(cValor5) = .F.
nPlace5 := ascan( aArray5, {|t| t[1] == (cValor5) } )
begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceRegNameRes := aArray5[nPlace5,2]
recover
msgbox ("Problema na varredura do array. Considere o codigo da regional de residencia não estar no arquivo regionet.dbf.")
Main.Release()
end sequence

replace regi_res with nPlaceRegNameRes
endif
skip
enddo

close
endif

MsgBox ("Processamento concluido.")
Return Nil
