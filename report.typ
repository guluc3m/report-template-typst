#import "uc3mreport.typ": conf
#show: conf.with(
  degree: "Grado en...",
  subject: "Asignatura",
  year: (24, 25),
  lab: "Práctica 0",
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
  logo: "old"
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