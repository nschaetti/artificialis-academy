#import "../../../../../template/unit.typ": *
#let s = [05 / EULER’S METHOD]
#start([Euler’s method], number: "5")[
  Suppose you know $y(t_0)=y_0$ and can compute $f(t_0,y_0)$. Walk along the tangent for a short time $h$. At the new approximate point, read a fresh slope and repeat. This is *explicit Euler’s method*:
  $ t_(n+1)=t_n+h, quad y_(n+1)=y_n+h f(t_n,y_n). $
  Here $y_n$ denotes a numerical value. The exact value at the same time is $y(t_n)$. After the first step, even the slope you use may differ from the slope the exact curve would have used.

  #example([Two steps from the origin])[
    Estimate $y(1)$ for $y'=t+y$, $y(0)=1$, using $h=0.5$. At $t_0=0$, the slope is $1$. Thus $y_1=1+0.5(1)=1.5$ at $t_1=0.5$. The slope there is $0.5+1.5=2$, so $y_2=1.5+0.5(2)=2.5$.

    The exact solution is $y=2e^t-t-1$, giving $y(1) approx 3.437$. The Euler estimate is low. Slopes grow as the true solution rises, and the method uses the lower slope from the start of each step.
  ]

  #activity([5A])[
    With the same starting value and rate law, take the first two steps with $h=0.25$. Compare your value at $t=0.5$ to that from one step of size $0.5$.
  ]

  Each update uses time and state from the *same* old row. Keep digits during early steps, then round the reported result.
]

#leaf(s, [Keep track of the computation])[
  An Euler calculation fits into a table. As an example, take $y'=-y$, $y(0)=1$, and $h=0.5$. Each step multiplies the current value by $1-h=0.5$.

  #data-table(columns: (.4fr, .65fr, 1fr, 1fr),
    table.header([$n$], [$t_n$], [$y_n$], [$f(t_n,y_n)$]),
    [0], [0], [1], [−1],
    [1], [0.5], [0.5], [−0.5],
    [2], [1.0], [0.25], [−0.25],
    [3], [1.5], [0.125], [−0.125],
    [4], [2.0], [0.0625], [−0.0625],
  )

  #diagram(image("../figures/euler.svg", width: 100%, alt: "Euler approximations with 0.5 and 0.25 steps lie below the exact exponential decay."), [For decay, the tangent lies below the convex exact curve. The finer steps follow it more closely.])

  If a target time is not an integer number of steps away, use a shorter last step or choose $h=(T-t_0)/N$ from the start. Never label a computed value with a different time just to hit the target.

  #activity([5B])[
    For the same decay equation, calculate $y(1)$ numerically using four steps of size $0.25$. Compare with the table and with $e^(-1)$.
  ]
]

#leaf(s, [Where the error comes from])[
  Starting from the *exact* state at time $t$, Taylor expansion gives
  $ y(t+h)=y(t)+h y'(t)+h^2/2 y''(t)+O(h^3) $
  when the needed derivatives are bounded. Euler includes the first two terms. The one-step error from an exact starting point is generally of size $h^2$. Its leading term depends on curvature. A perfectly straight solution can be followed exactly.

  The accumulated or *global* error answers a different question: how far is the numerical value from the exact one after many steps? To reach a fixed time with half the step size you take about twice as many steps. For smooth problems with controlled error growth, Euler’s global error is of order $h$ as $h$ tends to zero.

  #example([Refine the step at a common target])[
    For $y'=-y$, $y(0)=1$, compare values at $t=1$. With $h=1/4$, the estimate is $(3/4)^4=0.31640625$. With $h=1/8$, it is $(7/8)^8 approx 0.34361$. The exact value is about $0.36788$. The errors are about $0.05147$ and $0.02427$, close to a factor of two apart.
  ]

  In a model with no exact formula, use at least two successive refinements. Agreement helps diagnose discretisation error. It cannot detect a mistaken rate law that was used consistently at every resolution.

  #activity([5C])[
    If at a fixed target the numerical error behaves approximately as $0.8h$, estimate the errors at $h=0.1$ and $h=0.025$. What assumption makes this comparison meaningful?
  ]
]

#leaf(s, [A step size can change the apparent physics])[
  For the model $y'=-k y$ with $k>0$, Euler gives $y_n=(1-k h)^n y_0$. The exact solution always decays in magnitude. The numerical prediction decays only if $abs(1-k h)<1$, equivalent to $0<h<2/k$.

  #data-table(columns: (1fr, 1.55fr),
    table.header([Step regime], [Numerical behaviour for positive $y_0$]),
    [$0<k h<1$], [Positive monotone decay],
    [$k h=1$], [Falls to exactly zero in one step],
    [$1<k h<2$], [Alternates in sign, decays in magnitude],
    [$k h=2$], [Alternates with fixed magnitude],
    [$k h>2$], [Alternates with growing magnitude],
  )

  #example([Decay that looks like growth])[
    With $k=10$ per second and $h=0.25$ s, the factor is $-1.5$. Starting at $1$, the sequence begins $1,-1.5,2.25$. The exact solution at $0.5$ s is $e^(-5) approx 0.0067$. The growth and alternating signs are numerical artefacts.
  ]

  Stability and accuracy impose different demands on the step. A factor of $0.01$ per step is stable, but may severely underestimate a substantial remaining amount. If the state represents a concentration, preserve physical constraints as another check.

  #activity([5D])[
    For $k=4$ per second, give one step that produces sign changes with decay and another that keeps a positive initial value positive. Compute the factors.
  ]
]

#leaf(s, [Workshop · A numerical prediction for a filling tank])[
  The model $y'=2+t-y$ describes a quantity approaching a moving input, in scaled units. Take $y(0)=0$ and predict the amount at $t=1$. Use a calculator, spreadsheet or a short script.

  #prompt([5W.1], [Make two approximations])[
    Compute the full table for $h=0.5$, then for $h=0.25$. Compare the values at $t=1$. Which estimate is higher? Does the first step alone explain the difference?
  ]
  #prompt([5W.2], [Use the exact model as a benchmark])[
    Verify $y(t)=1+t-e^(-t)$. Compute the errors of the two estimates and explain the sign of the errors from the curvature.
  ]
  #prompt([5W.3], [Refine again])[
    Repeat with $h=0.125$. Find the ratio of the absolute errors for the two finer runs. State what that ratio suggests and what it cannot prove about a new rate law.
  ]
  #prompt([5W.4], [Write the algorithm])[
    Write four lines of pseudocode for the update. If the time argument in the slope is advanced before the state is, explain how the first step changes.
  ]

  #panel([KEEP AN EXPERIMENT RECORD])[
    Record the initial value, law, step size and target time beside every table. A sequence of numbers alone makes it difficult to diagnose whether an error came from the model, the setup or the update.
  ]
]

#leaf(s, [End-of-section exercises])[
  #prompt([5.1], [Two short steps])[
    Estimate $y(0.4)$ for $y'=t-y$, $y(0)=1$, with $h=0.2$. Keep the slopes in your table and compare with the exact solution $t-1+2e^(-t)$.
  ]
  #prompt([5.2], [See the dependence on the step])[
    Estimate $y(1)$ for $y'=2t$, $y(0)=0$, with $h=1/2$ and $h=1/4$. Then derive the estimate for $N$ equal steps and compare it with the exact value.
  ]
  #prompt([5.3], [Identify an instability])[
    Use $h=0.4$ for $y'=-6y$, $y(0)=2$. Find the first two numerical values after the initial value. Give a strictly positive step that keeps the numerical solution positive and decreasing.
  ]
  #prompt([5.4], [Estimate an observed error rate])[
    A calculation gives $1.122$, $1.161$ and $1.181$ at the same time for successive halvings of $h$. Check whether the changes are consistent with first-order convergence. If this pattern persists, estimate the limit.
  ]
  #prompt([5.5], [When Euler is exact])[
    Explain why Euler reproduces the exact solution of $y'=c$ for constant $c$ at every grid point. Does the same reasoning apply to $y'=c t$?
  ]

  #link(<solutions-5>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-5>
  #prompt([5A–5D], [Steps, curvature and stability])[
    *5A* The first two values are $1.25$ and $1.625$, so the latter exceeds $1.5$. *5B* $(0.75)^4=0.31640625$ lies between $0.25$ and $e^(-1) approx 0.36788$. *5C* The estimates are $0.08$ and $0.020$ if both steps are already in the range where the $h$ term dominates. *5D* $h=0.375$ gives $-0.5$, while $h=0.125$ gives $0.5$.
  ]
  #prompt([5W], [Tank calculation])[
    The estimates at $t=1$ are $1.75$, $1.683594$ and about $1.656391$, compared with $2-e^(-1) approx 1.632121$. Concavity makes the tangent overshoot; the first step already overshoots and later steps contribute too. Errors for the finer runs are about $0.05147$ and $0.02427$, a ratio of about $2.12$. Start with the old row, evaluate $f$, add $h f$ to $y$, then add $h$ to $t$. Advancing time before evaluating the slope adds $h^2$ to the first new state here.
  ]
  #prompt([5.1–5.3], [Tables and stability])[
    *5.1* Slopes $-1,-0.6$ give $0.8,0.68$. The exact value at $0.4$ is about $0.74064$. *5.2* The two estimates are $0.5$ and $0.75$. Summing $2n/N^2$ for $n=0$ through $N-1$ gives $1-1/N$, versus exact $1$. *5.3* The factor is $-1.4$, producing $-2.8,3.92$. Any $h$ strictly between $0$ and $1/6$ keeps the multiplier between $0$ and $1$.
  ]
  #prompt([5.4–5.5], [Refinement and straight lines])[
    *5.4* Changes are $0.039,0.020$. If they keep halving, add a tail of about $0.020$ to the last value for a limit near $1.201$. *5.5* The exact solution is linear with slope $c$, so every single step is exact. For $c t$ the slope varies unless $c=0$.
  ]
]

#leaf(s, [What to take away])[
  #panel([THE UPDATE])[
    At the old point, read the slope. Move forward by $h$ in time and by $h$ times that slope in state. Repeat until you reach the target.
  ]

  - Use the same old row for both arguments of the rate function.
  - A one-step error of size $h^2$ generally accumulates to a global error of order $h$ at fixed time for smooth problems.
  - Compare runs at a common time. Retain enough digits to see what changes when $h$ is reduced.
  - For positive decay rate $k$, the Euler multiplier is $1-k h$. Large steps can create spurious oscillations or growth.
  - Compare the output to qualitative predictions from signs, equilibria and physical constraints.

  #heading(level: 3, numbering: none, outlined: false)[Explain the error with a sketch]
  Draw a positive, decaying exponential and its initial tangent. Pick a short step and mark the numerical value below the curve. Extend the tangent far enough that it produces a negative state. The first discrepancy is an accuracy issue. Repeating the second kind of step can produce a qualitatively wrong prediction for the whole trajectory.

  To describe a moving cart, position alone no longer determines what happens next. Section 6 brings its velocity into the initial data and develops exact solutions for a second-order rate law.
]
