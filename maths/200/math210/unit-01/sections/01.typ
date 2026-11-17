#import "../../../../../template/unit.typ": *
#let s = [01 / BUILDING A DIFFERENTIAL EQUATION]
#start([Building a differential equation], number: "1")[
  A mug of tea is at $80$ °C in a room at $20$ °C. Your first measurement tells you how hot it is. To predict when you can drink it, you need a second kind of information: how fast it loses heat at different temperatures. If the temperature gap doubles, suppose the cooling rate doubles too.

  Write $T(t)$ for the tea temperature in degrees Celsius at time $t$ measured in minutes. The proposed law is
  $ T'(t)=-k(T(t)-20), quad T(0)=80, quad k>0. $
  The minus sign makes $T$ decrease while the tea is warmer than the room. The same equation predicts warming if the mug contains a colder liquid. At $T=20$, the model gives $T'=0$.

  #diagram(image("../figures/cooling.svg", width: 100%, alt: "Tea cools from 80 degrees towards a horizontal line at 20 degrees."), [Cooling predicted by the model for $k=0.12$ per minute.])

  A differential equation relates an unknown function to its derivatives. The unknown here is the entire function $T(t)$. The value $T(0)=80$ selects a history from the histories the law allows. This combination is an *initial-value problem*.

  You will learn to turn a rate law into an equation, read signs and units before solving, and verify that a proposed history fits the equation and its initial data.
]

#leaf(s, [The state and its rate])[
  The *state* is the information the model uses to calculate what happens next. In the mug example, the temperature is enough once the room temperature and the constant $k$ are known. An equation of the form $y'=f(t,y)$ uses the current time and state to determine the instantaneous slope.

  In a small time interval of length $h$, the change is approximately
  $ y(t+h)-y(t) approx h f(t,y(t)). $
  If the rate is constant on that interval, the equality is exact. When the rate changes, this is the tangent-line approximation you know from calculus. Section 5 makes a numerical method by applying it repeatedly.

  #example([Reading a rate law])[
    Suppose $T=50$ °C and $k=0.12$ per minute. Then $T'=-0.12(50-20)=-3.6$ °C/min. A short time of $0.1$ min corresponds to a drop of about $0.36$ °C. Over ten minutes the same multiplication gives a different kind of answer: the assumption of constant rate has been stretched over a period in which the temperature gap changes substantially.
  ]

  The dimensions tell you where to look for mistakes. For $T'=-k(T-20)$, the left side has units °C/min and the gap on the right has units °C, so $k$ must have units $1$/min. The product $k t$ is dimensionless, as an exponent must be.

  #activity([1A])[
    At what temperature is the instantaneous rate $-4.8$ °C/min if $k=0.12$ per minute? At $T=10$ °C, what is the sign of the rate and what does it mean?
  ]
]

#leaf(s, [Order, linearity and initial data])[
  The *order* is the highest derivative present. The equation $T'=-k(T-20)$ is first order. An equation involving the acceleration $x''$ of a mass is second order.

  In a linear equation, the dependent variable and its derivatives appear to the first power with coefficients that may depend on the independent variable. A product such as $x x'$ or a term such as $x^2$ makes the equation nonlinear. A prescribed forcing term such as $cos(t)$ is allowed in a linear equation.

  #data-table(columns: (1.15fr, .6fr, .7fr),
    table.header([Equation], [Order], [Type]),
    [$y'+t y=cos(t)$], [First], [Linear],
    [$y'=y(1-y)$], [First], [Nonlinear],
    [$x''+2x'+5x=0$], [Second], [Linear],
    [$x''+sin(x)=0$], [Second], [Nonlinear],
  )

  Imagine two carts at the same position on a spring. One is moving right and the other is moving left. Their futures differ even though their positions coincide. A second-order equation for position commonly needs both $x(0)$ and $x'(0)$, which together describe the initial state. A regular first-order equation generally needs one starting value.

  #activity([1B])[
    Classify $y''+t^2 y'=e^t$ and $y'+t y^2=0$ by order and linearity. For the first equation, propose a pair of initial conditions at $t=0$ for an object released from rest at position $2$.
  ]
]

#leaf(s, [Checking a candidate solution])[
  You can test a formula before you learn how to find it. Test the differential equation for every time in the interval of interest. Then test the initial condition at the starting time.

  #example([The cooling curve])[
    Try $T(t)=20+A e^(-k t)$. Differentiating gives $T'=-k A e^(-k t)$. The right-hand side is $-k(T-20)=-k A e^(-k t)$ as well. The equation holds for every constant $A$.

    With $T(0)=80$, we have $20+A=80$, so $A=60$. The model predicts $T(t)=20+60e^(-k t)$. For $k>0$, the excess temperature tends to zero. This agrees with the sign argument on the first page.
  ]

  A *general solution* describes a family on a specified interval. A *particular solution of an initial-value problem* is a member satisfying the specified data. In Section 7, *particular integral* will have the narrower job of supplying one response to a forcing term.

  Physical and mathematical domains answer different questions. The formula above exists for all real $t$, but $t=0$ is the moment we began the cooling experiment. Predictions for the experiment typically concern $t>=0$. At negative times the formula computes the backwards extension of a model whose assumptions may not apply.

  #activity([1C])[
    With $k=0.12$, approximately when is the tea at $35$ °C? First decide whether the answer should be earlier or later than the time to reach $50$ °C.
  ]
]

#leaf(s, [Workshop · From a balance to a prediction])[
  A tank holds $40$ L of water. A solution containing $3$ g of salt per litre enters at $2$ L/min. The mixture leaves at the same volume rate. Assume the contents are well stirred. Let $S(t)$ be the mass of salt in grams. The tank initially contains pure water.

  #prompt([1W.1], [Account for the incoming salt])[
    Multiply concentration by volume flow. Record the units of the result. Why does the volume remain constant?
  ]
  #prompt([1W.2], [Account for the outgoing salt])[
    Write the tank concentration in terms of $S$. Turn it into a mass flow rate using the given outflow. Obtain the differential equation and its initial condition.
  ]
  #prompt([1W.3], [Predict before calculating])[
    What salt mass makes the incoming and outgoing rates equal? If the tank starts below that mass, will the salt mass initially rise or fall?
  ]
  #prompt([1W.4], [Test a prediction])[
    A candidate is $S(t)=120(1-e^(-t/20))$. Verify the initial value and the equation. Compute the time at which the tank reaches half its equilibrium salt mass.
  ]

  #panel([MODELLING QUESTION])[
    Which step would fail if the tank were poorly stirred? Which step would fail if the two volume flows differed? Identify the assumption that supports each formula before replacing it.
  ]
]

#leaf(s, [End-of-section exercises])[
  #prompt([1.1], [Classify and interpret])[
    For each equation, state its order and whether it is linear. For the first, give a reasonable pair of initial conditions if $y$ denotes a position.
    $ y''+4y'+9y=sin(t), quad y'=(1-y)y, quad t y'+y=t^2. $
  ]
  #prompt([1.2], [The right equation, the wrong history])[
    Check which of $2+3e^(-t)$ and $2-3e^(-t)$ satisfy $y'=2-y$. Which satisfies $y(0)=5$? Sketch the two histories against the equilibrium value.
  ]
  #prompt([1.3], [Measure the units])[
    A drag model is $m v'=-b v$. The mass $m$ is in kg, time is in seconds, and velocity $v$ is in m/s. Find the units of $b$. Explain the roles of the sign of $b$ and the sign of $v$.
  ]
  #prompt([1.4], [Where does the model apply?])[
    Verify $y(t)=2/(1-2t)$ as a solution of $y'=y^2$, $y(0)=2$. Give the largest interval containing zero on which this formula solves the initial-value problem. What happens as you approach its right endpoint?
  ]
  #prompt([1.5], [Explain the difference between force and motion])[
    A model says $x''=-4x$. Two objects start at $x(0)=1$ with velocities $0$ and $3$. Compare their initial accelerations and their directions of motion immediately after time zero.
  ]

  #link(<solutions-1>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-1>
  #prompt([1A–1C], [Rates, classification and cooling])[
    *1A* $T-20=4.8/0.12=40$, so $T=60$ °C. At $10$ °C the rate is $+1.2$ °C/min. *1B* Second order linear and first order nonlinear, respectively. One pair is $y(0)=2$, $y'(0)=0$. *1C* The gap falls to $15/60=1/4$ of its starting value. Thus $t=(ln 4)/0.12 approx 11.55$ min, later than the half-gap time.
  ]
  #prompt([1W], [Tank balance])[
    Inflow is $6$ g/min. Outflow is $2 S/40=S/20$ g/min; volume stays $40$ L. Thus $S'=6-S/20$, $S(0)=0$. Equilibrium is $120$ g, with positive rate below it. The candidate has derivative $6e^(-t/20)$, which agrees with $6-S/20$, and starts at zero. The half-mass time is $20 ln 2 approx 13.86$ min. Poor stirring changes the outlet concentration; unequal flows change the volume in the concentration formula.
  ]
  #prompt([1.1–1.2], [Equation type and initial data])[
    *1.1* Second order linear, first order nonlinear, first order linear. For instance use $y(0)=1$ and $y'(0)=0$ for the first. *1.2* Both solve the equation since their derivatives are the negatives of their excesses above $2$. The plus sign gives $y(0)=5$ and the curve approaches $2$ from above. The other starts at $-1$ and approaches from below.
  ]
  #prompt([1.3–1.5], [Units, domain and motion])[
    *1.3* Divide kg·m/s² by m/s to obtain kg/s. For $b>0$, drag opposes the velocity. *1.4* The derivative is $4/(1-2t)^2=y^2$ and the starting value is $2$. The interval is $(-infinity,1/2)$ and the solution diverges to $+infinity$ at the right. *1.5* Both accelerations are $-4$. The object initially at rest begins moving left; the one with positive initial velocity continues right for sufficiently small positive time.
  ]
]

#leaf(s, [What to take away])[
  #panel([KEY IDEAS])[
    A differential equation encodes an instantaneous rule. A solution is a whole function. Initial data locate a particular history within the family allowed by the rule.
  ]

  - The highest derivative gives the order.
  - A linear equation combines the unknown and its derivatives with coefficients that can depend on the independent variable.
  - A first-order balance often has the form “rate of storage = rate in minus rate out”.
  - Signs and units provide a check before any integration.
  - A proposed solution must satisfy the equation on its interval and all the initial data.

  #heading(level: 3, numbering: none, outlined: false)[A last check without algebra]
  Imagine that the room begins warmer than the mug. Draw a plausible temperature curve. Label its initial value, initial tangent, and long-time limit. Explain which part of the equation determines each label. Then imagine that the room temperature changes during the experiment. A constant equilibrium temperature is no longer the right target; Section 3 will show how to represent a moving target.

  In Section 2 we find a formula by separating the state and time factors in a rate law. The cooling equation and the tank equation both allow this approach, which gives you two familiar examples to check against.
]
