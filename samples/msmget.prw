#include "protheus.ch"

// MsMGet com Align e array literal de campos.
User Function TelaMGet()
    Local oDlg, oEnch
    Local aPos := {0,0,0,0}

    DEFINE MSDIALOG oDlg TITLE "Clientes" FROM 0,0 TO 400,640 PIXEL
    oEnch := MsMGet():New("SA1", SA1->(Recno()), 4,,,, {"A1_COD","A1_LOJA","A1_NOME","A1_END"}, aPos,,3,,,,oDlg)
    oEnch:oBox:Align := CONTROL_ALIGN_ALLCLIENT
    ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg, {|| oDlg:End()}, {|| oDlg:End()})
Return

// Enchoice em posição absoluta (aPos literal).
User Function TelaEnch()
    Local oDlg
    DEFINE MSDIALOG oDlg TITLE "Produtos" FROM 0,0 TO 300,400 PIXEL
    Enchoice("SB1", 0, 2,,,, {"B1_COD","B1_DESC"}, {010,005,120,195})
    ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg, {|| oDlg:End()}, {|| oDlg:End()})
Return
