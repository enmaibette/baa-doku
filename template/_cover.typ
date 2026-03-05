

#let cover(
  title: none,
  subtitle: none,
  authors: (),
  university: none,
  division: none,
  degree_program_full: none,
  report_date: none,
) = {
  align(top + left, image("/template/images/HSLU_Logo_DE_Schwarz_cmyk.svg", width: 28%))
  align(top + center)[
    #v(80pt)
    #text(size: 12pt, division)

    #v(4pt)
    #text(size: 12pt, university)

    #v(24pt)

    #text(size: 28pt, weight: 700, title)
    #v(8pt)
    #if subtitle != none {
      text(size: 14pt, subtitle)
      v(18pt)
    }

    #text(size: 16pt, weight: 600, "Bachelorarbeit")
    #v(8pt)

    #text(
      size: 11pt,
      "vorgelegt am Department "
        + division
        + " der "
        + university
        + " in Anbetracht zur Erreichung des akademischen Grades Bachelor im Studiengang "
        + degree_program_full,
    )
    #v(24pt)

    *von*
    #let count = authors.len()
    #let ncols = calc.min(count, 3)
    #grid(
      columns: (1fr,) * ncols,
      row-gutter: 12pt,
      ..authors.map(author => [
        #author.name \
        #author.address \
        #link("mailto:" + author.email)
      ]),
    )

    #v(20pt)
    #text(size: 12pt, degree_program_full)
    #v(8pt)
    #report_date.display("[day]. [month repr:long] [year]")
  ]
}
