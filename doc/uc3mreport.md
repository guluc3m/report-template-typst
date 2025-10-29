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

The functions takes some parameters and outpust a solid cover for the report. Lets explain what this parameters are:

- `degree` -> takes a `str` or `content` with the degree the student courses
- `subject` -> takes a `str` or `content` with the subject of the project
- `project` -> takes a `str` or `content` with the project name
- `title` -> takes a `str` or `content` with the project title
- `year` -> takes an `array` with two values `(x, y)` being `x` the 2 last digits of the year the couse started and `y` the 2 last digits of the year the course ends
- `logo` -> takes a `str` `"new"/"old"` that selects the logo that will be used in the cover
- `group` -> takes an `int` with the number of the subject group
- `authors` -> takes an `arry` with the authors of the report (later explained in depth)
- `professor` -> takes a `str` with the professors name
- `team` -> takes a `str` or `content` with the teams name (used mainly when many authors are present)
- `language` -> takes a `str1` either `"en"` or `"es"` to adjust the template language
