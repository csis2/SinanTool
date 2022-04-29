# DEF_CNV_SRAGHOSP
Arquivos de tabulação DEF/CNV para notificações SRAG Hospitalizado do SIVEP Gripe. Atualização para a ficha padrão de 27/07/2020 para notificação de SARS-COV-2.

## Como usar?

Primeiro, acesse a seção onde estão disponíveis os releases (seta vermelha 1).

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem01.bmp)

Escolha sempre a última versão disponível. A versão mais atual vem marcada com a legenda "Latest" (seta vermelha 2).

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem02.bmp)

Clique no link "SivepGripe.rar" (seta vermelha 3) e faça o download do arquivo.

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem03.bmp)

Descompacte o arquivo "SivepGripe.rar" utilizando um descompactador da sua preferência.

Utilizando o descompactador, será visualizado uma pasta com o nome "SivepGripe".

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem04.bmp)

Extraia a pasta inteira para dentro do disco local C.

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem05.bmp)

Após a descompactação o resultado deverá ficar como mostrado na figura acima.

Dentro da pasta "SivepGripe", a estrutura estará distribuída de acordo com a figura abaixo.

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem06.bmp)

Usando a aplicação "SivepGripe" (https://sivepgripe.saude.gov.br/sivepgripe/login.html), faça o download de um arquivo de exportação DBF. Salve o arquivo na subpasta "BaseDBF" mostrada acima.

Descompacte o arquivo baixado utilizando um descompactador de sua preferência e salve o arquivo resultante na subpasta "BaseDBF".

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem07.bmp)

O resultado da operação será parecido com o mostrado na figura acima.

Renomeie o arquivo DBF resultante da descompactação para "sraghosp.dbf".

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem08.bmp)

Uma vez renomeado, rode o arquivo "sraghosp_plus.exe", que também estará na subpasta "BaseDBF".

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem09.bmp)

Quando o script terminar, executando todos os passos, será criado um novo arquivo: "sraghosp2.dbf". Esse arquivo que deverá ser usado no Tabwin para fazer a tabulação dos dados que o usuário baixou no SIVEP Gripe.

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem10.bmp)

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem11.bmp)

![alt text](https://github.com/csis2/DEF_CNV_SRAGHOSP/blob/main/img/imagem12.bmp)

## O que o pacote DEF_CNV_SRAGHOSP contém?

O pacote é principalmente formado por arquivos CNV/DEF extraídos do site do SIVEP Gripe (https://sivepgripe.saude.gov.br/sivepgripe/login.html). Alguns não sofreram nenhuma modificação, outros tiveram mudanças no conteúdo para se ajustarem à mudança ocorrida na última versão da ficha de SRAG Hospitalizado (27/07/2020), alguns arquivos foram criados, pois não existiam para alguns critérios que surgiram na ficha atual.

Além disso, foi criado um script (sraghosp_plus.exe) que ajusta o arquivo de exportação para utilização no Tabwin.

## Créditos

Os créditos pela criação dos arquivos CNV/DEF originais usados nesse projeto pertencem à Vigilância Epidemiológica do Rio Grande do Sul que os desenvolveu em maio/2019. Posteriormente, foi feita uma revisão dos arquivos pelo GT-Influenza do Ministério da Saúde, que depois disponibilizou os arquivos na rede nacional de Influenza.

## Nota para desenvolvedores

O arquivo executável que acompanha os demais arquivos desse projeto, foi desenvolvido usando a linguagem Harbour versão 3.0 (https://harbour.github.io/).
O código fonte do arquivo executável está no diretório "BaseDBF". Para compilação, foi usado o compilador hbmk2, disponível na distribuição do Harbour.
Para compilar, é necessário indicar a biblioteca hbct na linha de comando:

`hbmk2 sraghosp_plus.prg hbct.hbc`


## Segurança

Escaneando o arquivo executável que faz parte desse projeto no serviço online VirusTotal, não foi detectado conteúdo malicioso nele pelos antivírus mais conhecidos no  mercado, como o AVG, McAfee, Avast, Kapersky, Symantec, F-Secure etc.

Você também pode constatar a segurança do arquivo "sraghosp_plus.exe" utilizando o VirusTotal (https://www.virustotal.com/gui/).
O serviço é online e gratuito.

