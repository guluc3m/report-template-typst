// "THE BEER-WARE LICENSE" (Revision 42):
// L. Daniel Casais <@rajayonin> wrote this file. As long as you retain this
// notice you can do whatever you want with this stuff. If we meet some day, and
// you think this stuff is worth it, you can buy me a beer in return.


#let azuluc3m = rgb("#000e78")

/// Writes the authors name in short format
///
/// - authors (array): An array containing the authors information to iterate through
/// -> content
#let _shortauthors(authors: ()) = {
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
/// - degree (str): The degree your are enroled in
/// - subject (str): The subject the report is for
/// - project (str): Type of project, i.e. `"Lab 1"` (mind it will only display what you put here, no content will be added)
/// - title (str): Title of the project
/// - year (array): An array containing the academic year, i.e. `(25, 26)`
/// - logo (str): University logo, either `"new"` or `"old"`
/// - group (int, none): Course group number, i.e. `89` (optional)
/// - authors (dictionaty): Authors information `(name: str, surname: str, nia: int)`
/// - professor (str, none): Professor's name
/// - team (str): Team name (optional)
/// - language (str): Report language, either `"es"` or `"en"`
/// -> content
#let _cover(
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
  set par(justify: false)
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

/// Main configuration function.
///
/// - degree (str): The degree your are enroled in
/// - subject (str): The subject the report is for
/// - project (str): Type of project, i.e. `"Lab 1"` (mind it will only display what you put here, no content will be added)
/// - title (str): Title of the project
/// - year (array): An array containing the academic year, i.e. `(25, 26)`
/// - logo (str): University logo, either `"new"` or `"old"`
/// - group (int, none): Course group number, i.e. `89` (optional)
/// - authors (dictionaty): Authors information `(name: str, surname: str, nia: int)`
/// - professor (str): Professor's name
/// - team (str, none): Team name (optional)
/// - language (str): Report language, either `"es"` or `"en"`
/// - toc (boolean): Whether to show the table of contents (`true`) or not (`false`)
/// - bibliography_file (str, none): Path to the bibliography file; if no file is specified the bibliography will not be shown 
/// - chapter_on_new_page (bool):  Whether to start each chapter on a new page (`true`) or not (`false`)
/// - doc (content): Document contents
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
  figure-spacing: 0.75em,
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
  // https://stackoverflow.com/questions/78622060/add-spacing-around-figure-in-typst
  show figure.where(kind: image).or(figure.where(kind: table)): it => {
    if it.placement == none {
      block(it, inset: (y: figure-spacing))
    } else {
      place(
        it.placement,
        float: true,
        clearance: figure-spacing,
        block(align(center, it), spacing: figure-spacing, width: 100%),
      )
    }
  }

  /* TABLES */
  // captions on top for tables
  show figure.where(kind: table): set figure.caption(position: top)


  /* REFERENCES & LINKS */

  show ref: set text(azuluc3m)
  show link: set text(azuluc3m)

  /* LISTS */

  // indent lists
  set list(indent: 1em)
  set enum(indent: 1em)

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
        _shortauthors(authors: authors)
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

  _cover(
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


  /* OUTLINES */

  // disable footnotes
  show outline: it => {
    set footnote.entry(separator: none)
    show footnote.entry: hide
    show ref: none
    show footnote: none
    it
  }
  // top-level TOC entries in bold without filling
  show outline.entry.where(level: 1): it => {
    // only apply for contents (headings) outline
    if it.element.func() != heading { return it }

    // don't show page number in outline for appendixes
    let page-number = if (
      it.element.supplement == "Apendix" or it.element.supplement == "Apéndice"
    ) { "" } else { it.page() }

    set block(spacing: 1.5em)
    link(
      it.element.location(), // make entry linkable
      it.indented(
        it.prefix(),
        // upper(it.body())
        strong(it.body())
        + if page-number == "" { "" } else {
          "  " + box(width: 1fr, repeat([.], gap: 2pt)) + "  " + page-number
        },
      ),
    )
  }

  // other TOC entries in regular with adapted filling
  show outline.entry.where(level: 2).or(outline.entry.where(level: 3)): it => {
    set block(above: 0.8em)

    show link: set text(black) // reset link color

    link(
      it.element.location(), // make entry linkable
      it.indented(
        it.prefix(),
        it.body()
          + "  "
          + box(width: 1fr, repeat([.], gap: 2pt))
          + "  "
          + it.page(),
      ),
    )
  }

  // contents
  outline(title: if language == "es" [Tabla de contenidos] else [Table of contents], depth: 3)
  pagebreak()

  doc


  /* BIBLIOGRAPHY */

  if bibliography_file != none {
    pagebreak()
    bibliography(bibliography_file, style: "ieee")
  }
}
