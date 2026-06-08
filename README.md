# PropostaSmart — Manual do Usuário

Gerador de propostas comerciais para empresas de segurança eletrônica e CFTV. Funciona 100% no navegador, sem instalação, sem internet obrigatória (após configuração inicial).

---

## Índice

1. [Primeira configuração](#1-primeira-configuração)
2. [Montando o orçamento](#2-montando-o-orçamento)
3. [Cálculo do valor final](#3-cálculo-do-valor-final)
4. [Formas de pagamento](#4-formas-de-pagamento)
5. [Exportar proposta](#5-exportar-proposta)
6. [Menu de configurações](#6-menu-de-configurações-️)
7. [Formato das planilhas](#7-formato-das-planilhas)
8. [Dúvidas frequentes](#8-dúvidas-frequentes)

---

## 1. Primeira configuração

Na primeira vez que abrir o app, aparece o card **Banco de dados**.

### Conectar planilha de produtos

Você tem duas opções:

**Opção A — Google Sheets (recomendado)**
1. Abra sua planilha no Google Sheets
2. Vá em **Arquivo → Compartilhar → Publicar na web**
3. Escolha a aba de produtos, formato **CSV** e clique em **Publicar**
4. Copie o link gerado e cole no campo **Produtos**

**Opção B — Arquivo CSV local**
1. Clique no botão de upload (ícone ↑) ao lado do campo
2. Selecione seu arquivo `.csv`
3. O arquivo é lido e armazenado localmente — não precisa de internet depois

Repita o processo para **Infraestrutura** e clique em **Salvar e continuar**.

> **Dica:** Baixe os arquivos de exemplo clicando em **Exemplo** para ver o formato esperado antes de montar sua planilha.

---

## 2. Montando o orçamento

### Tipo de projeto

Selecione o tipo que melhor descreve o projeto:

| Tipo | Quando usar |
|------|-------------|
| **Analógica** | Câmeras AHD, TVI, CVI ou CVBS com DVR |
| **IP** | Câmeras IP com NVR, PoE switch |
| **Wi-Fi** | Câmeras sem fio, NVR wireless |
| **Automação** | Controle de acesso, alarmes, integração |
| **Sensores** | Projetos de detecção sem câmeras |

### Adicionando produtos

1. Clique em **+ Produto**
2. Digite o nome ou código no campo de busca — os resultados aparecem em tempo real
3. Ajuste a quantidade com os botões **+** e **−**
4. Para alterar o valor unitário, toque no preço em verde — um campo de edição aparece

> O badge **Total de câmeras** atualiza automaticamente contando todos os itens com código `CAM-`.

### Adicionando infraestrutura

Itens de infra (eletrodutos, caixas, cabos de força, abraçadeiras, etc.) ficam em uma seção separada e **não entram no multiplicador** — são somados diretamente ao custo.

### Serviço

- **Dias de trabalho:** dias que a equipe estará no local (gera custo de diária + deslocamento)
- **Dias com diarista:** dias com ajudante extra (custo adicional por dia)

---

## 3. Cálculo do valor final

O valor final é calculado pela fórmula:

```
Valor Final = arredondado(( Equipamentos × Multiplicador + Despesas ) / 50) × 50
```

**Despesas** = Deslocamento + Diárias + Diarista + Infraestrutura

O **Multiplicador** varia por tipo de projeto e dificuldade:

| Tipo | Fácil (≤8 câm.) | Médio (9–32 câm.) | Difícil (≥33 câm.) |
|------|:-:|:-:|:-:|
| Analógica | 1,6× | 1,7× | 1,7× |
| IP | 1,7× | 1,9× | 2,0× |
| Wi-Fi | 2,0× | 2,1× | 2,2× |
| Automação | 2,2× | 2,4× | 2,7× |
| Sensores | 2,0× | 2,2× | 2,3× |

> Os multiplicadores podem ser ajustados em **⚙ Configurações → Multiplicadores de preço**.

Toque em **Ver detalhes** no card azul para ver o breakdown de equipamentos, infra e serviço.

---

## 4. Formas de pagamento

Toque em **💳 Pagamento** para abrir a análise financeira. O app simula o fluxo de caixa para cada opção e avisa quando uma parcela deixa o caixa negativo.

### À vista (Pix)
- **50% + 50%:** metade na aprovação, metade na conclusão
- **2× a 6× Pix:** parcelas iguais sem acréscimo

### Boleto bancário (+5%)
- 2× a 6× mensais com acréscimo de 5% no total

### Cartão de crédito (+10%)
- 2× a 6× com acréscimo de 10% no total

Opções marcadas como **inviáveis** (caixa acumulado negativo) ficam riscadas e bloqueadas — o app seleciona automaticamente a menor opção viável.

Cada parcela exibe:
- Valor que entra (recebe)
- Saídas previstas (material, infra, deslocamento, diarista, mão de obra)
- Saldo do período e caixa acumulado

---

## 5. Exportar proposta

Dentro do modal de pagamento, clique em **Exportar**.

Preencha os dados do cliente:

| Campo | Descrição |
|-------|-----------|
| **Nome** | Nome completo do cliente (obrigatório) |
| **Telefone** | Para link automático do WhatsApp (obrigatório) |
| **E-mail** | Opcional, aparece na proposta |
| **Data** | Data do orçamento (padrão: hoje) |
| **Validade** | Prazo de validade em dias (padrão: 15) |
| **Prazo execução** | Dias úteis para conclusão (padrão: 2) |

### PDF
- Proposta profissional com: dados do cliente, relação de materiais, tabela de pagamento e assinaturas
- No **celular:** abre o compartilhamento nativo (WhatsApp, e-mail, etc.)
- No **computador:** salva o arquivo e abre o WhatsApp Web automaticamente

### Excel (.xlsx)
- **Aba Orçamento:** proposta completa formatada
- **Aba Financeiro:** análise de todas as formas de pagamento (à vista, boleto e cartão) com viabilidade de caixa

---

## 6. Menu de configurações ⚙️

Acesse pelo botão de engrenagem no rodapé do app (canto inferior direito).

### 🗄️ Banco de dados
Atualize os links ou arquivos CSV de produtos e infraestrutura a qualquer momento.

### 🖼️ Logo da empresa
Envie a logo da empresa do seu dispositivo. A imagem é salva localmente no navegador e aparece no topo do app. Dimensões recomendadas: **130 × 34 px**, PNG ou JPG.

### ✖️ Multiplicadores de preço
Edite os fatores de multiplicação para cada combinação de tipo e dificuldade. As alterações são salvas automaticamente e aplicadas no próximo cálculo.

---

## 7. Formato das planilhas

### Planilha de produtos

| Coluna | Conteúdo | Exemplo |
|--------|----------|---------|
| A | Código do produto | `CAM-001` |
| B | Nome do produto | `Câmera Bullet 2MP Full HD` |
| C | Valor unitário (R$) | `150.00` |

**Prefixos de código reconhecidos:**

| Prefixo | Categoria |
|---------|-----------|
| `CAM-` | Câmeras |
| `DVR` / `NVR` | Gravadores |
| `ARM-` | Armazenamento |
| `CAB-` | Cabos |
| `INF-` | Infraestrutura |
| `SW` / `RED-` | Rede |
| `ENG-` | Energia |
| `AUT-` | Automação |
| *(outros)* | Acessórios |

### Planilha de infraestrutura

| Coluna | Conteúdo | Exemplo |
|--------|----------|---------|
| A | Nome do item | `Eletroduto 3/4" 3m` |
| B | Valor unitário (R$) | `12.50` |

---

## 8. Dúvidas frequentes

**O app funciona sem internet?**
Sim. Após a configuração inicial (carregamento dos produtos), o app funciona offline. Se usar arquivo CSV em vez de URL, nunca precisa de internet.

**Os dados ficam salvos se eu fechar o app?**
Sim. O orçamento em andamento, as configurações, a logo e os dados do banco são salvos automaticamente no navegador (localStorage).

**Como limpar o orçamento atual?**
Toque no botão circular (↺) ao lado de **💳 Pagamento** para apagar o orçamento atual e começar do zero. Os dados de configuração não são afetados.

**Posso usar em vários dispositivos?**
As configurações ficam salvas por dispositivo/navegador. Para usar em outro dispositivo, repita a configuração inicial (logo, banco de dados, multiplicadores).

**Como atualizo minha lista de produtos?**
Se estiver usando URL do Google Sheets, basta atualizar a planilha — o app carrega a versão mais recente ao abrir. Se estiver usando arquivo CSV, vá em **⚙ Configurações → Banco de dados** e envie o novo arquivo.

---

*Desenvolvido por [CPZ Digital](https://cpzdigital.com.br)*
