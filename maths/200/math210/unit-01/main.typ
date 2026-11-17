#import "../../../../template/unit.typ": *
#show: unit.with(course: "MATH210", course-title: "Methods in mathematics for modelling", title: "First- and second-order differential equations")

#v(18mm)
#kicker[THE ARTIFICIALIS ACADEMY]
#v(16mm)
#line(length: 100%, stroke: 1.2pt + accent)
#v(8mm)
#text(font: heading-font, size: 11pt, weight: "bold", fill: accent)[MATH210  /  UNIT 1]
#v(5mm)
#text(font: heading-font, size: 31pt, weight: "bold")[First- and second-order differential equations]
#v(5mm)
#text(size: 17pt, fill: muted)[Methods in mathematics for modelling]
#v(8mm)
#image("figures/cover.svg", width: 100%, alt: "Three oscillatory curves illustrate persistent, decaying, and growing amplitudes.")
#v(1fr)
#text(size: 13pt, style: "italic")[A lifetime of learning, from foundations to frontiers.]

#leaf([UNIT 1], [How to study this unit])[
  A mug cools, a spring oscillates, and a tank fills with salt. In each case we can write a rule for how something changes before we know its actual history. This unit gives you ways to turn such a rule into a prediction. Sometimes the prediction is a formula. Sometimes a picture or a numerical estimate gives you the most direct answer.

  After studying this unit, you should be able to:
  - Choose a state variable, check its units, and interpret initial conditions.
  - Solve first-order equations by separation of variables or by an integrating factor, with the appropriate domain.
  - Sketch and read direction fields, and use Euler’s method with a sensible step size.
  - Use characteristic roots to solve homogeneous second-order linear equations with constant coefficients.
  - Construct particular integrals for simple forcing terms, including resonant forcing.

  Try each activity before looking at its solution. When you check an answer, compare the reasoning as well as the final expression. If a worked example seems straightforward, cover its next line and predict it.

  #heading(level: 3, numbering: none, outlined: false)[Contents]
  #outline(title: none, depth: 1, indent: 0pt)
]

#leaf([UNIT 1], [What you should know already])[
  You will use differentiation and integration throughout. Try these warm-up tasks on paper before starting. If one stalls you, review that specific skill and try again.

  + Differentiate $t e^(-2t)$ and $cos(3t)$.
  + Integrate $2t e^(t^2)$ and $1/(t+2)$ on $t > -2$.
  + Solve $e^(-k t)=1/4$ for $t$ when $k>0$.
  + For $y(t)=1+A e^(-t)$, choose $A$ so that $y(0)=4$. What is $y'(0)$?
  + Solve $r^2+2r+5=0$, allowing complex roots. If you have never used complex numbers, you can return to this after Section 6.

  #panel([CHECK YOUR WORK])[
    1. $(1-2t)e^(-2t)$ and $-3 sin(3t)$.

    2. $e^(t^2)+C$ and $ln(t+2)+C$.

    3. Take logarithms to get $-k t=-ln 4$, hence $t=(ln 4)/k$.

    4. $A=3$. Then $y'=-3e^(-t)$ and $y'(0)=-3$.

    5. Complete the square to get $(r+1)^2=-4$. Writing $i^2=-1$ gives $r=-1 plus.minus 2i$.
  ]

  Throughout the unit, primes mean derivatives with respect to the independent variable in the equation, usually time $t$. When the independent variable is $x$, a prime means differentiation with respect to $x$. An arbitrary integration constant is usually named $C$.
]

#include "sections/01.typ"
#include "sections/02.typ"
#include "sections/03.typ"
#include "sections/04.typ"
#include "sections/05.typ"
#include "sections/06.typ"
#include "sections/07.typ"

#start([Unit review])[
  Try these problems after the last section. They combine methods that were introduced separately. For both problems, write down a prediction before you compute a formula. Use the PDF’s method finder if you need help selecting an approach.

  #prompt([R.1], [An instrument warms up])[
    A sensor starts at $10$ °C. For the first two minutes its surroundings warm as $R(t)=20+2t$ °C. The sensor temperature $T$ obeys $T'=0.5(R(t)-T)$, with time in minutes.

    + Argue from the equation that the sensor initially warms. If it meets the moving line $T=R$, what would its slope be there? Explain whether it can first cross the line from below.
    + Find an exact expression for $T(t)$. Try using the lag $D=R-T$ to simplify the forcing.
    + Approximate $T(2)$ using Euler steps of $1$ minute, then steps of $0.5$ minute. Compare the estimates with the exact value. Explain the sign of the errors by finding the sign of $T''$.
  ]

  #prompt([R.2], [A spring moves to a new rest position])[
    In scaled units, the displaced mass satisfies $x''+4x'+4x=8$ for $t>=0$, with $x(0)=0$ and $x'(0)=0$.

    + Find the new equilibrium. Predict the initial acceleration from the equation.
    + Find the complementary function and a particular integral. Use both initial conditions to find the trajectory.
    + Show that $x$ increases for every $t>0$ and stays below the new equilibrium. Explain what feature of the solution tells you that the approach has no oscillation.
  ]

  #link(<review-solutions>)[Check your answers →]
]

#leaf([UNIT REVIEW], [Worked solutions])[
  #metadata(none) <review-solutions>
  #prompt([R.1], [An instrument warms up])[
    The initial rate is $0.5(20-10)=5$ °C/min. At any meeting point with the moving line, $T'=0$ whereas $R'=2$, so the difference $D=R-T$ would have positive derivative $2$ at zero. A first crossing from positive to negative would require the opposite direction.

    The lag solves $D'+0.5D=2$ with $D(0)=10$. Multiplying by $e^(t/2)$ gives $D=4+6e^(-t/2)$ after integration and use of the initial value. Therefore
    $ T(t)=16+2t-6e^(-t/2), quad T(2)=20-6/e approx 17.793. $
    With $h=1$, the Euler values after the initial value are $15$ and $18.5$. With $h=0.5$, they are $12.5$, $14.625$, $16.46875$ and $18.1015625$. Both estimates are high because the exact curve is concave down, with $T''=-(3/2)e^(-t/2)<0$. For these steps, an existing positive error is carried forward by the positive factor $1-0.5h$, and each new tangent step adds another positive error.
  ]

  #prompt([R.2], [A spring moves to a new rest position])[
    A constant equilibrium satisfies $4x=8$, giving $x=2$. The equation gives $x''(0)=8$. The characteristic polynomial is $(r+2)^2$, so the complementary function is $(A+B t)e^(-2t)$. A constant trial gives the particular integral $2$. The starting position gives $A=-2$, and the starting velocity gives $B-2A=0$, so $B=-4$. Thus
    $ x(t)=2-(2+4t)e^(-2t), quad x'(t)=8t e^(-2t). $
    For $t>0$, the velocity is positive and the subtracted term in $x(t)$ is positive. The exponential and the linear factor describe a repeated real root, with no sine or cosine. The trajectory approaches the equilibrium from below and $x''(0)=8$ as predicted.
  ]
]

#leaf([UNIT 1], [Method finder and further reading])[
  Start by asking what the model needs to predict. A direction field can settle a question about long-term behaviour. An exact formula can expose a time scale. A numerical method can estimate the value at a specific time.

  #data-table(columns: (1fr, 1.3fr),
    table.header([When you see], [What to try]),
    [$y'=g(t)h(y)$], [Separate. Check the zeros of $h$ first.],
    [$y'+p(t)y=q(t)$], [Multiply by $e^(integral p(t) dif t)$.],
    [$y'=f(t,y)$ and a qualitative question], [Sketch a direction field and locate horizontal tangencies.],
    [$y'=f(t,y)$ and a numerical target], [Use Euler steps and compare step sizes.],
    [$a y''+b y'+c y=0$ with constant coefficients], [Find the roots of $a r^2+b r+c=0$.],
    [The same operator with simple forcing], [Find the complementary function and a particular integral. Correct for overlap.],
  )

  #panel([FINAL CHECK])[
    Verify the equation, every initial condition, the interval where the model applies, and the units or a limiting case. For a numerical result, record the step size and compare with a finer calculation.
  ]

  #heading(level: 3, numbering: none, outlined: false)[Further reading]
  - #link("https://www.open.ac.uk/courses/modules/mst210")[The Open University, _Mathematical Methods, Models and Modelling_ (MST210)].
  - #link("https://openstax.org/books/calculus-volume-2/pages/4-introduction")[OpenStax, _Calculus_, Volume 2, Chapter 4] and #link("https://openstax.org/books/calculus-volume-2/pages/7-introduction")[Chapter 7].
  - #link("https://www.feynmanlectures.caltech.edu/I_toc.html")[The Feynman Lectures on Physics, Volume I, Chapters 21 and 23], for physical intuition about oscillators and resonance.
]
