#include "hmg.ch"

declare window Main

Function main_button_4_action

* Verificando se algo de errado vai causar erro ou falha no processamento dos arquivos.
public nErro := 0
cComboValue := lower(Main.Combo_1.DisplayValue)
cFileDBFIs := lower(HB_FNameNameExt(cFile))

if (Main.Combo_1.Value = 0) .and. (nErro = 0)
nErro = 1
msgexclamation("Tipo de arquivo nao foi selecionado.","SinanTool")
endif

if (empty(cFile) = .T.) .and. (nErro = 0)
nErro = 1
msgexclamation("O arquivo que sera utilizado no processo nao foi selecionado.","SinanTool")
endif

if (cComboValue <> cFileDBFIs) .and. (nErro = 0)
nErro = 1
msgexclamation("Arquivo que sera utilizado nao corresponde ao tipo de arquivo selecionado pelo usuario.","SinanTool")
endif

if (nErro = 0)
lCheck100 = Main.Check_1.value
lCheck200 = Main.Check_2.value
lCheck300 = Main.Check_3.value
lCheck400 = Main.Check_4.value
lCheck500 = Main.Check_5.value
lCheck600 = Main.Check_6.value
lCheck700 = Main.Check_7.value

if (lCheck100 = .F.) .AND. (lCheck200 = .F.) .AND. (lCheck300 = .F.) .AND. (lCheck400 = .F.) .AND. (lCheck500 = .F.) .AND. (lCheck600 = .F.)
msgexclamation("Nenhum campo foi selecionado para decodificacao. ","SinanTool")
nErro = 1
endif
endif

if (empty(cFile2) = .T.) .and. (nErro = 0)
nErro = 1
msgexclamation("Nao foi selecionado nome e local para salvar arquivo de saida.","SinanTool")
endif

cFileSinan1 := file("c:\sinannet\basedbf\municnet.dbf")
cFileSinan2 := file("c:\sinannet\basedbf\regionet.dbf")
cFileSinan3 := file("c:\sinannet\basedbf\unidanet.dbf")
cFileSinan4 := file("c:\sinannet\basedbf\agravnet.dbf")

if (nErro = 0)
if cFileSinan1 = .F.
msgexclamation("Arquivo 'municnet.dbf' nao encontrado.","SinanTool")
nErro = 1
endif
endif

if (nErro = 0)
if cFileSinan2 = .F.
msgexclamation("Arquivo 'regionet.dbf' nao encontrado.","SinanTool")
nErro = 1
endif
endif

if (nErro = 0)
if cFileSinan3 = .F.
msgexclamation("Arquivo 'unidanet.dbf' nao encontrado.","SinanTool")
nErro = 1
endif
endif

if (nErro = 0)
if cFileSinan4 = .F.
msgexclamation("Arquivo 'agravnet.dbf' nao encontrado.","SinanTool")
nErro = 1
endif
endif

if (nErro = 0)
BEGIN SEQUENCE WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
use ("c:\sinannet\basedbf\municnet.dbf")
close
RECOVER USING oError 
nErro = 1 
msgexclamation("Arquivo 'municnet.dbf' nao abriu. Parece estar corrompido.","SinanTool")
END
endif

if (nErro = 0)
BEGIN SEQUENCE WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
use ("c:\sinannet\basedbf\regionet.dbf")
close
RECOVER USING oError 
nErro = 1 
msgexclamation("Arquivo 'regionet.dbf' nao abriu. Parece estar corrompido.","SinanTool")
END
endif

if (nErro = 0)
BEGIN SEQUENCE WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
use ("c:\sinannet\basedbf\unidanet.dbf")
close
RECOVER USING oError 
nErro = 1 
msgexclamation("Arquivo 'unidanet.dbf' nao abriu. Parece estar corrompido.","SinanTool")
END
endif

if (nErro = 0)
BEGIN SEQUENCE WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
use ("c:\sinannet\basedbf\agravnet.dbf")
close
RECOVER USING oError 
nErro = 1 
msgexclamation("Arquivo 'agravnet.dbf' nao abriu. Parece estar corrompido.","SinanTool")
END
endif

if (nErro = 0)
use ("c:\sinannet\basedbf\municnet.dbf")
nRecs_test1 := 0
nRecs_test1 = reccount()
close
if ( nRecs_test1 = 0 )
nErro = 1 
msgexclamation("Arquivo 'municnet.dbf' esta vazio. Sem registros.","SinanTool")
endif
endif

if (nErro = 0)
use ("c:\sinannet\basedbf\regionet.dbf")
nRecs_test2 := 0
nRecs_test2 = reccount()
close
if ( nRecs_test2 = 0 )
nErro = 1 
msgexclamation("Arquivo 'regionet.dbf' esta vazio. Sem registros.","SinanTool")
endif
endif

if (nErro = 0)
use ("c:\sinannet\basedbf\unidanet.dbf")
nRecs_test3 := 0
nRecs_test3 = reccount()
close
if ( nRecs_test3 = 0 )
nErro = 1 
msgexclamation("Arquivo 'unidanet.dbf' esta vazio. Sem registros.","SinanTool")
endif
endif

if (nErro = 0)
use ("c:\sinannet\basedbf\agravnet.dbf")
nRecs_test4 := 0
nRecs_test4 = reccount()
close
if ( nRecs_test4 = 0 )
nErro = 1 
msgexclamation("Arquivo 'agravnet.dbf' esta vazio. Sem registros.","SinanTool")
endif
endif

if (nErro = 0) .and. (cFile = cFile2)
nErro = 1
msgexclamation("Arquivo de saida nao pode ser o mesmo arquivo que sera utilizado para o processamento.","SinanTool")
endif

if nErro = 0
* Criando os campos na tabela de saída.

lCheck1 = Main.Check_1.value
lCheck2 = Main.Check_2.value
lCheck3 = Main.Check_3.value
lCheck4 = Main.Check_4.value
lCheck5 = Main.Check_5.value
lCheck6 = Main.Check_6.value
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
	   if lCheck6 = .T.
	   aAdd( aStruct, { "agravo", "C", 120, 0 } )
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
if lCheck700 = .T.
nPlaceMunName := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo do municipio de notificação não estar no arquivo municnet.dbf.","SinanTool")
Main.Release()
endif
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
if lCheck700 = .T.
nPlaceRegName := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo da regional não estar no arquivo regionet.dbf.","SinanTool")
Main.Release()
endif
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
if lCheck700 = .T.
nPlaceUnidName := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo da unidade não estar no arquivo unidanet.dbf.","SinanTool")
Main.Release()
endif
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
if lCheck700 = .T.
nPlaceMunResName := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo do municipio de residencia não estar no arquivo municnet.dbf.","SinanTool")
Main.Release()
endif
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
if lCheck700 = .T.
nPlaceRegNameRes := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo da regional de residencia não estar no arquivo regionet.dbf.","SinanTool")
Main.Release()
endif
end sequence

replace regi_res with nPlaceRegNameRes
endif
skip
enddo

close
endif

* Decodificando o codigo CID e povoando o campo 'nm_agravo'.

if ( lCheck6 = .T. ) .and. ( cComboValue <> "chikon.dbf" )
	  aArray6 := {}
      use c:\sinannet\basedbf\agravnet.dbf
	  nRecs6 := reccount()
      FOR t := 1 TO nRecs6
	  AAdd( aArray6, {alltrim(id_agravo),nm_agravo} )
	  skip
      NEXT
	  close
	  
use (cFile2)

do while .not. eof()
cValor6 = alltrim(id_agravo)
if empty(cValor6) = .F.
nPlace6 := ascan( aArray6, {|t| t[1] == (cValor6) } )

begin sequence WITH {| oError | oError:cargo := { ProcName( 1 ), ProcLine( 1 ) }, Break( oError ) }
nPlaceAgravo := aArray6[nPlace6,2]
recover
if lCheck700 = .T.
nPlaceAgravo := ""
else
msgexclamation("Problema na varredura do array. Considere o codigo do agravo não estar no arquivo agravnet.dbf.","SinanTool")
Main.Release()
endif
end sequence

replace agravo with nPlaceAgravo
endif
skip
enddo

close
endif

msgexclamation("Processamento concluido.","SinanTool")

endif

if ( lCheck6 = .T. ) .and. ( cComboValue = "chikon.dbf" )
use (cFile2)
do while .not. eof()
replace agravo with "FEBRE DE CHIKUNGUNYA"
skip
enddo
endif

Return Nil