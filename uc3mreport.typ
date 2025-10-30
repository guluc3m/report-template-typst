// "THE BEER-WARE LICENSE" (Revision 42):
// L. Daniel Casais <@rajayonin> wrote this file. As long as you retain this
// notice you can do whatever you want with this stuff. If we meet some day, and
// you think this stuff is worth it, you can buy me a beer in return.


#let azuluc3m = rgb("#000e78")

/// Writes the authors name in short format
///
/// - authors (array): An array containing the authors information to iterate through
/// -> content
#let shortauthors(authors: ()) = {
  for (i, author) in authors.enumerate() {
    // name
    for name in author.name.split(" ") {
      name.at(0) + ". "
    }

    // surname
    if "surname_length" in author {
      author.surname.split(" ").slice(0, count: author.surname_length).join(" ")
    } else {
      author.surname.split(" ").at(0)
    }

    // connector
    if i < authors.len() - 2 {
      ", "
    } else if i == authors.len() - 2 {
      " & "
    }
  }
}

/// A functiong that generates the cover for the report.
///
/// - degree (str, content): The degree your are enroled in.
/// - subject (str, content): The subject the report is for.
/// - project (str, content): The title or number of the project (mind it will only display what you put here, no content will be added)
/// - title (str, content): The title of the project
/// - year (array): and array containing the last two digits of the course i.e. (25, 26)
/// - logo (str): either "new" or "old" for the universtity old or new logo
/// - group (int): the number of the course group
/// - authors (array): an array containing the authors information (name, surname, nia)
/// - professor (str, content): professors name
/// - team (str, contetn): teams name
/// - language (str): either "es" or "en"
/// -> content
#let cover(
  degree,
  subject,
  project,
  title,
  year,
  logo,
  group: none,
  authors: (),
  professor: none,
  team: none,
  language: "en",
) = {
  set align(center)
  set text(azuluc3m)
  set text(size: 17pt)
  set page(header: [], footer: [])

  // logo
  if logo == "new" {
    image("img/new_uc3m_logo.svg", width: 100%)
    v(1em)
  } else {
    image("img/old_uc3m_logo.svg", width: 45%)
    v(1em)
  }

  emph(degree)
  parbreak()

  [#subject #year.at(0)/#year.at(1)]
  linebreak()
  if group != none {
    [#if language == "en" [Group] else [Grupo] #group]
  }

  v(2em)

  emph(project)
  linebreak()
  text(25pt, ["#title"])

  line(length: 70%, stroke: azuluc3m)

  v(1fr) 

  // team
  if team != none {
    text(size: 1.4em, team)
  }

  // authors
  if authors.len() < 5 {
    set text(20pt)
    for author in authors [
      #author.name #author.surname --- #link(
        "mailto:" + str(author.nia) + "@alumnos.uc3m.es",
      )[#author.nia]\
    ]
  } else {
    for i in range(calc.ceil(authors.len() / 3)) {
      let end = calc.min((i + 1) * 3, authors.len())
      let is-last = authors.len() == end
      let slice = authors.slice(i * 3, end)
      grid(
        columns: slice.len() * (1fr,),
        gutter: 10pt,
        ..slice.map(author => align(center, {
          set text(size: 11pt)
          author.name + " " + author.surname
          if "nia" in author [
              \ #link("mailto:" + str(author.nia) + "@alumnos.uc3m.es")[#author.nia] 
          ]
        }))
      )

      if not is-last {
        v(16pt, weak: true)
      }
    }
  }

  // team
  if team != none [
    #text(size: 1.4em, [#team:]) 
    #v(0.5em)
  ]

  // authors
  if authors.len() < 5 {
    set text(20pt)
    for author in authors [
      #author.name #author.surname --- #link(
        "mailto:" + str(author.nia) + "@alumnos.uc3m.es",
      )[#author.nia]\
    ]
  } else {
    for i in range(calc.ceil(authors.len() / 3)) {
      let end = calc.min((i + 1) * 3, authors.len())
      let is-last = authors.len() == end
      let slice = authors.slice(i * 3, end)
      grid(
        columns: slice.len() * (1fr,),
        gutter: 12pt,
        ..slice.map(author => align(center, {
          set text(size: 11pt)
          author.name + " " + author.surname
          if "nia" in author [
              \ #link("mailto:" + str(author.nia) + "@alumnos.uc3m.es")[#author.nia] 
          ]
        }))
      )

      if not is-last {
        v(16pt, weak: true)
      }
    }
  }

  v(1fr)

  if professor != none [
    #if language == "es" [
      _Profesor_\
    ] else [
      _Professor_\
    ]
    #professor
  ]

  pagebreak()
  counter(page).update(1)
}

/// 
///
/// - degree (str, content): The degree your are enroled in.
/// - subject (str, content): The subject the report is for.
/// - project (str, content): The title or number of the project (mind it will only display what you put here, no content will be added)
/// - title (str, content): The title of the project
/// - year (array): and array containing the last two digits of the course i.e. (25, 26)
/// - logo (str): either "new" or "old" for the universtity old or new logo
/// - group (int): the number of the course group
/// - authors (array): an array containing the authors information (name, surname, nia)
/// - professor (str, content): professors name
/// - team (str, contetn): teams name
/// - language (str): either "es" or "en"
/// - toc (): whether to show or not the table of contents
/// - bibliography_file (str): the path to the bibliography file, if no file is specified the bibliography will not be shown 
/// - chapter_on_new_page (bool):  whether to start a new chapter on a new page
/// - doc (content):  documents contents
/// -> content 
#let conf(
  degree: "",
  subject: "",
  year: (),
  authors: (),
  project: "",
  title: "",
  group: none,
  professor: none,
  team: none,
  language: "en",
  toc: true,
  logo: "new",
  bibliography_file: none,
  chapter_on_new_page: true,
  doc,
) = {
  /* CONFIG */
  set document(
    title: title,
    author: authors.map(x => x.name + " " + x.surname),
    description: [#project, #subject #year.at(0)/#year.at(1). Universidad Carlos
      III de Madrid],
  )

  /* TEXT */

  set text(size: 12pt, lang: language)

  set par(
    leading: 0.65em,
    spacing: 1em,
    first-line-indent: 1.8em,
    justify: true,
  )


  /* HEADINGS */

  set heading(numbering: "1.")
  show heading: set text(azuluc3m)
  show heading: set block(above: 1.4em, below: 1em)
  show heading.where(level: 1): it => {
    if chapter_on_new_page { pagebreak(weak: true) }
    it
  }

  // allow to set headings with selector `<nonumber` to prevent numbering
  show selector(<nonumber>): set heading(numbering: none)


  /* FIGURES */

  // figure captions w/ blue
  show figure.caption: it => {
    [
      #set text(azuluc3m, weight: "semibold")
      #it.supplement #context it.counter.display(it.numbering):
    ]
    it.body
  }


  // more space around figures
  // https://github.com/typst/typst/issues/6095#issuecomment-2755785839
  show figure: it => {
    let figure_spacing = 0.75em

    if it.placement == none {
      block(it, inset: (y: figure_spacing))
    } else if it.placement == top {
      place(
        it.placement,
        float: true,
        block(width: 100%, inset: (bottom: figure_spacing), align(center, it)),
      )
    } else if it.placement == bottom {
      place(
        it.placement,
        float: true,
        block(width: 100%, inset: (top: figure_spacing), align(center, it)),
      )
    }
  }

  /* TABLES */
  // captions on top for tables
  show figure.where(kind: table): set figure.caption(position: top)


  /* REFERENCES & LINKS */

  show ref: set text(azuluc3m)
  show link: set text(azuluc3m)


  /* FOOTNOTES */

  // change line color
  set footnote.entry(separator: line(
    length: 30% + 0pt,
    stroke: 0.5pt + azuluc3m,
  ))

  // change footnote number color
  show footnote: set text(azuluc3m) // in text
  show footnote.entry: it => {
    // in footnote
    h(1em) // indent
    {
      set text(azuluc3m)
      super(str(counter(footnote).at(it.note.location()).at(0))) // number
    }
    h(.05em) // mini-space in between number and body (same as default)
    it.note.body
  }


  /* PAGE LAYOUT */

  set page(
    paper: "a4",
    margin: (
      y: 2.5cm,
      x: 3cm,
    ),

    // header
    header: [
      #set text(azuluc3m)
      #project
      #h(1fr)
      #subject #if group != none [, grp. #group]

      #v(-0.7em)
      #line(length: 100%, stroke: 0.4pt + azuluc3m)
    ],

    // footer
    footer: context [
      #line(length: 100%, stroke: 0.4pt + azuluc3m)
      #v(-0.4em)

      #set align(right)
      #set text(azuluc3m)
      #if authors.len() < 5 { 
        shortauthors(authors: authors)
      } else [
        #team
      ]
      #h(1fr)
      #let page_delimeter = "of"
      #if language == "es" {
        page_delimeter = "de"
      }
      #counter(page).display(
        "pg. 1 " + page_delimeter + " 1",
        both: true,
      )
    ],
  )


  /* COVER */

  cover(
    degree,
    subject,
    project,
    title,
    year,
    logo,
    authors: authors,
    professor: professor,
    group: group,
    team: team,
    language: language,
  )


  /* TOC */

  if toc {
    let outline_title = "Table of Contents"
    if language == "es" {
      outline_title = "Tabla de Contenidos"
    }
    outline(title: outline_title)
    pagebreak()
  }

  doc


  /* BIBLIOGRAPHY */

  if bibliography_file != none {
    pagebreak()
    bibliography(bibliography_file, style: "ieee")
  }
}
