#import "@local/report-template-typst:0.1.0": conf, azuluc3m

#show: conf.with(
  degree: "Degree in...",
  subject: "Subject",
  year: (24, 25),
  project: "Práctica 0",
  title: "La mejor memoria de la historia",
  group: 89,
  bibliography-content: bibliography("bib.bib"),
  appendixes: include "apendixes.typ",
  authors: (
    (
      name: "Luis Daniel",
      surname: "Casais Mezquida",
      nia: 100429021
    ),
  ),
  // team: "Los chungitos",
  professor: "Perico de los Palotes",
  toc: true,
  logo: "old",
  language: "en"
)

#set table(
      stroke: none,
      fill: (x, y) => if calc.even(y) == false { azuluc3m.transparentize(80%) },
      inset: (x: 1.0em, y: 0.5em),
      gutter: 0.2em, row-gutter: 0em, column-gutter: 0em
    )
#show table.cell.where(y: 0) : set text(weight: "bold")

= Start typping here
