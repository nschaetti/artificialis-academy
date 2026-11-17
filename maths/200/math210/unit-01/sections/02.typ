#import "../../../../../template/unit.typ": *
#let s = [02 / SEPARATION OF VARIABLES]
#start([Separation of variables], number: "2")[
  If the rate factors into one part depending on time and another depending on the state, try writing the equation as
  $ y'=g(t)h(y). $
  On a stretch where $h(y)$ is non-zero, division gives $y'/h(y)=g(t)$. The chain rule now recognises the left side as the derivative of an antiderivative of $1/h$ evaluated at $y(t)$. That is the reason the usual shorthand works:
  $ integral (dif y)/(h(y)) = integral g(t) dif t. $

  #example([A rate that changes with time])[
    Solve $y'=2t y$, $y(0)=3$. The constant solution $y=0$ is incompatible with the initial data. On the branch $y>0$, divide by $y$ and integrate:
    $ ln y=t^2+C. $
    The initial value gives $C=ln 3$, so $y=3e^(t^2)$. The derivative is $2t(3e^(t^2))$, as required. At $t=0$ its slope is zero; the function is still changing over intervals that include zero.
  ]

  A zero of $h$ can give an equilibrium $y(t)=y_*$ even if $g$ varies in time. A zero of $g$ at an isolated instant simply makes the slope zero at that time.

  #activity([2A])[
    Solve $y'=-3t y$ for $y(0)=-2$. Record the sign of your solution before and after exponentiating. What happens as $t$ grows?
  ]
]

#leaf(s, [Why division can lose solutions])[
  Division by $h(y)$ removes every state for which $h(y)=0$. Find those states first and check them directly in the original equation. When the initial value is one of those states, a constant solution may already answer the problem.

  #example([Two branches and an equilibrium])[
    For $y'=y^2$, the state $y=0$ is an equilibrium. If $y$ is non-zero, integrating gives
    $ -1/y=t+C, quad y(t)=y_0/(1-y_0 t) $
    for $y(0)=y_0!=0$. If $y_0>0$ the solution tends to $+infinity$ as $t$ approaches $1/y_0$ from below. If $y_0<0$ the singularity lies in the past and the solution approaches zero from below as $t$ increases.
  ]

  The fraction also exists on the far side of its pole. That disconnected branch cannot continue the given history through an infinite value. In an initial-value problem, report the interval containing the initial time on which the solution is defined and satisfies the equation.

  A related trap is to assume every right-hand side gives unique solutions. For $y'=2sqrt(abs(y))$, $y(0)=0$, the function $y=0$ works. So does a function that stays zero up to any time $a>=0$ and then follows $(t-a)^2$. At the join both the value and slope match. The right-hand side is continuous but has a sharp change of slope near zero.

  #activity([2B])[
    For $y'=y^2$, find the largest interval containing zero when $y(0)=-4$. What is the sign of $y'$ on that interval?
  ]
]

#leaf(s, [Using the initial value inside the integral])[
  If $y(t_0)=y_0$ and $h$ stays non-zero on the branch, definite integrals give
  $ integral_(y_0)^(y(t)) (dif u)/(h(u)) = integral_(t_0)^t g(v) dif v. $
  The symbols $u$ and $v$ are dummy variables. The equation is already true at $t=t_0$, where both integrals vanish. The formula can be useful when an implicit relation is enough, or when there is no convenient expression for $y(t)$.

  #example([An arrival time directly])[
    An object slows according to $v'=-0.4 v^2$ with numerical velocity $v(0)=5$ m/s and time measured in seconds. How long until $v=2$ m/s? Integrate from the starting velocity to the target:
    $ integral_5^2 (dif u)/(u^2) = -1/2+1/5 = -0.3=-0.4 t. $
    The time is $0.75$ s. The negative integral matches the negative right-hand side because the velocity decreases.
  ]

  If you want the whole trajectory instead, keep the upper limit $v(t)$ in the calculation. This gives $1/v(t)=1/5+0.4t$, a reciprocal that increases linearly. Squared drag gives a different late-time tail from the exponential produced by a linear drag law.

  #activity([2C])[
    For $z'=-(1+t)z^2$, $z(0)=1$, use definite integrals to find $z(t)$ for $t>=0$. At what positive time does $z$ first equal $1/2$?
  ]
]

#leaf(s, [Growth with a carrying capacity])[
  Exponential growth takes $P'=r P$. If resources are limited, an idealised model makes the fraction of unused capacity contribute another factor:
  $ P'=r P(1-P/K), quad r>0, K>0. $
  The equilibrium populations are $0$ and $K$. Between them the population grows. Above $K$, it declines. For $0<P<K$, separation and partial fractions give
  $ (1/P + 1/(K-P)) dif P = r dif t, quad ln(P/(K-P)) = r t+C. $
  Solving for $P$ and checking the formula on the relevant branch gives
  $ P(t)=K/(1+(K/P_0-1)e^(-r t)), quad P(0)=P_0>0, quad t>=0. $

  #diagram(image("../figures/logistic.svg", width: 100%, alt: "Three logistic trajectories approach 100 cells, two from below and one from above."), [Logistic growth and decline for $K=100$ and $r=1$ per hour.])

  #activity([2D])[
    For $K=100$ and $r=1$ per hour, compare the absolute rates at populations $20$, $50$ and $80$. Explain the symmetry. How do these rates relate to the shapes of the curves?
  ]
]

#leaf(s, [Workshop · When will the culture reach its target?])[
  A culture starts with $200$ cells. Early observations suggest a per-capita growth rate of $0.6$ per hour at low density, and the carrying capacity is estimated at $1000$ cells. Use the logistic equation with these parameters. Treat the population as continuous.

  #prompt([2W.1], [Write the law and predict signs])[
    Write the initial-value problem. State the equilibrium populations. Explain what the model predicts immediately after the culture starts.
  ]
  #prompt([2W.2], [Use an interpretable quantity])[
    Evaluate the initial ratio $P/(K-P)$. Show that the ratio grows as an exponential in the logistic model. Use it to estimate when $P=800$.
  ]
  #prompt([2W.3], [Compare two models])[
    Compute when the simple exponential model with the same low-density growth parameter would reach $800$. Which estimate is earlier? Explain the discrepancy by comparing the rates at a common population.
  ]
  #prompt([2W.4], [Make a prediction without solving again])[
    In the logistic model, find the population where the absolute growth rate is greatest. Use a derivative or a symmetry argument. Compute that peak rate and state its units.
  ]

  These two models may fit the earliest observations similarly. Measurements near the target can discriminate between them much more effectively.
]

#leaf(s, [End-of-section exercises])[
  #prompt([2.1], [Separate with a negative starting value])[
    Solve $y'=4x y$, $y(0)=-3$. Show how the sign enters your calculation. On what interval is the solution defined?
  ]
  #prompt([2.2], [Shift the equilibrium])[
    Solve $y'=-(y-7)$, $y(0)=10$. Also give the solution for $y(0)=7$. In each case, describe the long-time behaviour.
  ]
  #prompt([2.3], [Keep the correct square-root branch])[
    Solve $y'=x/y$, $y(0)=-2$. Give the interval containing zero and check by differentiation.
  ]
  #prompt([2.4], [Predict a stopping time])[
    A reaction satisfies $C'=-0.2 C^2$, with numerical concentration $C(0)=4$ in mol/L and time in minutes. Find when the concentration reaches $1$ mol/L. Give the units of the coefficient $0.2$.
  ]
  #prompt([2.5], [A logistic trajectory above capacity])[
    For $P'=P(1-P/50)$, $P(0)=100$, use the solution formula to find $P(ln 2)$. Explain why the model cannot predict a positive time with $P=45$.
  ]

  #link(<solutions-2>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-2>
  #prompt([2A–2D], [Branch, interval and growth rate])[
    *2A* $ln abs(y)=-3t^2/2+ln 2$. Keep the negative sign, giving $y=-2e^(-3t^2/2)$, which tends to zero. *2B* The denominator $1+4t$ is positive on $(-1/4,infinity)$. The derivative is positive there. *2C* $1/z=1+t+t^2/2$, so $t=sqrt(3)-1$. *2D* The rates are $16$, $25$, $16$ cells/h. The product $P(100-P)$ is symmetric around $50$, where the slope is steepest.
  ]
  #prompt([2W], [Culture forecast])[
    The equation is $P'=0.6 P(1-P/1000)$, $P(0)=200$. The initial rate is $96$ cells/h, with equilibria $0$ and $1000$. The ratio rises from $1/4$ to $4$, so $t=(ln 16)/0.6 approx 4.62$ h. Exponential growth needs $(ln 4)/0.6 approx 2.31$ h because its rate lacks the capacity factor. The logistic rate peaks at $P=500$, giving $150$ cells/h.
  ]
  #prompt([2.1–2.3], [Exact solutions])[
    *2.1* $ln abs(y)=2x^2+ln 3$, so $y=-3e^(2x^2)$ on the real line. *2.2* Apply separation to $u=y-7$ to get $y=7+3e^(-t)$, tending to $7$. For $y(0)=7$ the state stays there. *2.3* $y^2=x^2+4$, hence $y=-sqrt(x^2+4)$ on the real line. Its derivative is $-x/sqrt(x^2+4)=x/y$.
  ]
  #prompt([2.4–2.5], [Rates and time])[
    *2.4* $1/C=1/4+0.2t$, so $t=3.75$ min. The coefficient has units L/(mol·min). *2.5* The denominator at $t=ln 2$ is $1-(1/2)(1/2)=3/4$, so $P=200/3$. For $t>0$ the denominator lies between $1/2$ and $1$, which keeps $P>50$.
  ]
]

#leaf(s, [What to take away])[
  #panel([WHEN TO USE IT])[
    Look for a product $g(t)h(y)$. Check the equilibrium solutions before dividing by $h(y)$. Then integrate and choose the branch that contains the initial state.
  ]

  + Identify the factors, using an algebraic rearrangement if needed.
  + Check the zeros of the state factor separately.
  + Integrate on an interval where division is valid.
  + Use the initial value to determine a constant or set the lower limits.
  + State the interval and verify the solution. An implicit formula can be a useful answer.

  #heading(level: 3, numbering: none, outlined: false)[Two questions to ask]
  Where could this derivation have divided by zero? Where does the resulting formula stop satisfying the original problem? The first question recovers lost equilibria. The second identifies genuine limits of the branch, such as a finite-time pole.

  Try classifying $y'=t-y$ using the same logic. The right-hand side is a difference of two terms, and it has no simple product into one time factor and one state factor. It is linear, so the next section constructs a different way to integrate it.
]
