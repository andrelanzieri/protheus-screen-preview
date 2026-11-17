#include "protheus.ch"

// Fixture com problemas propositais para ASP001..ASP006.
User Function Problemas()
    Local oDlg
    Local nX := U_Coord()
    Local cFora := Space(10)

    DEFINE MSDIALOG oDlg TITLE "Problemas" FROM 0,0 TO 200,300 PIXEL
    @ 010,010 SAY "Sobreposto A" SIZE 50,8 OF oDlg PIXEL
    @ 012,030 SAY "B" SIZE 50,8 OF oDlg PIXEL
    @ 030,120 MSGET cFora SIZE 60,10 OF oDlg PIXEL
    @ 050,010 SAY "Um texto muito comprido para o tamanho" SIZE 30,8 OF oDlg PIXEL
    @ 065,011 SAY "Quase alinhado" SIZE 50,8 OF oDlg PIXEL
    @ nX,010 SAY "Estimado" SIZE 30,8 OF oDlg PIXEL
    ACTIVATE MSDIALOG oDlg CENTERED
Return
