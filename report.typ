#import "uc3mreport.typ": conf

#show: conf.with(
  degree: "Degree in...",
  subject: "Subject",
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
    (
      name: "Menganito",
      surname: "Suarez",
      nia: 100829022
    ),
    (
      name: "Fulano",
      surname: "De Tal y Pascual",
      nia: 100629023
    ),
    (
      name: "Rosa",
      surname: "Melano",
      nia: 100529026
    ),
    (
      name: "Aitor",
      surname: "Menta Segura",
      nia: 100819122
    ),
    (
      name: "Dolores",
      surname: "Fuertes De Cabeza",
      nia: 100529012
    ),
  ),
  team: "Los chungitos",
  professor: "Perico de los Palotes",
  toc: true,
  logo: "old",
  language: "en"
)



= Introduction
#lorem(90)


== Motivation
#lorem(140)

== Problem Statement
#lorem(50)

= Related Work
#lorem(200)

#figure(
  image("img/old_uc3m_logo.svg", width: 70%),
  caption: [El mejor logo de la UC3M, con diferencia]
) <logo>
