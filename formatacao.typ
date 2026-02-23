// abnt.typ — configuração básica ABNT para artigos

// Ajustes gerais de página e texto (inspirados em práticas ABNT)
#let abnt-setup() = {
  // Página A4 e margens usuais em trabalhos acadêmicos
  set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2cm, left: 3cm, right: 2cm),
  )

  // Corpo do texto: fonte 12, alinhado e com espaçamento simples (conforme normas editoriais)
  set text(
    font: "Times New Roman",
    size: 12pt,
  )

  set par(
    leading: 1em,
    justify: true,
    first-line-indent: 1.25cm,
  )

  // Numeração progressiva das seções (NBR 6024)
  set heading(
    numbering: "1.",
    outlined: true,
  )

  // Estilo para seções de nível 1 (títulos principais)
  show heading.where(level: 1): it => {
    set block(above: 24pt, below: 24pt)
    set text(weight: "bold", size: 12pt)
    it
  }

  // Estilo para seções de nível 2
  show heading.where(level: 2): it => {
    set block(above: 18pt, below: 18pt)
    set text(weight: "bold", size: 12pt)
    it
  }

  // Notas de rodapé com numeração arábica consecutiva (NBR 6022/10520)
  set footnote(numbering: "1")
}

// Cabeçalho de artigo (estrutura geral NBR 6022)
#let artigo-cabecalho(titulo, autor, filiacao: none, data: datetime) = {
  align(center)[
    #strong(titulo)
    #if autor != none [
      // #linebreak() #autor
    ]
    #if filiacao != none [
      #linebreak() #filiacao
    ]
    #if data != none [
      #linebreak() #data
    ]
  ]
  v(18pt)
}

// Resumo em português (NBR 6028)
#let resumo(body, keywords: ()) = {
  set par(first-line-indent: 0pt, leading: 1em, justify: true)

  align(center)[
    strong("RESUMO")
  ]
  v(6pt)

  body

  if keywords.len() > 0 {
    v(12pt)
    strong("Palavras-chave: ")
    keywords.join("; ") + "."
  }
}

// Abstract em língua estrangeira (NBR 6028 adaptada)
#let abstract(body, keywords: ()) = {
  set par(first-line-indent: 0pt, leading: 1em, justify: true)

  align(center)[
    strong("ABSTRACT")
  ]
  v(6pt)

  body

  if keywords.len() > 0 {
    v(6pt)
    strong("Keywords: ")
    keywords.join("; ") + "."
  }
}

// Citações no sistema autor-data (NBR 10520, forma básica)
#let cit_autor_data(autor, ano, pagina: none) = {
  if pagina == none {
    [#autor.upper(), #ano]
  } else {
    [#autor.upper(), #ano, p.~#pagina]
  }
}

// Citação autor-data entre parênteses
#let cit_parentetica(autor, ano, pagina: none) = {
  if pagina == none {
    [(#autor.upper(), #ano)]
  } else {
    [(#autor.upper(), #ano, p.~#pagina)]
  }
}

// Seção de referências (estrutura geral NBR 6023)
#let referencias(conteudo) = {
  pagebreak()

  align(center)[
    strong("REFERÊNCIAS")
  ]

  v(12pt)

  set par(
    first-line-indent: 0pt,
    hanging-indent: 1.25cm,
    leading: 1em,
    justify: true,
  )

  conteudo
}

// Citação longa (mais de 3 linhas) - NBR 10520
// Usa fonte 11pt, recuo de 4cm da margem esquerda, sem aspas
#let citacao-longa(body) = {
  set text(size: 11pt)
  set par(
    first-line-indent: 4cm,
    leading: 1em,
    justify: true,
  )
  body
}
