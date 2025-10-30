#import "@preview/tidy:0.4.3"

#set document(author: "Samuel Matamoros Alonso", title: "UC3M Typst Report Template Documentation")

#let config = tidy.parse-module(
  read("/uc3mreport.typ"),
  old-syntax: true,
)

#let template = tidy.parse-module(
  read("/report.typ"),
  old-syntax: true,
)

= UC3M Typst Report Template Documentation

The intention of this documentation is to provide a deep understanding on how this template works to ensure the user can do a good use of it and modify it as they wish. 

== The config file: `uc3mreport.typ`
#tidy.show-module(
  config,
  omit-private-definitions: true,
)

// == The template file: `report.typ`
// #tidy.show-module(template)
