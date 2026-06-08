# PropostaSmart — Resumo do Projeto

## O que é

Gerador de propostas comerciais para empresas de segurança eletrônica e CFTV.
App web (PWA) que roda 100% no navegador, instalável no celular sem passar por loja.

**URL atual (GitHub Pages):** https://adrianpz.github.io/propostasmart-cpz/

---

## Funcionalidades implementadas

### Core
- Montagem de orçamento com produtos e infraestrutura via busca em tempo real
- Banco de dados via Google Sheets (CSV) ou arquivo local
- Tipos de projeto: Analógica, IP, Wi-Fi, Automação, Sensores
- Calculadora de armazenamento CFTV (resolução, dias, gravação contínua/movimento)
- Multiplicadores de preço por tipo e dificuldade (configuráveis)
- Valores de serviço por funcionário (diária e deslocamento)
- Desconto em tempo real (0–50%) com arredondamento inteligente
- Margem estimada e lucro bruto visível só no app (não vai pro PDF)

### Exportação
- PDF profissional com dados do cliente, materiais, pagamento, cláusula de aceite
- Excel (.xlsx) com aba de orçamento e aba financeira completa
- Campo de observações livre que aparece no final do PDF
- Botão WhatsApp após gerar PDF (desktop) / share nativo (mobile)

### Conta e nuvem (Supabase)
- Login/cadastro com e-mail e senha
- Cada empresa recebe um código de 6 caracteres para convidar vendedores
- Histórico de propostas sincronizado em nuvem entre todos da empresa
- Quando deslogado: histórico fica no localStorage do dispositivo

### Histórico
- Botão de relógio no rodapé (ao lado da assinatura)
- Salva automaticamente ao gerar PDF
- Reabrir ou excluir propostas salvas
- Exibe nome do vendedor quando em modo nuvem

### UX / Visual
- Tema claro e escuro automático (segue o sistema)
- Scrollbar fina e discreta
- Todos os modais limitados a 480px (alinhados ao app)
- Toast WhatsApp clicável após exportação
- Banner de atualização de preços quando planilha muda
- Modal de boas-vindas na primeira abertura

### PWA
- Instalável no celular (Android e iPhone) sem loja
- Ícone e splash screen com a logo oficial (logo.png)
- Service worker com cache offline
- Manifest configurado com cores da marca

---

## Arquivos principais

| Arquivo | Função |
|---|---|
| `index.html` | App inteiro (HTML + CSS + JS) |
| `template-pdf.html` | Template da proposta em PDF |
| `manifest.json` | Configuração do PWA |
| `sw.js` | Service worker (cache offline) |
| `logo.png` | Logo oficial do app |
| `supabase-schema.sql` | Script do banco de dados (Supabase) |
| `cpz-assinatura.png` | Assinatura da CPZ no rodapé |

---

## Backend (Supabase)

- **Projeto:** propostasmart
- **URL:** https://dfjvlpsthsqahjhrtwgg.supabase.co
- **Tabelas:** `empresas`, `profiles`, `propostas`
- **Auth:** e-mail + senha, com trigger automático de criação de perfil
- **Segurança:** Row Level Security ativa — cada empresa só vê seus dados

---

## Pendências / próximos passos

- [ ] Definir modelo de cobrança (mensalidade ~R$79/mês ou licença ~R$597)
- [ ] Definir canal de distribuição (não é o GitHub público — entregar arquivo configurado)
- [ ] Decidir sobre proteção de acesso antes de vender (senha por empresa ou login obrigatório)
- [ ] Atualizar listagem na Play Store / App Store quando for o momento
- [ ] Item 6 avançado: compartilhar banco de produtos entre vendedores da mesma empresa
- [ ] Item 7 avançado: histórico de versões de preços com diff de alterações

---

## Textos prontos para uso em divulgação

**Tagline curta:**
> Gere propostas profissionais de segurança eletrônica em segundos.

**Descrição média:**
> O PropostaSmart é um app para vendedores e técnicos de segurança eletrônica gerarem propostas comerciais completas diretamente do celular. Monte o orçamento, calcule a margem, simule as formas de pagamento e envie o PDF pelo WhatsApp — tudo em menos de 5 minutos.

**Descrição longa (Play Store / App Store):**
> Chega de planilha e papel. O PropostaSmart foi feito para empresas de CFTV, alarme e automação que querem fechar mais negócios com mais profissionalismo.
>
> Com o app você:
> • Monta orçamentos com seus produtos e preços em tempo real
> • Calcula automaticamente o valor do projeto com multiplicadores por tipo e dificuldade
> • Simula o fluxo de caixa para Pix, boleto e cartão
> • Gera PDF e Excel profissionais com um toque
> • Envia a proposta pelo WhatsApp diretamente do app
> • Salva o histórico de propostas na nuvem, acessível de qualquer dispositivo
> • Compartilha o histórico com toda a equipe de vendas em tempo real
>
> Funciona offline. Instala direto do navegador, sem passar pela loja. Tema claro e escuro automático.

---

*Gerado em 08/06/2026 — PropostaSmart by CPZ Digital*
