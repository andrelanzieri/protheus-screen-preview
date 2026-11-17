#include "totvs.ch"

// TPanel com Align aninhado.
User Function TelaPnl()
    Local oDlg, oTop, oBottom, oLeft, oClient, oInner

    oDlg := TDialog():New(0,0,400,600,"Painéis com Align",,,,,,,,,.T.)

    oTop := TPanel():New(0,0,"Topo",oDlg,,.T.,,,,0,20)
    oTop:Align := CONTROL_ALIGN_TOP

    oBottom := TPanel():New(0,0,,oDlg,,,,,,0,20)
    oBottom:Align := CONTROL_ALIGN_BOTTOM
    TButton():New(4,240,"Fechar",oBottom,{|| oDlg:End()},45,12,,,,.T.)

    oLeft := TPanel():New(0,0,"Menu",oDlg,,,,,,60,0)
    oLeft:Align := CONTROL_ALIGN_LEFT

    oClient := TPanel():New(0,0,,oDlg,,,,,,0,0)
    oClient:Align := CONTROL_ALIGN_ALLCLIENT

    oInner := TPanel():New(0,0,"Rodapé interno",oClient,,,,,,0,15)
    oInner:Align := CONTROL_ALIGN_BOTTOM
    TSay():New(10,10,{|| "Conteúdo"},oClient,,,,,,.T.,,,60,10)

    oDlg:Activate(,,,.T.)
Return
