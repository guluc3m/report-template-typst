#import "uc3mreport.typ": conf

#show: conf.with(
  degree: "Grado en...",
  subject: "Asignatura",
  year: (24, 25),
  project: "Práctica 0",
  title: "La mejor memoria de la historia",
  group: 89,
  authors: (
    (
      name: "Luis Daniel",
      surname: "Casais Mezquida",
      nia: 100429021
    ),
    (
      name: "Pepe",
      surname: "Navarro",
      nia: 100429022
    ),
  ),
  professor: "Perico de los Palotes",
  toc: true,
  logo: "old",
  language: "en"
)

#let azuluc3m = rgb("#000e78")


= Introduction
#lorem(90)


== Motivation
#lorem(140)

== Problem Statement
#lorem(50)

= Related Work
#lorem(180)

#figure(
  image("img/old_uc3m_logo.svg", width: 70%),
  caption: [El mejor logo de la UC3M, con diferencia]
) <logo>

#table(
  columns: (0.2fr, 0.5fr, auto),
  stroke: none,
  fill: (x, y) => if calc.even(y) == false { azuluc3m.transparentize(80%) },
  inset: (x: 1.0em, y: 0.5em),
  gutter: 0.2em, row-gutter: 0em, column-gutter: 0em,

  [*blablabla*], [*blebleble*], [*blublubluuu*],
  [blablabla], [blebleble], [blublubluuu],
  [blablabla], [blebleble], [blublubluuu],
  [blablabla], [blebleble], [blublubluuu],
)