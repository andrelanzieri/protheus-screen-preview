# Changelog

## 1.3.0 (2026-11-17)

Primeira versão no Visual Studio Marketplace.

- Novo nome: **Protheus Screen Preview** (ID `andrelanzieri.protheus-screen-preview`). As configurações continuam com o prefixo `advplScreenPreview.`.
- ASP004 não acusa mais o SAY (ou CheckBox) 1 a 2 unidades abaixo do GET/ComboBox ao lado, o desnível usado para as letras ficarem na mesma altura.
- Miniatura do hover com altura limitada, para caber inteira no hover do VS Code junto com o link "Abrir na prévia".
- Corrigido: os snippets eram registrados também para a linguagem `tlpp`, que não existe no VS Code, e isso mostrava um erro ao abrir a pasta.
- `If/ElseIf/Else` e `Do Case`: condição calculável escolhe o ramo; condição desconhecida mostra todos, marcados, e o botão **Condições** da prévia escolhe o ramo de cada um (o layout é refeito). ASP001 ignora ramos exclusivos.
- `While` com contador é desdobrado (até 50 voltas); `n++`/`n--` como comando.
- Coordenadas calculadas por `Static`/`User Function` simples do próprio fonte (profundidade máxima 5).
- Funções auxiliares do próprio fonte que criam controles (sem criar diálogo) são expandidas onde são chamadas; os controles ficam bloqueados para edição pela prévia.
- Comparações com valor estimado deixam de decidir `If`/`IIf`.
- Classes novas: `TSimpleEditor`, `TScrollBox`, `TSplitter` (filhos em partes iguais, `SetOrient`), `TMeter`, `TBtnBmp2` (pixels reais) e `FWMarkBrowse` (`SetColumns`/`SetFields`, `Activate(oOwner)`); comandos `@ METER`, `@ SCROLLBOX` e `@ BTNBMP`. Assinaturas em `docs/referencia-construtores.md`.
- Ordem de foco na prévia (botão **Ordem de foco**) e regra ASP007.
- Comando **Nova tela (modelo)** com quatro modelos nas duas sintaxes, e snippets `telacmd`, `telacls`, `btncmd`.
- Medidas calibradas com prints do Protheus (WebApp): o `FROM/TO` com PIXEL é a área útil (+6 px de largura), barra de título de 28 px, EnchoiceBar de 60 px com "Outras Ações / Cancelar / Confirmar", abas do TFolder de 35 px e largura igual, margens das janelas do FWLayer, divisória do TSplitter de 5 px, fonte Arial 11, SAY com quebra de linha, TMeter vazio e fatores sem PIXEL (SAY/GET 16 × 26, BUTTON 8 × ~20,3, diálogo 8 × 16 + 12).
- Quick fix do ASP006 com uma segunda opção: **EnchoiceBar (Confirmar/Cancelar) no ON INIT** (cláusula `ON INIT` no `ACTIVATE`, ou o 7º parâmetro `bInit` de `oDlg:Activate(...)`). Não aparece quando o diálogo já tem `ON INIT`/`bInit`.
- Paleta: o controle solto encaixa nas guias inteligentes (bordas e centros dos vizinhos e do contêiner), como ao arrastar; o fantasma mostra onde o controle vai cair. `Alt` solta sem encaixe.
- `samples/ASPVALID.prw`: menu `U_ASPVALID` com telas de teste identificadas por `[ASP-Txx]`, para comparar a prévia com o Protheus; `npm run validacao` gera a prévia de referência dessas telas.

## 1.2.0 (interna)

- Paleta de controles: arrastar para a tela (ou para um painel/aba) gera o código no estilo do fonte e declara as variáveis como `Local`.
- Painel de propriedades: linha, coluna, largura, altura, texto, itens/abas e `Align`, para um ou vários controles.
- Excluir (`Delete`, com confirmação quando há filhos), duplicar (`Ctrl+D`), copiar (`Ctrl+C`, também para o editor) e colar (`Ctrl+V`) em outro painel/aba do mesmo fonte.
- Guias inteligentes no arraste e no redimensionamento (`advplScreenPreview.smartGuides`).
- Itens de `RADIO ... ITEMS "A","B"` e abas de `FOLDER ... PROMPTS` passam a ser editáveis.

## 1.1.0 (interna)

- Correção automática dos diagnósticos (Code Actions): ASP002 traz o controle para dentro da área útil, ASP003 aumenta a largura, ASP004 alinha à coluna/linha do vizinho (e "alinhar todos" do arquivo, `source.fixAll.advplScreenPreview`), ASP006 insere um botão Fechar no estilo do fonte. Todos têm também "Mostrar na prévia".
- Hover no fonte com tipo, posição/tamanho (código e px), bloqueio, avisos e miniatura SVG da tela.
- Exportar a tela como PNG (2x) ou SVG (botão na prévia e comando `advplScreenPreview.exportImage`), a partir de um renderizador SVG próprio.
- Barra de status com telas e avisos do fonte ativo (`advplScreenPreview.statusBar.enabled`).
- A prévia reabre depois de recarregar a janela (`WebviewPanelSerializer`).
- Modelo guarda mais referências ao fonte (trecho de cada comando, comandos relacionados à variável, literal do texto, itens, dono, `ACTIVATE` e o ponto de inserção de `Local` de cada função), base para a edição visual da 1.2.
- Gerador de código (`src/core/codegen.ts`) e perfil de estilo do fonte (`src/core/style.ts`): sintaxe, indentação, zeros à esquerda, caixa das palavras-chave, aspas e fim de linha.
- CI no GitHub Actions.

## 1.0.0

Primeira versão.

- Prévia somente leitura das telas AdvPL/TLPP no estilo do SmartClient WebApp, a partir do código-fonte (sem compilar).
- Parser de comandos (`DEFINE MSDIALOG`, `@ ... SAY/MSGET/GET/BUTTON/CHECKBOX/COMBOBOX/RADIO/GROUP/LISTBOX/MULTIGET/BITMAP/FOLDER/BROWSE`, `DEFINE SBUTTON`, `ACTIVATE`, com os sinônimos confirmados `GET ... MULTILINE|TEXT|MEMO`, `BITMAP NAME|RESNAME|DISK` e `[COLUMN] BROWSE ... HEAD`) e de classes (`MsDialog`, `TDialog`, `TSay`, `TGet`, `TButton`, `TCheckBox`, `TComboBox`, `TRadMenu`, `TGroup`, `TListBox`, `TWBrowse`, `TCBrowse`, `TMultiGet`, `TBitmap`, `TPanel`, `TFolder`, `MsNewGetDados`, `FWBrowse`, `FWLayer`, `EnchoiceBar`, `MsMGet`, `Enchoice`), unidos num único modelo.
- Tokenizador próprio (continuação `;`, comentários `//`, `/* */`, `&&`, `*`, strings `"`, `'`, `[ ]`), `#define`/`#include` (fonte e `.ch` do workspace) e `#ifdef`.
- Avaliador de expressões (literais, `+ - * /`, `Int()`, variáveis com `:=`/`+=`/`-=`, `oDlg:nClientWidth/nClientHeight`), desdobramento de `For` (até 50 iterações) e marcação de posições estimadas.
- Layout com `Align` empilhado, `TFolder` (abas clicáveis), `FWLayer` (porcentagens), `EnchoiceBar` (com botões extras) e `MsMGet`/`Enchoice` como área reservada.
- Sincronização cursor ↔ controle, destaque de linha e TreeView "Controles da tela".
- Edição visual: arrastar, redimensionar, encaixe na grade (`Alt` desliga), setas, seleção múltipla, alinhar/igualar/distribuir. Um `WorkspaceEdit` por ação, preservando o formato dos números e o encoding.
- Validações ASP001 a ASP006 na aba Problemas, cada uma configurável.
- Tema claro/escuro da tela (`auto`, `light`, `dark`), com botão por sessão.
- Integração opcional com o TDS (`generatePPO`), desligada por padrão.
- Interface em português do Brasil, com `package.nls` e `l10n` prontos para outros idiomas (inclui `package.nls.en.json`).
