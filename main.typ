#set document(
  title: "INTERVENÇÕES EDUCATIVAS COMO ESTRATÉGIA PARA MUDANÇA EMOCIONAL E ATITUDINAL SOBRE SERPENTES NO ENSINO SUPERIOR",
  author: "Nome do Autor",
  date: auto,
)

#set page(
  paper: "a4",
  margin: (x: 3cm, y: 2.5cm),
)

#set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "pt",
)

#set par(
  justify: true,
  first-line-indent: 1.5cm,
)

#show heading: set text(12pt, weight: "bold")

#align(center)[
  #text(14pt, weight: "bold")[#context document.title]
]

#v(1cm)

#align(center)[
  #text(12pt)[#context document.author]
]

#v(2cm)

#include "resumo.typ"

#include "abstract.typ"

#include "introducao.typ"

#include "materiais_e_metodos.typ"

#include "resultados_e_discussao.typ"

#include "consideracoes_finais.typ"

#include "agradecimentos.typ"

#bibliography("referencias.bib")
