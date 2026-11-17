# Changelog

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
