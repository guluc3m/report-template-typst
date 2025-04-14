#let azuluc3m = rgb("#000e78")

#let cover(
  degree,
  subject,
  lab,
  title,
  year,
  logo,
  group: none,
  authors: (),
  professor: none,
  team: none
) = [
  #set align(center)
  #set text(azuluc3m)
  #set text(size: 17pt)
  #set page(header: [], footer: [])

  // logo
  #if logo == "new" [
    #image("img/new_uc3m_logo.svg", width: 100%)
    #v(1em)
  ] else [
    #image("img/old_uc3m_logo.svg", width: 45%)
    #v(1em)
  ]

  #emph(degree)

  #subject #year.at(0)/#year.at(1)\
  Grupo #group

  #v(2em)

  #emph(lab)\
  #text(25pt, ["#title"])

  #line(length: 70%, stroke: azuluc3m)

  // authors
  #{
    set text(20pt)
    for author in authors [
      #author.name #author.surname --- #author.nia\
    ]
  }

  #if team != none [
    Team #team
  ]

  #v(3em)

  #if professor != none [
    _Professor_\
    #professor
  ]

  #pagebreak()
  #counter(page).update(1)
]


/**
 * Writes authors in the short format
*/
#let shortauthors(authors: ()) = {
  let i = 0
  for author in authors {
    for name in author.name.split(" ") {
      name.at(0) + ". "
    }

    author.surname.split(" ").at(0)

    i += 1

    if i < authors.len() - 1 {
      ", "
    } else if i == authors.len() - 1{
      " & "
    }
  }
}


#let conf(
  degree: "",
  subject: "",
  year: (),
  authors: (),
  lab: "",
  title: "",
  group: none,
  professor: none,
  team: none,
  language: "en",
  toc: true,
  logo: "new",
  doc
) = {

  // general config
  set text(size: 12pt, lang: language)
  set par(leading: 0.65em, spacing: 1em, first-line-indent: 1.8em, justify: true)
  set heading(numbering: "1.")
  show heading: set text(azuluc3m)
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 3cm,
      right: 3cm
    ),
    header: [
      #set text(azuluc3m)
      #title
      #h(1fr)
      #subject, grp. #group

      #v(-0.7em)
      #line(length: 100%, stroke: 0.4pt + azuluc3m)
    ],
    footer: context [
      #line(length: 100%, stroke: 0.4pt + azuluc3m)
      #v(-0.4em)

      #set align(right)
      #set text(azuluc3m)
      #shortauthors(authors: authors)
      #h(1fr)
      #counter(page).display(
        "pg. 1 of 1",
        both: true,
      )
    ]
  )

  // cover
  cover(
    degree,
    subject,
    lab,
    title,
    year,
    logo,
    authors: authors,
    professor: professor,
    group: group,
    team: team
  )

  // TOC
  if toc {
    outline()
    pagebreak()
  }

  doc
}