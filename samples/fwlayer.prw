#include "totvs.ch"

// FWLayer com duas linhas e três colunas.
User Function TelaLay()
    Local oDlg, oLayer, oPnl1, oPnl2, oPnl3, oWin, oBrw

    DEFINE MSDIALOG oDlg TITLE "FWLayer" FROM 0,0 TO 500,800 PIXEL

    oLayer := FWLayer():New()
    oLayer:Init(oDlg, .F.)

    oLayer:AddLine("CIMA", 40, .F.)
    oLayer:AddLine("BAIXO", 60, .F.)

    oLayer:AddCollumn("COL1", 30, .T., "CIMA")
    oLayer:AddCollumn("COL2", 40, .T., "CIMA")
    oLayer:AddCollumn("COL3", 30, .T., "CIMA")
    oLayer:AddCollumn("COLB1", 50, .T., "BAIXO")
    oLayer:AddCollumn("COLB2", 50, .T., "BAIXO")

    oLayer:AddWindow("COLB1", "WIN1", "Itens", 100, .F., .F., , "BAIXO")

    oPnl1 := oLayer:getColPanel("COL1", "CIMA")
    oPnl2 := oLayer:getColPanel("COL2", "CIMA")
    oPnl3 := oLayer:getColPanel("COL3", "CIMA")
    oWin  := oLayer:getWinPanel("COLB1", "WIN1", "BAIXO")

    TSay():New(5,5,{|| "Coluna 1"},oPnl1,,,,,,.T.,,,50,10)
    TSay():New(5,5,{|| "Coluna 2"},oPnl2,,,,,,.T.,,,50,10)
    TButton():New(5,5,"Fechar",oPnl3,{|| oDlg:End()},40,12,,,,.T.)
    oBrw := TWBrowse():New(0,0,0,0,,{"Código","Descrição","Valor"},,oWin)
    oBrw:Align := CONTROL_ALIGN_ALLCLIENT

    ACTIVATE MSDIALOG oDlg CENTERED
Return
