#import "../../../../../template/unit.typ": *
#let s = [03 / INTEGRATING FACTORS]
#start([Integrating factors], number: "3")[
  Suppose the room around the mug warms as the experiment runs. The rate law becomes $T'=-k(T-R(t))$, where the room temperature $R(t)$ is a known function. The unknown and the prescribed temperature occupy different terms, so separation generally fails. Put the equation into linear form:
  $ y'+p(t)y=q(t). $

  The product rule gives the way in. If we find a function $mu$ such that $mu'=p mu$, then
  $ (mu y)'=mu y'+mu' y=mu(y'+p y)=mu q. $
  Choose $mu(t)=e^(integral p(t) dif t)$, using any one antiderivative in the exponent. The multiplying function is called an *integrating factor*. It is positive wherever the antiderivative is defined. This lets us divide by it at the end.

  #example([Build the product])[
    Solve $y'+3y=6$ with $y(0)=1$. Take $mu=e^(3t)$ and integrate $(e^(3t)y)'=6e^(3t)$. This gives $e^(3t)y=2e^(3t)+C$, or $y=2+C e^(-3t)$. The starting value sets $C=-1$. The solution increases towards $2$, as the original rate law predicts.
  ]

  #activity([3A])[
    Find an integrating factor for $y'-2t y=t$. Write the new equation as a product derivative, without integrating the right-hand side yet.
  ]
]

#leaf(s, [Normalise the derivative first])[
  The integrating factor uses the coefficient of $y$ *after* the coefficient of $y'$ has been made one. Division may change where the calculation applies.

  #example([A singular starting point])[
    Solve $t y'+2y=t^3$ with $y(1)=2$. Work on $t>0$ because it contains the initial point and excludes the zero of the leading coefficient. Divide by $t$:
    $ y'+(2/t)y=t^2, quad mu=e^(2ln t)=t^2. $
    Now $(t^2y)'=t^4$, so $y=t^3/5+C/t^2$. The initial value gives $C=9/5$. The inverse-square term does not allow continuation through zero.
  ]

  Integrating $2/t$ on an interval with $t<0$ would use $2ln abs(t)$. Both sides admit $t^2$ as an integrating factor, but the constant of integration belongs to the interval on which the original problem has been posed.

  At $t=0$, the original equation imposes $2y(0)=0$ rather than determining a derivative from an arbitrary initial value. For this example, $y=t^3/5$ happens to extend through zero. A computation that divides by $t$ must earn such an extension by checking the original equation.

  #activity([3B])[
    Solve $(x+1)y'+y=(x+1)^2$ with $y(0)=0$. Find the coefficient $p$ after division and state the interval containing the initial point where that coefficient is continuous.
  ]
]

#leaf(s, [What the initial value contributes])[
  Start at $t_0$ and choose $mu(t)=e^(integral_(t_0)^t p(u) dif u)$, so that $mu(t_0)=1$. Integrating the product derivative gives
  $ y(t)=1/mu(t) (y_0 + integral_(t_0)^t mu(u)q(u) dif u). $
  The $y_0$ term describes the part carried from the initial state. The integral adds up the influence of the forcing. This expression is valid on an interval containing $t_0$ on which $p$ and $q$ are continuous.

  #example([When a closed-form integral is inconvenient])[
    For $y'+y=e^(-t^2)$ with $y(0)=1$, take $mu=e^t$. An exact expression is
    $ y(t)=e^(-t)(1+integral_0^t e^(u-u^2) dif u). $
    At zero the integral vanishes. The product rule and the fundamental theorem of calculus verify the equation. To get a number at a specific time, evaluate the definite integral numerically.
  ]

  Solutions with different initial values but the same forcing differ by a homogeneous solution. Subtract their equations. The forcing cancels, leaving $d'+p(t)d=0$, so $d=d(t_0)/mu(t)$. This explains why an initial discrepancy decays for constant $p>0$.

  #activity([3C])[
    Two solutions of $y'+4y=q(t)$ differ by $5$ at $t=0$. How long until their difference is $1$? Does the answer depend on the forcing $q$?
  ]
]

#leaf(s, [Following a moving target])[
  Suppose the room temperature rises linearly, $R(t)=20+0.5t$ °C. With $k=0.2$ per minute and a starting liquid temperature of $20$ °C,
  $ T'+0.2T=4+0.1t, quad T(0)=20. $
  You can integrate directly. For intuition, set $D=R-T$, the amount by which the liquid lags the room. Since $T'=0.2D$ and $R'=0.5$, the new equation is $D'+0.2D=0.5$, $D(0)=0$.

  #example([Quantify the lag])[
    Multiplying by $e^(0.2t)$ gives $(e^(0.2t)D)'=0.5e^(0.2t)$. Integrate and impose the initial condition:
    $ D(t)=2.5(1-e^(-0.2t)), quad T(t)=17.5+0.5t+2.5e^(-0.2t). $
    After several time constants the liquid warms at about $0.5$ °C/min, while staying around $2.5$ °C cooler than the room. The gap produces exactly the rate needed to keep up.
  ]

  The time constant is $1/k=5$ min. After one time constant the gap is $1-e^(-1)$ of its limiting value. The predicted lag depends on both the response time and the speed of the target.

  #activity([3D])[
    If the room cools at $1$ °C/min instead, with the same $k$ and the same initial temperature for room and liquid, derive the limiting value of $R-T$. Which one stays warmer once the transient fades?
  ]
]

#leaf(s, [Workshop · A reservoir that changes its input])[
  A tank containing $30$ L is well mixed. Inflow and outflow are both $3$ L/min. The incoming salt concentration is $2+0.1t$ g/L for $0<=t<=20$. Initially the water contains no salt. Let $c(t)$ be the concentration in the tank.

  #prompt([3W.1], [Start with mass conservation])[
    Write the rate equation for $30c(t)$ and divide through to obtain a linear equation for $c$. Identify the integrating factor.
  ]
  #prompt([3W.2], [Find the response])[
    Use the integrating factor to derive $c(t)$. Check the constant term, the initial value and the initial rate.
  ]
  #prompt([3W.3], [Interpret the exponential])[
    Find the concentration at $t=20$. Compare it with the concentration in the inflow at that time. What is the time constant?
  ]
  #prompt([3W.4], [Change the input at time 20])[
    The inflow concentration becomes constant at $4$ g/L after $t=20$. Use the value you found as new initial data and write the solution for $t>=20$. Does the derivative change abruptly at $20$ in this model?
  ]

  #panel([CHECK THE JOIN])[
    A change in the input law can require a different expression, even when the concentration and its derivative match at the join. Use the state at the switch to connect the two formulas.
  ]
]

#leaf(s, [End-of-section exercises])[
  #prompt([3.1], [A constant coefficient])[
    Solve $y'+2y=8$ with $y(0)=1$. Find the time when $y=3$.
  ]
  #prompt([3.2], [An exponential on the right])[
    Solve $y'-y=e^t$ with $y(0)=0$. Explain why multiplication makes the new right-hand side constant.
  ]
  #prompt([3.3], [A variable coefficient])[
    Solve $y'+2t y=2t$ with $y(0)=4$. Check its parity and give its limit for large positive $t$.
  ]
  #prompt([3.4], [Find the interval])[
    Solve $x y'-y=x^2$ with $y(1)=0$. First work on the positive interval justified by normalising the equation. Then check whether your expression satisfies the original equation even at zero.
  ]
  #prompt([3.5], [Read a prediction from an integral])[
    Write an exact definite-integral expression for $y'+3y=sin(t^2)$, $y(0)=0$. Bound $abs(y(t))$ for $t>=0$ using $abs(sin(t^2))<=1$.
  ]

  #link(<solutions-3>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-3>
  #prompt([3A–3D], [Construct and interpret the factor])[
    *3A* $mu=e^(-t^2)$ gives $(e^(-t^2)y)'=t e^(-t^2)$. *3B* $p=1/(x+1)$ on $x>-1$. Thus $((x+1)y)'=(x+1)^2$ and $y=((x+1)^3-1)/(3(x+1))$. *3C* The difference is $5e^(-4t)$ regardless of $q$. The time is $(ln 5)/4$. *3D* $D'+0.2D=-1$ gives $D=-5(1-e^(-0.2t))$. The liquid stays warmer.
  ]
  #prompt([3W], [Mixing with a switch])[
    Mass balance gives $30c'=3(2+0.1t)-3c$, so $mu=e^(0.1t)$. Integration gives $c=1+0.1t-e^(-0.1t)$ up to time $20$. It starts at zero with slope $0.2$ g/L/min. At $20$, $c=3-e^(-2)$, below the inflow by $1+e^(-2)$. The time constant is $10$ min. After the switch $c=4-(1+e^(-2))e^(-0.1(t-20))$. The slopes match because the input concentrations match at time $20$.
  ]
  #prompt([3.1–3.3], [Integrate the product])[
    *3.1* $(e^(2t)y)'=8e^(2t)$ yields $y=4-3e^(-2t)$, so $t=(ln 3)/2$. *3.2* $(e^(-t)y)'=1$ because the exponentials cancel, hence $y=t e^t$. *3.3* $(e^(t^2)y)'=2t e^(t^2)$ yields $y=1+3e^(-t^2)$. It is even and tends to $1$.
  ]
  #prompt([3.4–3.5], [Extend or bound])[
    *3.4* $mu=1/x$ on $x>0$ gives $(y/x)'=1$, so $y=x^2-x$. The polynomial satisfies the original equation even at zero. *3.5* $y=e^(-3t)integral_0^t e^(3u)sin(u^2) dif u$. Taking absolute values bounds it by $(1-e^(-3t))/3$.
  ]
]

#leaf(s, [What to take away])[
  #panel([THE PRODUCT RULE IN REVERSE])[
    Choose $mu$ to satisfy $mu'=p mu$. Then $mu$ times the left side of $y'+p y=q$ is the derivative of $mu y$. One integration finishes the main work.
  ]

  + Make the coefficient of $y'$ equal to one on a suitable interval.
  + Find a single antiderivative of $p$ and exponentiate it.
  + Multiply every term by $mu$, including the forcing.
  + Integrate, divide by $mu$, and impose the initial data.
  + Check the interval and verify the result by differentiation.

  #heading(level: 3, numbering: none, outlined: false)[Decide before calculating]
  The equation $y'=3-2y$ is both separable and linear. Solve it in whichever way you find shorter. Then replace $3$ by $3t$. The integrating factor stays the same, whereas the separation step no longer has the same factorisation. This distinction helps you choose a method before a long calculation.

  Even when you can find a formula, a picture often answers the immediate question more quickly. In the next section you will learn to draw a prediction of the overall behaviour directly from a first-order equation.
]
