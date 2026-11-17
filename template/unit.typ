#let ink = rgb("#172939")
#let accent = rgb("#126963")
#let muted = rgb("#435866")
#let soft = rgb("#EDF5F3")
#let heading-font = ("DejaVu Sans", "Libertinus Serif")
#let unit(course: "", title: "", unit-number: 1, course-title: "", body) = {
  set document(title: title, author: "The Artificialis Academy", keywords: (course, title))
  set text(font: "Libertinus Serif", size: 12.4pt, fill: ink, lang: "en", region: "GB")
  set page(paper: "a4", margin: (x: 26mm, top: 22mm, bottom: 22mm),
    header: context {
      if counter(page).get().first() > 1 {
        grid(columns: (1fr, auto),
          text(font: heading-font, size: 8pt, fill: muted, [THE ARTIFICIALIS ACADEMY]),
          text(font: heading-font, size: 8pt, fill: muted, course + " / UNIT " + str(unit-number)))
        v(2mm)
        line(length: 100%, stroke: .45pt + rgb("#B6CBC7"))
      }
    },
    footer: context {
      if counter(page).get().first() > 1 {
        line(length: 100%, stroke: .45pt + rgb("#B6CBC7"))
        v(2mm)
        grid(columns: (1fr, auto),
          text(font: heading-font, size: 8pt, fill: muted, upper(course-title)),
          text(font: heading-font, size: 8pt, fill: accent, counter(page).display()))
      }
    },
  )
  set par(leading: .79em, spacing: 1.03em, justify: false)
  set list(spacing: .58em, indent: 1em)
  show heading.where(level: 1): set text(font: heading-font, size: 25pt, weight: "bold")
  show heading.where(level: 2): set text(font: heading-font, size: 20pt, weight: "bold")
  show heading.where(level: 3): set text(font: heading-font, size: 11pt, weight: "bold", fill: accent)
  set block(above: .95em, below: .95em)
  show figure.caption: set text(size: 10pt, fill: muted)
  show link: set text(fill: accent)
  body
}
#let kicker(body) = text(font: heading-font, fill: accent, size: 9pt, weight: "bold", tracking: .7pt, body)
#let leaf(section, title, body) = {
  pagebreak(weak: true)
  kicker(section)
  heading(level: 2, numbering: none, outlined: false, title)
  body
}
#let start(title, body, number: none) = {
  pagebreak(weak: true)
  kicker(if number == none [UNIT 1] else [SECTION #number])
  heading(level: 1, numbering: none, title)
  body
}
#let panel(label, body, tinted: true) = block(
  width: 100%, breakable: false, inset: (x: 4.5mm, y: 3mm),
  fill: if tinted { soft } else { white },
  stroke: (left: 1.25pt + accent),
)[#kicker(label) #parbreak() #body]
#let example(title, body) = panel([WORKED EXAMPLE  ·  #title], body)
#let activity(id, body) = panel([ACTIVITY #id], body, tinted: false)
#let prompt(id, title, body) = [
  #heading(level: 3, numbering: none, outlined: false)[#id  ·  #title]
  #body
]
#let diagram(graphic, caption) = figure(
  graphic,
  caption: caption,
  supplement: [Figure],
)
#let data-table(..args) = {
  set text(size: 11pt)
  table(
    stroke: (x, y) => (bottom: .4pt + rgb("#C9DAD7")),
    fill: (x, y) => if y == 0 { soft },
    inset: (x: 7pt, y: 6pt),
    ..args,
  )
}
