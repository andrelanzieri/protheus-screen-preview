#include "protheus.ch"

/*/{Protheus.doc} TelaCmd
Tela simples com SAY/GET/BUTTON em sintaxe de comandos.
/*/
User Function TelaCmd()
    Local oDlg
    Local cCod  := Space(6)
    Local cNome := Space(40)

    DEFINE MSDIALOG oDlg TITLE "Cadastro simples" FROM 000,000 TO 200,400 PIXEL

    @ 010,010 SAY "Código:" SIZE 040,008 OF oDlg PIXEL
    @ 010,050 MSGET cCod SIZE 040,010 OF oDlg PIXEL
    @ 025,010 SAY "Nome:" SIZE 040,008 OF oDlg PIXEL
    @ 025,050 MSGET cNome SIZE 140,010 OF oDlg PIXEL
    @ 065,110 BUTTON "Confirmar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL
    @ 065,152 BUTTON "Cancelar" SIZE 037,012 ACTION oDlg:End() OF oDlg PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED
Return
