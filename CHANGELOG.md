# Changelog

## 2.0.0

- Aviso **ASP008** (informação): classe que a prévia não desenha (`DbTree`, `TTree`, `TGrid`, `TButtonBar`, `TSpinBox`...), criada sobre um diálogo ou controle da tela. Antes o controle sumia sem aviso. Pode ser desligado em `advplScreenPreview.rules.ASP008`.
- **Exportar todas as telas** do fonte de uma vez, em PNG ou SVG: um arquivo por tela na pasta escolhida, com confirmação antes de substituir.
- Botão **Copiar** na prévia: põe a tela como imagem PNG (2x) na área de transferência.
- Fontes e cores do código na prévia, na imagem exportada e na miniatura do hover: `TFont():New`, `DEFINE FONT`, `FONT oFont`, `COLOR`/`COLORS`, `nClrText`/`nClrBack` dos construtores, `CLR_*` (sem precisar do `colors.ch`), `RGB()`, `SetFont`, `SetColor`, `oX:oFont`, `oX:nClrText`/`nClrPane` e o básico do `SetCss` (cor, fundo, tamanho, negrito, itálico). O `COLORS 0, 16777215` que o desenhador de telas grava em todo controle continua seguindo o tema. Num fundo colorido, o texto sem cor própria fica escuro ou claro para continuar legível no tema escuro.
- Estado dos controles: `WHEN .F.`, `{|| .F.}`, `Disable()` e `lActive := .F.` aparecem esmaecidos; `lReadOnly` (também no `TGet():New` e no MEMO) em cinza; `Hide()` e `lVisible := .F.` ficam bem apagados e tracejados na prévia e fora da imagem exportada. Um painel desabilitado ou oculto vale para o que está dentro. Desabilitados e ocultos saem da ordem de foco, e ocultos não contam no aviso de sobreposição (ASP001). Tooltip, hover e painel de propriedades mostram a fonte, as cores e o comando que desabilita ou oculta.
- `TGet():New` com `lPassword` e `lHasButton` agora aparece com os pontos e a lupa.
- Painel de propriedades com **cor do texto, cor de fundo e fonte** (nome, tamanho, negrito, itálico e sublinhado), gravadas no fonte: cláusulas `COLORS`/`FONT` nos comandos, parâmetros do `New` nas classes ou `oX:SetColor`/`oX:SetFont` depois da criação. Cada controle ganha o próprio `TFont():New(...)`, sem mexer numa fonte usada por outros. O botão ↺ volta a cor ao padrão do tema. Bloqueado quando a cor ou a fonte vem de um `SetCss`, em controles de laço ou de função auxiliar, e quando o controle não está numa variável e o comando não tem a cláusula.
- `DEFINE SBUTTON ... DISABLE` aparece desabilitado.
- `Ctrl+Z` e `Ctrl+Y` (ou `Ctrl+Shift+Z`) na prévia desfazem e refazem a última alteração no fonte, sem precisar voltar ao editor.

## 1.4.0 (2026-11-17)

- Telas dimensionadas pela resolução: `MsAdvSize`, `MsObjSize`, `GetScreenRes`, `FWGetDialogSize`, `TranslateBottom` e `oMainWnd:nTop/nBottom/nRight...` agora usam uma tela simulada (padrão 1366 x 768; configurações `screenWidth`/`screenHeight`). Antes o diálogo virava 40 x 48 px. O tamanho aparece como estimado.
- `oGetD:oBrowse:Align` alinha a grade (`MsNewGetDados():New(0,0,0,0,...)` não fica mais com 0 x 0).
- Índice com vírgula em coordenadas: `aPosObj[1,2]`.
- `If` com condição desconhecida: uma atribuição dentro de um ramo não decide mais o `If` seguinte (diálogos sumiam da prévia).
- Sintaxe rwmake: `@ t,l TO b,r DIALOG oDlg TITLE ...` cria o diálogo (antes virava um grupo e a tela sumia), e os comandos `@` dentro dele são em pixels.
- `@ ... BMPBUTTON TYPE n` (SButton), `@ ... JPEG` e `@ ... REPOSITORY` (imagem).
- `@ lin,col PSAY` (impressão de relatório) não gera mais aviso "Comando @ não reconhecido".
- Cláusula colada em parênteses depois de um valor (`SIZE 92,12 Action(...)`) não é mais lida como parte do `SIZE`.
- Funções de cálculo do fonte com `If`/`Do Case`, como a `C(nTam)` do desenhador de telas: condição desconhecida segue o `Else`/`Otherwise` e o valor fica estimado.
- `SAY` sem `SIZE`: espaços e TABs no fim do texto não contam na largura estimada.
- `If` sobre variável alterada por `aAdd`, passagem por referência (`@aDados`), bloco (`{|| lExec := ...}`) ou `Default` de parâmetro não descarta mais a tela pelo valor inicial.

## 1.3.0 (2026-11-17)

Primeira versão no Visual Studio Marketplace.

- Prévia, ao lado do editor, das telas AdvPL/TLPP escritas com comandos (`DEFINE MSDIALOG`, `@ ... SAY`...) ou com classes (`MsDialog`, `TSay`...), com a aparência do SmartClient WebApp.
- `Align`, `TFolder`, `FWLayer`, `TSplitter`, `TScrollBox`, `EnchoiceBar`, `MsMGet`/`Enchoice` (área reservada) e grades.
- Coordenadas com variáveis, contas, `#define`, laços `For`/`While` e funções do próprio fonte; `If`/`Do Case` com escolha do ramo pelo botão **Condições**.
- Montagem visual: paleta de controles, mover e redimensionar com grade e guias, painel de propriedades, alinhar e distribuir, excluir, duplicar, copiar e colar.
- Comando **Nova tela (modelo)** e snippets `telacmd`, `telacls` e `btncmd`.
- Avisos ASP001 a ASP007 na aba Problemas, com correção automática.
- Hover no fonte com posição, tamanho, avisos e miniatura da tela.
- Exportar a tela como PNG ou SVG, ordem de foco, árvore "Controles da tela", barra de status e tema claro/escuro.
