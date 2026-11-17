#include "protheus.ch"

/*/{Protheus.doc} ASPVALID
Telas de validação do Protheus Screen Preview.

Compile este fonte e rode U_ASPVALID (Fórmulas, menu ou programa inicial do SmartClient).
Cada tela tem um identificador [ASP-Txx] no título; o mesmo identificador aparece num
comentário acima da função que monta a tela, para achar o código.

Para validar: abra a tela, tire um print da janela inteira (com a barra de título) e envie
junto com o identificador. A prévia de referência sai em "npm run validacao".
/*/
User Function ASPVALID()
    Local oDlg, oLst
    Local nItem   := 1
    Local aTestes := ASPLISTA()
    Local aNomes  := {}
    Local nI

    For nI := 1 To Len(aTestes)
        aAdd(aNomes, aTestes[nI][1])
    Next

    // [ASP-MENU]
    DEFINE MSDIALOG oDlg TITLE "[ASP-MENU] Validação de telas - Protheus Screen Preview" FROM 000,000 TO 440,520 PIXEL

    @ 005,005 SAY "Abra cada tela e tire um print da janela inteira (com o título)." SIZE 250,008 OF oDlg PIXEL
    @ 014,005 SAY "Envie cada print com o identificador [ASP-Txx] do título." SIZE 250,008 OF oDlg PIXEL
    @ 025,005 LISTBOX oLst VAR nItem ITEMS aNomes SIZE 250,150 OF oDlg PIXEL ON DBLCLICK ASPABRE(aTestes, nItem)
    @ 185,005 BUTTON "Abrir" SIZE 050,012 ACTION ASPABRE(aTestes, nItem) OF oDlg PIXEL
    @ 185,060 BUTTON "Abrir todas" SIZE 060,012 ACTION ASPTODAS(aTestes) OF oDlg PIXEL
    @ 185,205 BUTTON "Fechar" SIZE 050,012 ACTION oDlg:End() OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED
Return

/** Lista das telas: {descrição, bloco que abre}. */
Static Function ASPLISTA()
Return { ;
    {"[ASP-T01] Comandos com PIXEL",            {|| ASPT01()}}, ;
    {"[ASP-T02] Classes (mesma tela da T01)",   {|| ASPT02()}}, ;
    {"[ASP-T03] Sem PIXEL (caracteres)",        {|| ASPT03()}}, ;
    {"[ASP-T04] TPanel com Align",              {|| ASPT04()}}, ;
    {"[ASP-T05] TFolder com abas",              {|| ASPT05()}}, ;
    {"[ASP-T06] FWLayer",                       {|| ASPT06()}}, ;
    {"[ASP-T07] EnchoiceBar",                   {|| ASPT07()}}, ;
    {"[ASP-T08] Grades",                        {|| ASPT08()}}, ;
    {"[ASP-T09] Classes adicionais",            {|| ASPT09()}}, ;
    {"[ASP-T10] Textos e larguras",             {|| ASPT10()}}, ;
    {"[ASP-T11] MsMGet (precisa de ambiente)",  {|| ASPT11()}}, ;
    {"[ASP-T12a] Condicional (nOpc = 3)",       {|| ASPT12(3)}}, ;
    {"[ASP-T12b] Condicional (nOpc = 4)",       {|| ASPT12(4)}}, ;
    {"[ASP-T13] Funções auxiliares e While",    {|| ASPT13()}} }

Static Function ASPABRE(aTestes, nItem)
    If nItem >= 1 .And. nItem <= Len(aTestes)
        Eval(aTestes[nItem][2])
    EndIf
Return

Static Function ASPTODAS(aTestes)
    Local nI
    For nI := 1 To Len(aTestes)
        Eval(aTestes[nI][2])
    Next
Return

// [ASP-T01] Comandos com PIXEL. Os SAYs "TR" e "BL" ficam nos cantos da área útil e o botão
// Fechar no canto inferior direito: conferem o fator do diálogo (FROM/TO = 2x os controles).
Static Function ASPT01()
    Local oDlg, oChk, oCbo, oRad, oGrp, oLst
    Local cCod   := Space(6)
    Local cNome  := Space(40)
    Local lAtivo := .T.
    Local cTipo  := "1"
    Local nOpcR  := 1
    Local nLst   := 1

    DEFINE MSDIALOG oDlg TITLE "[ASP-T01] Comandos com PIXEL" FROM 000,000 TO 300,500 PIXEL

    @ 005,005 SAY "Código:" SIZE 040,008 OF oDlg PIXEL
    @ 005,050 MSGET cCod SIZE 050,010 OF oDlg PIXEL
    @ 020,005 SAY "Nome:" SIZE 040,008 OF oDlg PIXEL
    @ 020,050 MSGET cNome SIZE 150,010 OF oDlg PIXEL
    @ 035,005 CHECKBOX oChk VAR lAtivo PROMPT "Ativo" SIZE 050,008 OF oDlg PIXEL
    @ 035,060 COMBOBOX oCbo VAR cTipo ITEMS {"1=Normal","2=Especial"} SIZE 070,010 OF oDlg PIXEL
    @ 050,005 RADIO oRad VAR nOpcR ITEMS "Opção A","Opção B","Opção C" SIZE 060,030 OF oDlg PIXEL
    @ 050,080 GROUP oGrp TO 095,240 PROMPT "Grupo" OF oDlg PIXEL
    @ 060,090 SAY "Dentro do grupo (060,090)" SIZE 090,008 OF oDlg PIXEL
    @ 085,005 LISTBOX oLst VAR nLst ITEMS {"Item 1","Item 2","Item 3"} SIZE 070,030 OF oDlg PIXEL
    @ 000,239 SAY "TR" SIZE 010,008 OF oDlg PIXEL
    @ 125,000 SAY "BL" SIZE 010,008 OF oDlg PIXEL
    @ 116,207 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T02] A mesma tela da T01 em sintaxe de classes: as duas devem ficar idênticas.
Static Function ASPT02()
    Local oDlg
    Local cCod   := Space(6)
    Local cNome  := Space(40)
    Local lAtivo := .T.
    Local cTipo  := "1"
    Local nOpcR  := 1
    Local nLst   := 1

    oDlg := MsDialog():New(000,000,300,500,"[ASP-T02] Classes (mesma tela da T01)",,,,,,,,,.T.)

    TSay():New(005,005,{||"Código:"},oDlg,,,,,,.T.,,,040,008)
    TGet():New(005,050,{|u| If(PCount()>0,cCod:=u,cCod)},oDlg,050,010,,,,,,,,.T.)
    TSay():New(020,005,{||"Nome:"},oDlg,,,,,,.T.,,,040,008)
    TGet():New(020,050,{|u| If(PCount()>0,cNome:=u,cNome)},oDlg,150,010,,,,,,,,.T.)
    TCheckBox():New(035,005,"Ativo",{|u| If(PCount()>0,lAtivo:=u,lAtivo)},oDlg,050,008,,,,,,,,.T.)
    TComboBox():New(035,060,{|u| If(PCount()>0,cTipo:=u,cTipo)},{"1=Normal","2=Especial"},070,010,oDlg,,,,,,.T.)
    TRadMenu():New(050,005,{"Opção A","Opção B","Opção C"},{|u| If(PCount()>0,nOpcR:=u,nOpcR)},oDlg,,,,,,,,060,030,,,,.T.)
    TGroup():New(050,080,095,240,"Grupo",oDlg,,,.T.)
    TSay():New(060,090,{||"Dentro do grupo (060,090)"},oDlg,,,,,,.T.,,,090,008)
    TListBox():New(085,005,{|u| If(PCount()>0,nLst:=u,nLst)},{"Item 1","Item 2","Item 3"},070,030,,oDlg,,,,.T.)
    TSay():New(000,239,{||"TR"},oDlg,,,,,,.T.,,,010,008)
    TSay():New(125,000,{||"BL"},oDlg,,,,,,.T.,,,010,008)
    TButton():New(116,207,"Fechar",oDlg,{||oDlg:End()},037,012,,,,.T.)

    oDlg:Activate(,,,.T.)
Return

// [ASP-T03] Sem PIXEL: linha/coluna em unidades de caractere (fator não publicado pela TOTVS;
// a prévia usa 8 x 16 px). O SIZE continua em unidades de pixel de controle.
Static Function ASPT03()
    Local oDlg
    Local cCod  := Space(6)
    Local cNome := Space(40)

    DEFINE MSDIALOG oDlg TITLE "[ASP-T03] Sem PIXEL (caracteres)" FROM 000,000 TO 018,060

    @ 01,02 SAY "Código:" SIZE 040,008 OF oDlg
    @ 01,12 MSGET cCod SIZE 050,010 OF oDlg
    @ 03,02 SAY "Nome:" SIZE 040,008 OF oDlg
    @ 06,02 SAY "Linha 06, coluna 02" SIZE 100,008 OF oDlg
    @ 03,12 MSGET cNome SIZE 150,010 OF oDlg
    @ 13,48 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T04] TPanel com Align, empilhado na ordem de criação.
Static Function ASPT04()
    Local oDlg, oTop, oBot, oLeft, oRight, oCli

    oDlg := MsDialog():New(000,000,400,600,"[ASP-T04] TPanel com Align",,,,,,,,,.T.)

    oTop := TPanel():New(0,0,"TOP (altura 20)",oDlg,,.T.,,CLR_BLACK,CLR_HGRAY,0,20,.F.,.T.)
    oTop:Align := CONTROL_ALIGN_TOP
    oBot := TPanel():New(0,0,"BOTTOM (altura 25)",oDlg,,.T.,,CLR_BLACK,CLR_HGRAY,0,25,.F.,.T.)
    oBot:Align := CONTROL_ALIGN_BOTTOM
    oLeft := TPanel():New(0,0,"LEFT (60)",oDlg,,.T.,,CLR_BLACK,CLR_WHITE,60,0,.F.,.T.)
    oLeft:Align := CONTROL_ALIGN_LEFT
    oRight := TPanel():New(0,0,"RIGHT (80)",oDlg,,.T.,,CLR_BLACK,CLR_WHITE,80,0,.F.,.T.)
    oRight:Align := CONTROL_ALIGN_RIGHT
    oCli := TPanel():New(0,0,"",oDlg,,,,,,0,0,.T.,.F.)
    oCli:Align := CONTROL_ALIGN_ALLCLIENT

    TSay():New(010,010,{||"ALLCLIENT: SAY em (010,010)"},oCli,,,,,,.T.,,,110,008)
    TButton():New(005,005,"Fechar",oBot,{||oDlg:End()},037,012,,,,.T.)

    oDlg:Activate(,,,.T.)
Return

// [ASP-T05] TFolder: controles em cada aba, relativos à área da aba.
Static Function ASPT05()
    Local oDlg, oFld
    Local cNome := Space(30), cEnd := Space(40)

    DEFINE MSDIALOG oDlg TITLE "[ASP-T05] TFolder com abas" FROM 000,000 TO 300,500 PIXEL

    @ 005,005 FOLDER oFld PROMPTS "Geral","Endereço" SIZE 240,105 OF oDlg PIXEL

    @ 005,005 SAY "Aba 1 (005,005)" SIZE 060,008 OF oFld:aDialogs[1] PIXEL
    @ 020,005 SAY "Nome:" SIZE 030,008 OF oFld:aDialogs[1] PIXEL
    @ 020,040 MSGET cNome SIZE 120,010 OF oFld:aDialogs[1] PIXEL
    @ 005,005 SAY "Aba 2 (005,005)" SIZE 060,008 OF oFld:aDialogs[2] PIXEL
    @ 020,040 MSGET cEnd SIZE 150,010 OF oFld:aDialogs[2] PIXEL

    @ 116,207 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL
    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T06] FWLayer: linhas por porcentagem da altura, colunas por porcentagem da largura.
Static Function ASPT06()
    Local oDlg, oLayer, oPnl1, oPnl2, oPnl3, oWin

    DEFINE MSDIALOG oDlg TITLE "[ASP-T06] FWLayer" FROM 000,000 TO 450,700 PIXEL

    oLayer := FWLayer():New()
    oLayer:Init(oDlg, .F.)
    oLayer:AddLine("CIMA", 40, .F.)
    oLayer:AddLine("BAIXO", 60, .F.)
    oLayer:AddCollumn("COL1", 30, .T., "CIMA")
    oLayer:AddCollumn("COL2", 40, .T., "CIMA")
    oLayer:AddCollumn("COL3", 30, .T., "CIMA")
    oLayer:AddCollumn("COLB", 100, .T., "BAIXO")
    oLayer:AddWindow("COLB", "WIN1", "Janela (100%)", 100, .F., .F., , "BAIXO")

    oPnl1 := oLayer:getColPanel("COL1", "CIMA")
    oPnl2 := oLayer:getColPanel("COL2", "CIMA")
    oPnl3 := oLayer:getColPanel("COL3", "CIMA")
    oWin  := oLayer:getWinPanel("COLB", "WIN1", "BAIXO")

    TSay():New(005,005,{||"COL1 (30%)"},oPnl1,,,,,,.T.,,,060,008)
    TSay():New(005,005,{||"COL2 (40%)"},oPnl2,,,,,,.T.,,,060,008)
    TSay():New(005,005,{||"COL3 (30%)"},oPnl3,,,,,,.T.,,,060,008)
    TButton():New(005,005,"Fechar",oWin,{||oDlg:End()},037,012,,,,.T.)

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T07] EnchoiceBar no topo com botões extras. O SAY da linha 021 fica logo abaixo da
// barra (a prévia supõe 40 px de altura).
Static Function ASPT07()
    Local oDlg
    Local cCod := Space(6)
    Local aButtons := {}

    aAdd(aButtons, {"BMPINCLUIR", {|| MsgInfo("Extra 1")}, "Ação extra 1"})
    aAdd(aButtons, {"BMPALTERAR", {|| MsgInfo("Extra 2")}, "Ação extra 2"})

    DEFINE MSDIALOG oDlg TITLE "[ASP-T07] EnchoiceBar" FROM 000,000 TO 250,500 PIXEL

    @ 021,005 SAY "Linha 021: logo abaixo da barra" SIZE 120,008 OF oDlg PIXEL
    @ 035,005 SAY "Código:" SIZE 040,008 OF oDlg PIXEL
    @ 035,050 MSGET cCod SIZE 050,010 OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg, {|| oDlg:End()}, {|| oDlg:End()},, aButtons)
Return

// [ASP-T08] Grades: TWBrowse (classe) e LISTBOX ... FIELDS (comando).
Static Function ASPT08()
    Local oDlg, oBrw, oLbx
    Local aDados := {{"001","Primeiro","10,00"},{"002","Segundo","20,00"},{"003","Terceiro","30,00"}}

    DEFINE MSDIALOG oDlg TITLE "[ASP-T08] Grades" FROM 000,000 TO 340,500 PIXEL

    oBrw := TWBrowse():New(005,005,240,060,,{"Código","Descrição","Valor"},,oDlg)
    oBrw:SetArray(aDados)
    oBrw:bLine := {|| {aDados[oBrw:nAt,1], aDados[oBrw:nAt,2], aDados[oBrw:nAt,3]}}

    @ 070,005 LISTBOX oLbx FIELDS HEADER "Código","Descrição" SIZE 240,060 OF oDlg PIXEL
    oLbx:SetArray(aDados)
    oLbx:bLine := {|| {aDados[oLbx:nAt,1], aDados[oLbx:nAt,2]}}

    @ 136,207 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL
    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T09] TSimpleEditor, TScrollBox, TSplitter, TMeter e TBtnBmp2 (este último em pixels
// reais de tela, segundo fonte não oficial: conferir posição e tamanho).
Static Function ASPT09()
    Local oDlg, oEdit, oScr, oSpl, oP1, oP2, oMeter, oM2, oBtn
    Local nPos := 40

    DEFINE MSDIALOG oDlg TITLE "[ASP-T09] Classes adicionais" FROM 000,000 TO 400,600 PIXEL

    oEdit := TSimpleEditor():New(005,005,oDlg,140,060,"Texto do TSimpleEditor",,,,.T.)
    oScr := TScrollBox():New(oDlg,005,150,060,140,.T.,.T.,.T.)
    TSay():New(010,010,{||"Dentro do TScrollBox (010,010)"},oScr,,,,,,.T.,,,110,008)

    oSpl := TSplitter():New(070,005,oDlg,285,050)
    oP1 := TPanel():New(0,0,"Splitter: painel 1",oSpl,,.T.,,CLR_BLACK,CLR_HGRAY,10,10)
    oP2 := TPanel():New(0,0,"Splitter: painel 2",oSpl,,.T.,,CLR_BLACK,CLR_WHITE,10,10)

    oMeter := TMeter():New(125,005,{|u| If(PCount()>0,nPos:=u,nPos)},100,oDlg,140,008,,.T.)
    @ 125,150 METER oM2 VAR nPos TOTAL 100 SIZE 140,008 OF oDlg PIXEL

    // TBtnBmp2 em (280,300) com 52 x 52: se usasse o fator 2 sairia da janela
    oBtn := TBtnBmp2():New(280,300,52,52,"OK",,,,{|| oDlg:End()},oDlg,"Fechar")

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T10] Textos maiores que o SIZE e larguras: confere a estimativa de largura do texto
// (ASP003) e a fonte do WebApp.
Static Function ASPT10()
    Local oDlg

    DEFINE MSDIALOG oDlg TITLE "[ASP-T10] Textos e larguras" FROM 000,000 TO 260,500 PIXEL

    @ 005,005 SAY "Texto que cabe" SIZE 060,008 OF oDlg PIXEL
    @ 020,005 SAY "Um texto bem mais comprido que o SIZE informado" SIZE 060,008 OF oDlg PIXEL
    @ 035,005 SAY "1234567890123456789012345678901234567890" SIZE 240,008 OF oDlg PIXEL
    @ 050,005 SAY "MMMMMMMMMMMMMMMMMMMM" SIZE 240,008 OF oDlg PIXEL
    @ 065,005 SAY "iiiiiiiiiiiiiiiiiiii" SIZE 240,008 OF oDlg PIXEL
    @ 085,005 BUTTON "OK" SIZE 037,012 OF oDlg PIXEL
    @ 085,050 BUTTON "Botão com texto longo" SIZE 037,012 OF oDlg PIXEL
    @ 085,095 BUTTON "Botão com texto longo" SIZE 080,012 OF oDlg PIXEL
    @ 098,207 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T11] MsMGet com aPos literal {topo, esquerda, base, direita}: confere a escala do aPos.
// Precisa de ambiente aberto (empresa/filial) com a tabela SA1.
Static Function ASPT11()
    Local oDlg, oEnch

    If Type("cEmpAnt") <> "C"
        MsgStop("[ASP-T11] precisa de um ambiente aberto (empresa/filial).")
        Return
    EndIf

    RegToMemory("SA1", .T.)
    DEFINE MSDIALOG oDlg TITLE "[ASP-T11] MsMGet (precisa de ambiente)" FROM 000,000 TO 400,600 PIXEL
    oEnch := MsMGet():New("SA1", 0, 3,,,,, {022,002,180,296},, 3,,,, oDlg)
    ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg, {|| oDlg:End()}, {|| oDlg:End()})
Return

// [ASP-T12a] / [ASP-T12b] If e Do Case com nOpc vindo do parâmetro. Na prévia, escolha o
// ramo em "Condições" (nOpc == 3 ou nOpc == 4) para comparar com cada print.
Static Function ASPT12(nOpc)
    Local oDlg
    Local cCod := Space(6)
    Local cTit := IIf(nOpc == 3, "[ASP-T12a] Condicional (nOpc = 3)", "[ASP-T12b] Condicional (nOpc = 4)")

    DEFINE MSDIALOG oDlg TITLE cTit FROM 000,000 TO 220,400 PIXEL

    @ 010,010 SAY "Código:" SIZE 040,008 OF oDlg PIXEL
    If nOpc == 3
        @ 010,050 MSGET cCod SIZE 040,010 OF oDlg PIXEL
    Else
        @ 010,050 SAY "(somente leitura)" SIZE 070,008 OF oDlg PIXEL
    EndIf

    Do Case
    Case nOpc == 3
        @ 080,110 BUTTON "Incluir" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL
    Case nOpc == 4
        @ 080,110 BUTTON "Alterar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL
    EndCase
    @ 080,152 BUTTON "Fechar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED
Return

// [ASP-T13] Controles criados por funções auxiliares e por While com contador.
Static Function ASPT13()
    Local oDlg, nI := 1
    Local aRot := {"Um", "Dois", "Três"}

    DEFINE MSDIALOG oDlg TITLE "[ASP-T13] Funções auxiliares e While" FROM 000,000 TO 220,400 PIXEL

    ASPCAMPO(oDlg, 010, "Código:")
    ASPCAMPO(oDlg, 025, "Nome:")
    While nI <= Len(aRot)
        @ 045,ASPCOLUNA(nI) SAY aRot[nI] SIZE 050,008 OF oDlg PIXEL
        nI++
    EndDo
    ASPBOTAO(oDlg, 080, 152, "Fechar")

    ACTIVATE MSDIALOG oDlg CENTERED
Return

Static Function ASPCAMPO(oWnd, nLin, cRotulo)
    Local cVar := Space(20)
    @ nLin,010 SAY cRotulo SIZE 040,008 OF oWnd PIXEL
    @ nLin,055 MSGET cVar SIZE 080,010 OF oWnd PIXEL
Return

Static Function ASPBOTAO(oWnd, nLin, nCol, cTexto)
    Local oBtn
    oBtn := TButton():New(nLin, nCol, cTexto, oWnd, {|| oWnd:End()}, 037, 012,,,,.T.)
Return oBtn

Static Function ASPCOLUNA(nIdx)
Return 10 + (nIdx - 1) * 60
