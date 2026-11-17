#include "protheus.ch"

/*/{Protheus.doc} DemoPed
Tela de demonstração do Protheus Screen Preview.
/*/
User Function DemoPed()
    Local oDlg, oFld, oGrp
    Local cNum   := "000123"
    Local cCli   := Space(6)
    Local cNome  := Space(40)
    Local dEmis  := Date()
    Local cCond  := "001"
    Local cTipo  := "N"
    Local lUrg   := .F.
    Local nFrete := 1
    Local cObs   := ""
    Local aButtons := {}

    aAdd(aButtons, {"PESQUISA", {|| U_PedPesq()}, "Consultar cliente"})

    DEFINE MSDIALOG oDlg TITLE "Pedido de Venda" FROM 000,000 TO 420,640 PIXEL

    @ 025,005 GROUP oGrp TO 080,315 PROMPT "Cabeçalho" OF oDlg PIXEL
    @ 037,012 SAY "Número:" SIZE 030,008 OF oDlg PIXEL
    @ 035,045 MSGET cNum SIZE 040,010 OF oDlg PIXEL READONLY
    @ 037,100 SAY "Emissão:" SIZE 030,008 OF oDlg PIXEL
    @ 035,132 MSGET dEmis SIZE 050,010 OF oDlg PIXEL
    @ 037,195 SAY "Tipo:" SIZE 020,008 OF oDlg PIXEL
    @ 035,218 COMBOBOX cTipo ITEMS {"N=Normal","B=Bonificação","D=Devolução"} SIZE 090,010 OF oDlg PIXEL
    @ 055,012 SAY "Cliente:" SIZE 030,008 OF oDlg PIXEL
    @ 053,045 MSGET cCli SIZE 040,010 OF oDlg PIXEL F3 "SA1"
    @ 053,090 MSGET cNome SIZE 150,010 OF oDlg PIXEL
    @ 055,250 CHECKBOX lUrg PROMPT "Urgente" SIZE 050,008 OF oDlg PIXEL

    @ 085,005 FOLDER oFld PROMPTS "Pagamento","Entrega","Observações" SIZE 310,105 OF oDlg PIXEL
    @ 010,010 SAY "Condição:" SIZE 035,008 OF oFld:aDialogs[1] PIXEL
    @ 008,050 MSGET cCond SIZE 030,010 OF oFld:aDialogs[1] PIXEL F3 "SE4"
    @ 010,010 SAY "Frete:" SIZE 030,008 OF oFld:aDialogs[2] PIXEL
    @ 008,050 RADIO nFrete ITEMS "CIF","FOB","Sem frete" SIZE 060,030 OF oFld:aDialogs[2] PIXEL
    @ 005,005 GET cObs MEMO SIZE 295,080 OF oFld:aDialogs[3] PIXEL

    ACTIVATE MSDIALOG oDlg CENTERED ON INIT EnchoiceBar(oDlg, {|| oDlg:End()}, {|| oDlg:End()},, aButtons)
Return
