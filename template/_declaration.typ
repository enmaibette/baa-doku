
#let declaration(
  title: none,
  authors: (),
  advisor: none,
  external_expert: none,
  industry_partner: none,
  degree_program: none,
  graduation_date: none,
  confidential: none,
  signature_date: none,
  signature_place: none,
  university: none,
  division: none,
) = {
  [== Bachelorarbeit an der #university - #division]

  let name_of_student = "Studierende"
  if (authors.len() > 1) {
    name_of_student = "Studierenden"
  }

  table(
    columns: 2,
    stroke: none,
    row-gutter: 1em,
    column-gutter: 2em,
    [*Titel:*], [#title],
    [*#name_of_student:*], [#authors.map(a => a.name).join(" \\")],
    [*Studiengang:*], [#degree_program],
    [*Abschlussjahr:*], [#graduation_date.display("[year]")],
    [*Betreuungsperson:*], [#advisor],
    [*Expertenperson:*], [#external_expert],
    [*Auftragsgebende:*], [#industry_partner],
  )
  v(1em)
  [
    *Codierung / Klassifizierung der Arbeit:*\
    #if (confidential) {
      [
        ⬜ Öffentlich (Normalfall)\
        ☑ Vertraulich
      ]
    } else {
      [
        ☑ Öffentlich (Normalfall)\
        ⬜ Vertraulich
      ]
    }
    #v(1em)
    *Eidesstattliche Erklärung*\
    Ich erkläre hiermit, dass ich die vorliegende Arbeit selbständig und ohne unerlaubte fremde Hilfe angefertigt habe. Alle verwendeten Quellen, Literatur und Hilfsmittel (insbesondere künstliche Intelligenz oder sonstige verwendete Instrumente) wurden urheberrechts- und datenschutzkonform verwendet und wörtlich oder inhaltlich entnommene Stellen als solche kenntlich gemacht. Das Ver-traulichkeitsinteresse des Auftraggebers wurde gewahrt und die Urheberrechtsbestimmungen der Hochschule Luzern respektiert.

    #stack(
      grid(align: bottom + center, columns: (1fr, 1fr))[
        #signature_place, #signature_date.display("[day].[month].[year]")
      ][
        #image(
          "/images/signature.png",
          height: 3em,
        )
      ],
      spacing: .5em,
      line(length: 100%, stroke: (thickness: .5pt)),
      "Ort / Datum, Unterschrift",
    )
    #v(1em)
    *Einreichung der Arbeit in die Portfoliodatenbank:*\
    Bestätigung durch die Studierenden\
    Ich bestätige hiermit, dass diese Bachelorarbeit gemäß den Vorgaben korrekt in die Portfoliodatenbank hochgeladen wurde. Nach dem Upload entziehe ich mich der Verantwortung für Änderungen am Dokument.

    #stack(
      grid(align: bottom + center, columns: (1fr, 1fr))[
        #signature_place, #signature_date.display("[day].[month].[year]")
      ][
        #image(
          "/images/signature.png",
          height: 3em,
        )
      ],
      spacing: .5em,
      line(length: 100%, stroke: (thickness: .5pt)),
      "Ort / Datum, Unterschrift",
    )
  ]
}
