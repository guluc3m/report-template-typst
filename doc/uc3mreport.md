# UC3M Report Template for Typst

The UC3M Report Template for Typst is an open source template made by the [GUL]() student association with the intent of making it easy for the students that wand a stunning and quick report.

For a quick install just follow the [`quickinstall.md`](/doc/quickinstall.md) guide.

## Structure

The repository consists on two files: the main file [`report.typ`](/report.typ), and the template file [`uc3mreport.typ`](/uc3mreport.typ) where the configuration lives.

### Template file: `uc3mreport.typ`

As mentioned previously, the template file contains all the configuration that makes the report look the way it looks. In this section we will do a deep dive into this file and cover all its contents. 

#### The `cover()` functions

The `cover()` function is used later to render, as its name implies, the cover of the report.

```typst
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
  if team != none [
    #team
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
```

The functions just takes the necesary parameters and generates a cover.

