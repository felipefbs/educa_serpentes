#import "formatacao.typ": *

#abnt-setup()
#let titulo = "INTERVENÇÕES EDUCATIVAS COMO ESTRATÉGIA PARA MUDANÇA EMOCIONAL E ATITUDINAL SOBRE SERPENTES NO ENSINO SUPERIOR"
#let autores = "Mayara Olinto Vicente"

#set document(
  title: titulo,
  author: autores,
  date: auto,
)

#artigo-cabecalho(
  titulo,
  autores,
  filiacao: "Universidade Federal",
  data: "2026",
)

#include "resumo.typ"

#include "abstract.typ"

#include "introducao.typ"

#include "materiais_e_metodos.typ"

#include "resultados_e_discussao.typ"

#include "consideracoes_finais.typ"

#include "agradecimentos.typ"

#bibliography("referencias.bib")
