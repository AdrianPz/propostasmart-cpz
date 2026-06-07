# OrçaPro

Calculadora de orçamentos para empresas de segurança eletrônica. Gera propostas comerciais em PDF e planilhas Excel com análise de fluxo de caixa por forma de pagamento.

---

## Funcionalidades

- **Catálogo de produtos** via Google Sheets (câmeras, gravadores, cabos, infra, etc.)
- **Cálculo automático** com multiplicadores por tipo de projeto e dificuldade
- **Modal de pagamento** com análise de viabilidade para À Vista (Pix), Boleto e Cartão
- **Exportação PDF** — proposta profissional com tabela de parcelas, lista de materiais e assinatura
- **Exportação Excel** — orçamento completo + análise financeira de todos os cenários de pagamento
- **Persistência local** — o orçamento em andamento é salvo automaticamente no navegador
- **Design responsivo** — otimizado para celular (mobile-first), dark mode automático

---

## Configuração

Abra o arquivo `index.html` e edite o objeto `CONFIG` no início do `<script>`:

```js
const CONFIG = {
    empresa:     'Nome da Sua Empresa',
    responsavel: 'Nome do Responsável',
    cnpj:        '00.000.000/0001-00',
    telefone:    '(00) 00000-0000',
    email:       'contato@suaempresa.com.br',
    logo:        'logo.png',          // arquivo de imagem na mesma pasta (opcional)
    corPrimaria: '#0055b3',           // cor principal dos documentos gerados
    urlProdutos: 'https://...',       // URL da aba de produtos do Google Sheets (CSV)
    urlInfra:    'https://...',       // URL da aba de infraestrutura do Google Sheets (CSV)
};
```

### Planilha de produtos (Google Sheets)

A planilha deve estar publicada como CSV (`Arquivo → Compartilhar → Publicar na web → CSV`).

**Aba de Produtos** — colunas esperadas:

| Código | Nome | Valor |
|--------|------|-------|
| CAM-001 | Câmera bullet 2MP | 150.00 |

Prefixos de código reconhecidos para categorização automática:

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

**Aba de Infraestrutura** — colunas esperadas (coluna B = nome, coluna E = valor):

| ... | Nome | ... | ... | Valor |
|-----|------|-----|-----|-------|
| | Eletroduto 3/4" | | | 12.50 |

---

## Como usar

1. Adicione o arquivo `index.html` (e opcionalmente `logo.png`) em qualquer servidor web ou abra direto no navegador
2. Selecione o tipo de projeto e adicione os itens
3. Informe os dias de trabalho e dias com diarista
4. Clique em **Pagamento** para ver a análise por forma de pagamento
5. Clique em **Exportar** para gerar o PDF ou a planilha Excel

> Não é necessário instalar nada. O app funciona 100% no navegador, sem backend.

---

## Multiplicadores de preço

O valor final é calculado com base no custo dos materiais multiplicado por um fator de acordo com o tipo e a dificuldade do projeto:

| Tipo | Fácil | Médio | Difícil |
|------|-------|-------|---------|
| Analógica | 1,6× | 1,7× | 1,7× |
| IP | 1,7× | 1,9× | 2,0× |
| Wi-Fi | 2,0× | 2,1× | 2,2× |
| Automação | 2,2× | 2,4× | 2,7× |
| Sensores | 2,0× | 2,2× | 2,3× |

A dificuldade é definida pela quantidade de câmeras: até 8 = fácil, 9–32 = médio, 33+ = difícil.

---

## Tech stack

- HTML + CSS + JavaScript puro (sem frameworks, sem build)
- [html2pdf.js](https://github.com/eKoopmans/html2pdf.js) — geração de PDF
- [ExcelJS](https://github.com/exceljs/exceljs) — geração de planilhas `.xlsx`
- Google Sheets como banco de dados de produtos (CSV público)

---

## Licença

Distribuído sob licença privada. Uso permitido somente pelo licenciado.
