# The Artificialis Academy

*A lifetime of learning, from foundations to frontiers.*

An English-language library of self-study courses in mathematics, science and computer science. Courses are written in Typst and published as PDFs.

## Course catalogue

| Subject | Tier | Course |
| --- | --- | --- |
| [Maths](maths/) | Intermediate | [MATH210 · Methods in mathematics for modelling](maths/200/math210/) |
| [Sciences](sciences/) | | |
| [Computer Science](computer-science/) | | |

Courses live under `maths/`, `sciences/` or `computer-science/`, then under their tier directory and course code. The first digit in a course number identifies the tier.

| Numbers | Tier | Directory |
| --- | --- | --- |
| 1XX | Introductory | `100/` |
| 2XX | Intermediate | `200/` |
| 3XX | Advanced | `300/` |

A course contains numbered units. Each unit is a self-contained PDF with concept sections, worked examples, in-text activities, end-of-section exercises, and summaries. Each course page describes what a reader should know before starting.

## Build the first unit

From the repository root, with Typst 0.14 or later:

```sh
typst compile --root . maths/200/math210/unit-01/main.typ MATH210-Unit-01.pdf
```

The shared layout lives in [template/unit.typ](template/unit.typ). The figures are included as vector SVGs.
