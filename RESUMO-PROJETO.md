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
- Campo de observações livre que aparece no final do PDF e no XLS
- Botão WhatsApp após gerar PDF (desktop) / share nativo (mobile)

### Conta e nuvem (Supabase)
- Login/cadastro com e-mail e senha
- Cada empresa recebe um código de 6 caracteres para convidar vendedores
- Histórico de propostas sincronizado em nuvem entre todos da empresa
- Quando deslogado: histórico fica no localStorage do dispositivo

### Histórico
- Botão de relógio no rodapé (ao lado da assinatura)
- Salva automaticamente ao gerar PDF
- Reabrir ou excluir propostas salvas (com confirmação de exclusão)
- Exibe nome do vendedor quando em modo nuvem

### UX / Visual
- Tema claro e escuro automático (segue o sistema)
- Scrollbar fina e discreta
- Todos os modais limitados a 480px (alinhados ao app)
- Toast WhatsApp clicável após exportação
- Banner de atualização de preços quando planilha muda
- Modal de boas-vindas na primeira abertura
- Logo da empresa no topo: 42×42px com bordas arredondadas, fundo transparente

### PWA
- Instalável no celular (Android e iPhone) sem loja
- Ícone e splash screen com a logo oficial (logo.png — nova logo com "P" e checkmark)
- Service worker v2 com cache offline
- Manifest configurado com cores da marca

---

## Arquivos principais

| Arquivo | Função |
|---|---|
| `index.html` | App inteiro (HTML + CSS + JS) ~4074 linhas |
| `template-pdf.html` | Template da proposta em PDF |
| `manifest.json` | Configuração do PWA |
| `sw.js` | Service worker (cache v2, usa logo.png) |
| `logo.png` | Nova logo oficial — "P" azul com checkmark, fundo azul escuro |
| `supabase-schema.sql` | Script do banco de dados (Supabase) |
| `cpz-assinatura.png` | Assinatura da CPZ no rodapé |
| `screenshots/` | 5 screenshots do app para o README |

---

## Backend (Supabase)

- **Projeto:** propostasmart
- **URL:** https://dfjvlpsthsqahjhrtwgg.supabase.co
- **Tabelas:** `empresas`, `profiles`, `propostas`
- **Auth:** e-mail + senha, com trigger automático de criação de perfil
- **Segurança:** Row Level Security ativa — cada empresa só vê seus dados

---

## Bugs corrigidos (sessão 08/06/2026)

| Bug | Impacto |
|---|---|
| `orcapro_banco_ok` nunca era salvo → card de setup reaparecia em todo reload | Alto |
| `setDiasArmazena()` limpava estado do botão Contínua/Movimento | Médio |
| `exportarXLS()` não salvava campo Observações no `_clienteInfo` | Médio |
| CSS `.setup-file-btn` indefinido no painel de Logo | Baixo |
| Banner de atualização com `display:none` duplicado | Baixo |
| `excluirProposta()` sem confirmação antes de deletar | Médio |
| `renderHistorico()` mostrava "Carregando..." para localStorage | UX |
| `restaurarEstado()` chamava `calcular()` N vezes durante restore | Perf |
| CSS morto `.auth-pill`, função morta `abrirConfigBanco()` removidos | Limpeza |
| Variáveis CSS `--resultado-bg`/`--resultado-shdw` indefinidas removidas | Limpeza |

---

## Próximos passos — Monetização (planejado)

### Arquitetura de venda 100% automática
Fluxo desejado pelo dono:
```
Cliente vê o app → clica "Comprar" → paga no checkout
       ↓
Plataforma de pagamento dispara webhook automático
       ↓
Supabase Edge Function cria a conta + envia e-mail com login
       ↓
Cliente entra no app e usa — sem contato manual
```

### O que precisa ser construído

| Peça | Ferramenta | Status |
|---|---|---|
| Gate de login obrigatório | Modificar `init()` no app | Pendente |
| Checkout + cobrança recorrente | Stripe / Cakto / Hotmart | A definir |
| Webhook → criar conta automático | Supabase Edge Function | Pendente |
| E-mail de boas-vindas com login | Resend (grátis até 3k/mês) | Pendente |
| Tabela `subscriptions` no Supabase | SQL schema | Pendente |
| Bloquear acesso se assinatura vencer | Checar no login | Pendente |

### Plataformas de pagamento avaliadas

| Plataforma | Taxa | PIX | País | Destaque |
|---|---|---|---|---|
| Hotmart | ~9.9% + R$1 | ✓ | BR | Popular, fácil |
| Kiwify | ~8.99% | ✓ | BR | Similar ao Hotmart |
| **Cakto** | **~4.99% + R$0.99** | ✓ | BR | Melhor custo BR |
| **Stripe** | **~3.4% + R$0.39** | ✓ | INT | Melhor custo geral |
| Lemon Squeezy | 5% + $0.50 | ✗ | INT | Bom para venda global |
| Paddle | 5% + $0.50 | ✗ | INT | MoR, resolve impostos |
| Asaas | ~1% PIX | ✓ | BR | Mais barato, mais técnico |

**Decisão pendente:** escolher plataforma antes de construir o sistema.

### Estratégia de distribuição
- Grupos WhatsApp/Telegram de técnicos de CFTV e instaladores
- Facebook: grupos "Instaladores de CFTV", "Segurança Eletrônica Brasil"
- Instagram/YouTube: demonstração gerando proposta em 2 minutos
- Parceria com distribuidores de câmeras (comissão por indicação)
- Play Store via TWA (para credibilidade + distribuição) — requer domínio próprio

### Modelo de preço sugerido
- Mensal: R$79–97/mês por empresa (time todo incluso)
- Anual: R$697–897 (~9 meses com desconto)
- Trial gratuito: 7 dias (a definir)

---

## Textos prontos para divulgação

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

*Atualizado em 08/06/2026 — PropostaSmart by CPZ Digital*
