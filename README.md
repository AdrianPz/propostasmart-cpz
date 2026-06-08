# PropostaSmart — Manual do Usuário

Gerador de propostas comerciais para empresas de segurança eletrônica e CFTV. Funciona 100% no navegador, pode ser instalado como app no celular e sincroniza propostas na nuvem entre dispositivos e equipe.

---

## Índice

1. [Primeiros passos](#1-primeiros-passos)
2. [Conta e equipe](#2-conta-e-equipe)
3. [Banco de dados](#3-banco-de-dados)
4. [Montando o orçamento](#4-montando-o-orçamento)
5. [Cálculo do valor final](#5-cálculo-do-valor-final)
6. [Desconto e margem](#6-desconto-e-margem)
7. [Formas de pagamento](#7-formas-de-pagamento)
8. [Exportar proposta](#8-exportar-proposta)
9. [Histórico de propostas](#9-histórico-de-propostas)
10. [Menu de configurações](#10-menu-de-configurações-️)
11. [Instalar como app (PWA)](#11-instalar-como-app-pwa)
12. [Formato das planilhas](#12-formato-das-planilhas)
13. [Dúvidas frequentes](#13-dúvidas-frequentes)

---

## 1. Primeiros passos

Na primeira abertura, um modal de boas-vindas explica o fluxo inicial. Para começar:

1. Toque no ícone **⚙️ engrenagem** no rodapé
2. Na seção **Conta**, crie sua conta ou faça login
3. Na seção **Banco de dados**, conecte sua planilha de produtos
4. Configure nome da empresa, logo e valores de serviço

---

## 2. Conta e equipe

O PropostaSmart tem sistema de contas para sincronizar propostas entre dispositivos e equipe.

### Criar conta
1. Abra **⚙️ Configurações → Conta**
2. Escolha a aba **Criar conta**
3. Preencha nome, e-mail e senha
4. Escolha **Criar empresa** e informe o nome da empresa
5. Após o cadastro, um **código de 6 caracteres** é gerado para sua empresa

### Convidar vendedores
Compartilhe o código de 6 caracteres com outros vendedores. Eles criam a própria conta escolhendo **Entrar em empresa** e digitando o código.

### Quando logado
- Propostas salvas ficam na nuvem e aparecem para todos da equipe
- Cada proposta exibe o nome do vendedor que a criou
- Sincronização automática entre celular, tablet e computador

### Login / Logout
Acesse sempre por **⚙️ Configurações → Conta**.

---

## 3. Banco de dados

O app usa duas planilhas: uma de **produtos** (com código e preço) e uma de **infraestrutura** (itens de instalação).

### Conectar planilha Google Sheets (recomendado)

1. Abra sua planilha no Google Sheets
2. Vá em **Arquivo → Compartilhar → Publicar na web**
3. Selecione a aba correta, formato **CSV** e clique em **Publicar**
4. Copie o link e cole no campo correspondente em **⚙️ Configurações → Banco de dados**

### Conectar arquivo CSV local

1. Clique no botão ↑ ao lado do campo
2. Selecione o arquivo `.csv`
3. O arquivo é armazenado localmente — sem necessidade de internet depois

> **Dica:** Clique em **Exemplo** para baixar um CSV de exemplo com o formato correto.

### Atualização automática de preços

Se você usar URL do Google Sheets, o app verifica automaticamente ao abrir se a planilha foi alterada. Quando detecta mudança, exibe um banner amarelo com opção de **Atualizar** ou **Ignorar**.

---

## 4. Montando o orçamento

### Tipo de projeto

| Tipo | Quando usar |
|------|-------------|
| **Analógica** | Câmeras AHD, TVI, CVI ou CVBS com DVR |
| **IP** | Câmeras IP com NVR, PoE switch |
| **Wi-Fi** | Câmeras sem fio, NVR wireless |
| **Automação** | Controle de acesso, alarmes, integração |
| **Sensores** | Projetos de detecção sem câmeras |

### Adicionando produtos

1. Clique em **+ Produto**
2. Digite nome ou código no campo de busca — resultados aparecem em tempo real
3. Ajuste a quantidade com **+** e **−**
4. Para alterar o valor unitário, toque no preço em verde

> O badge **Total de câmeras** atualiza automaticamente contando itens com código `CAM-`.

### Adicionando infraestrutura

Itens de infra (eletrodutos, caixas, cabos, abraçadeiras etc.) ficam em seção separada e **não entram no multiplicador** — são somados diretamente ao custo.

### Serviço

- **Dias de trabalho:** dias que a equipe ficará no local
- **Funcionários no local:** número de pessoas por dia

Os valores de diária e deslocamento são configuráveis por funcionário em **⚙️ Configurações → Valores de serviço**.

---

## 5. Cálculo do valor final

```
Valor Final = arredondado((Equipamentos × Multiplicador + Despesas) / 50) × 50
```

**Despesas** = Deslocamento + Diárias + Infraestrutura

O **Multiplicador** varia por tipo de projeto e dificuldade (número de câmeras):

| Tipo | Fácil (≤8 câm.) | Médio (9–32 câm.) | Difícil (≥33 câm.) |
|------|:-:|:-:|:-:|
| Analógica | 1,6× | 1,7× | 1,7× |
| IP | 1,7× | 1,9× | 2,0× |
| Wi-Fi | 2,0× | 2,1× | 2,2× |
| Automação | 2,2× | 2,4× | 2,7× |
| Sensores | 2,0× | 2,2× | 2,3× |

> Multiplicadores ajustáveis em **⚙️ Configurações → Multiplicadores de preço**.

Toque em **Ver detalhes** no card de resultado para ver o breakdown completo.

---

## 6. Desconto e margem

### Desconto

O campo de desconto (0–50%) fica no card de resultado. O valor é arredondado para o múltiplo de R$ 50 mais próximo e aplicado em tempo real.

### Margem estimada

Abaixo do desconto, o app exibe a **margem bruta estimada** e o **lucro em R$** calculados com base nos custos reais (produtos + infra + deslocamento + diárias):

| Cor | Significado |
|-----|-------------|
| 🟢 Verde | Margem ≥ 30% — saudável |
| 🟡 Amarelo | Margem entre 15% e 30% — atenção |
| 🔴 Vermelho | Margem < 15% — perigoso |

> A margem é visível apenas no app — não aparece no PDF nem no Excel.

---

## 7. Formas de pagamento

Toque em **💳 Pagamento** para abrir a análise financeira.

### À vista (Pix)
- **50% + 50%:** metade na aprovação, metade na conclusão
- **2× a 6× Pix:** parcelas iguais sem acréscimo

### Boleto bancário (+5%)
- 2× a 6× mensais com acréscimo de 5% no total

### Cartão de crédito (+10%)
- 2× a 6× com acréscimo de 10% no total

Opções inviáveis (caixa acumulado negativo) ficam riscadas. Cada parcela exibe: valor recebido, saídas previstas e saldo acumulado.

---

## 8. Exportar proposta

Dentro do modal de pagamento, clique em **Exportar**. Preencha os dados do cliente:

| Campo | Descrição |
|-------|-----------|
| **Nome** | Nome do cliente (obrigatório) |
| **Telefone** | Para link automático do WhatsApp (obrigatório) |
| **E-mail** | Opcional, aparece na proposta |
| **Data** | Data do orçamento (padrão: hoje) |
| **Validade** | Prazo de validade em dias |
| **Prazo execução** | Dias úteis para conclusão |
| **Observações** | Texto livre que aparece no final do PDF |

### PDF
- Proposta profissional com dados do cliente, relação de materiais, tabela de pagamento e assinaturas
- **Celular:** abre o compartilhamento nativo (WhatsApp, e-mail, Drive etc.)
- **Computador:** salva o arquivo e exibe um botão **Enviar no WhatsApp** por 9 segundos

### Excel (.xlsx)
- **Aba Orçamento:** proposta completa formatada
- **Aba Financeiro:** análise de todas as formas de pagamento com viabilidade de caixa

> A proposta é salva automaticamente no histórico ao gerar o PDF.

---

## 9. Histórico de propostas

Acesse pelo ícone de **🕐 relógio** no rodapé (ao lado da assinatura).

- **Salvar proposta atual:** salva o orçamento com nome do cliente e valor total
- **Reabrir:** substitui o orçamento atual pela proposta salva (com confirmação)
- **Excluir:** remove a proposta do histórico

**Quando logado:** propostas ficam na nuvem, visíveis para todos da equipe, com o nome do vendedor que criou cada uma. Limite de 50 propostas.

**Quando deslogado:** propostas ficam no navegador (localStorage). Limite de 30.

---

## 10. Menu de configurações ⚙️

Acesse pelo ícone de engrenagem no rodapé (canto inferior direito).

### 👤 Conta
Login, cadastro e logout. Exibe nome, empresa e código de convite quando logado.

### 🏢 Nome da empresa
Nome exibido no subtítulo do app e em todos os documentos gerados.

### 🗄️ Banco de dados
Atualize os links ou arquivos CSV de produtos e infraestrutura.

### 🖼️ Logo da empresa
Envie a logo do dispositivo. Salva localmente e aparece no topo do app. Recomendado: **130 × 34 px**, PNG ou JPG.

### ✖️ Multiplicadores de preço
Fatores de markup por tipo de projeto e dificuldade.

### 💰 Valores de serviço
Diária por funcionário e custo de deslocamento por dia.

### 📋 Padrões da proposta
Prazo de execução, validade e garantia pré-preenchidos ao exportar.

---

## 11. Instalar como app (PWA)

O PropostaSmart pode ser instalado no celular como um app nativo, sem precisar da loja de aplicativos.

**Android (Chrome):**
- Acesse o app no Chrome → toque nos **3 pontos** → **Adicionar à tela inicial**
- Ou aguarde o banner de instalação aparecer automaticamente

**iPhone (Safari):**
- Acesse o app no Safari → toque em **Compartilhar** (ícone de caixa com seta) → **Adicionar à Tela de Início**

Após instalado, o app abre em tela cheia, sem barra do navegador, e funciona offline após a configuração inicial.

---

## 12. Formato das planilhas

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

## 13. Dúvidas frequentes

**O app funciona sem internet?**
Sim. Após a configuração inicial, funciona offline. Se usar arquivo CSV em vez de URL, nunca precisa de internet.

**Os dados ficam salvos se eu fechar o app?**
Sim. O orçamento em andamento, configurações e logo são salvos automaticamente. Quando logado, as propostas ficam na nuvem.

**Como limpar o orçamento atual?**
Toque no botão **↺** ao lado de **💳 Pagamento** para começar do zero. As configurações não são afetadas.

**Posso usar em vários dispositivos?**
Sim, quando logado. As propostas sincronizam automaticamente. As configurações locais (logo, banco de dados) precisam ser feitas em cada dispositivo.

**Como atualizo minha lista de produtos?**
Se usar URL do Google Sheets, o app detecta automaticamente quando a planilha muda e exibe um banner de atualização. Se usar arquivo CSV, vá em **⚙️ Configurações → Banco de dados** e envie o novo arquivo.

**Como compartilho o código da empresa com minha equipe?**
Vá em **⚙️ Configurações → Conta** e toque no código — ele é copiado automaticamente para a área de transferência.

---

*Desenvolvido por [CPZ Digital](https://cpzdigital.com.br)*
