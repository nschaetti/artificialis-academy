#import "../../../../../template/unit.typ": *
#let s = [06 / HOMOGENEOUS SECOND-ORDER EQUATIONS]
#start([Homogeneous second-order equations], number: "6")[
  A mass slides on a horizontal track and is attached to a spring. Measure its displacement $x$ from the spring’s equilibrium position. If the spring force is $-k x$ and a damper exerts $-b x'$, Newton’s law gives
  $ m x''+b x'+k x=0. $
  Here $m>0$, $k>0$, and $b>=0$. The term $m x''$ has units of force. So do $b x'$ and $k x$, although the coefficients have different units. Initial position and velocity describe how you release the mass.

  This is a linear constant-coefficient equation. It is *homogeneous* because the right-hand side is zero. If $u$ and $v$ solve the equation, any constant linear combination $A u+B v$ also solves it: differentiating distributes over the sum and constants factor out.

  For the generic equation $a y''+b y'+c y=0$, with $a!=0$, try $y=e^(r t)$. Differentiation multiplies this function by $r$ each time. Substitution reduces the problem to
  $ (a r^2+b r+c)e^(r t)=0. $
  Since the exponential never vanishes, each root of the *characteristic equation* $a r^2+b r+c=0$ gives an exponential solution.

  #activity([6A])[
    Write the characteristic equation for $y''+5y'+6y=0$. Verify directly that $e^(-2t)$ is a solution.
  ]
]

#leaf(s, [Two distinct real roots])[
  If $r_1!=r_2$ are real roots, combine the two exponential solutions:
  $ y(t)=A e^(r_1 t)+B e^(r_2 t). $
  At time zero the conditions $y(0)=y_0$ and $y'(0)=v_0$ require
  $ A+B=y_0, quad r_1 A+r_2 B=v_0. $
  Subtract $r_1$ times the first equation from the second. The coefficient of $B$ is $r_2-r_1$, which is non-zero, so every pair of starting values determines one choice of $A$ and $B$. By uniqueness for the regular linear initial-value problem, this family gives every solution.

  #example([Find both constants])[
    If $y''+5y'+6y=0$, the roots are $-2$ and $-3$. With $y(0)=1$, $y'(0)=0$, solve $A+B=1$ and $-2A-3B=0$. Thus $B=-2$, $A=3$, and $y=3e^(-2t)-2e^(-3t)$.

    Both terms decay. The term with the less negative exponent usually dominates later. Here, dividing by $e^(-2t)$ leaves $3-2e^(-t)$, which tends to $3$.
  ]

  #activity([6B])[
    For $y''+y'-2y=0$ and $y(0)=1$, find the initial velocity that makes the solution decay to zero as $t$ grows. Explain why other initial velocities introduce a growing term.
  ]
]

#leaf(s, [A repeated real root])[
  A repeated root $r$ gives just one exponential. To uncover a second solution, let the multiplying constant vary and try $y=e^(r t)u(t)$. Substituting the derivatives gives
  $ a y''+b y'+c y=e^(r t)(a u''+(2a r+b)u'+(a r^2+b r+c)u). $
  The coefficient of $u$ vanishes because $r$ is a root. At a repeated root, the derivative of the characteristic polynomial also vanishes, so $2a r+b=0$. Thus $u''=0$ and the two constants appear in
  $ y(t)=(A+B t)e^(r t). $
  Its initial values are $y(0)=A$ and $y'(0)=B+r A$, which can match any given pair.

  #example([A critically damped release])[
    For $x''+4x'+4x=0$, the characteristic polynomial is $(r+2)^2$. From $x(0)=1$ and $x'(0)=0$ obtain $A=1$ and $B=2$. The solution is $x=(1+2t)e^(-2t)$. Its derivative is $-4t e^(-2t)$, negative for $t>0$. The motion returns towards equilibrium without crossing it for these initial data.
  ]

  #activity([6C])[
    Solve $y''-6y'+9y=0$ with $y(0)=0$, $y'(0)=1$. What part of the answer would be lost by taking two copies of $e^(3t)$?
  ]
]

#leaf(s, [A complex conjugate pair])[
  Suppose the roots are $alpha plus.minus i beta$, with $beta>0$ and $i^2=-1$. Euler’s formula $e^(i theta)=cos theta+i sin theta$ turns the complex exponential into two real solutions. Because the coefficients of the differential equation are real, taking the real and imaginary parts preserves the equation. Write
  $ y(t)=e^(alpha t)(A cos(beta t)+B sin(beta t)). $
  The initial values give $A=y_0$ and $beta B=v_0-alpha y_0$. The factor $e^(alpha t)$ changes the envelope. The angle $beta t$ controls the oscillation. The period of the sine and cosine factors is $2pi/beta$, even if damping prevents the whole displacement from repeating.

  #example([Damped oscillation from a release])[
    For $x''+2x'+10x=0$, the roots are $-1 plus.minus 3i$. If $x(0)=1$ and $x'(0)=0$, then $A=1$ and $B=1/3$. Omitting the sine term would give an initial velocity of $-1$. Both terms are needed even though the release begins at rest.
  ]

  #diagram(image("../figures/damping.svg", width: 100%, alt: "Damped oscillation crosses zero. Critically damped and overdamped traces approach zero from above for the release shown."), [Three returns to equilibrium from unit displacement and zero initial velocity, using three different sets of coefficients.])

  #activity([6D])[
    For $y''+16y=0$, $y(0)=0$, $y'(0)=8$, find the amplitude and period.
  ]
]

#leaf(s, [Workshop · Four ways to release a spring])[
  Use dimensionless time and displacement. Compare $x''+b x'+4x=0$ for $b=0,2,4,5$, with $x(0)=1$ and $x'(0)=0$ in every case. Holding the spring term fixed isolates the effect of changing the damping.

  #prompt([6W.1], [Make a root map])[
    Find the roots for each damper setting. Identify the undamped, underdamped, critically damped and overdamped cases. Use the sign of the discriminant to locate the transition.
  ]
  #prompt([6W.2], [Predict from the roots])[
    Which cases oscillate? For the underdamped case, find the frequency parameter and identify its envelope. For the overdamped case, identify the exponential that decays slowest.
  ]
  #prompt([6W.3], [Calculate two histories])[
    Find the exact solutions for $b=2$ and $b=5$ with the stated initial conditions. Sketch them with a common horizontal axis. Verify the initial value and initial slope on both curves.
  ]
  #prompt([6W.4], [Check the energy direction])[
    Define $E=(x')^2/2+2x^2$. Differentiate and use the equation to show $E'=-b(x')^2$. Explain what this tells you about each damper setting even before you solve the motion.
  ]

  In this comparison every mass starts with the same spring energy. An undamped system trades spring energy for kinetic energy and back. Damping removes energy most rapidly when the speed is large.
]

#leaf(s, [End-of-section exercises])[
  #prompt([6.1], [Distinct real roots])[
    Solve $y''-y'-6y=0$, $y(0)=2$, $y'(0)=1$. Which component dominates at large positive time?
  ]
  #prompt([6.2], [Repeated root])[
    Solve $y''+8y'+16y=0$, $y(0)=2$, $y'(0)=-4$. Differentiate your answer to check the velocity.
  ]
  #prompt([6.3], [Complex roots])[
    Solve $y''+6y'+13y=0$, $y(0)=0$, $y'(0)=6$. Find the first positive zero and a decaying envelope for the magnitude.
  ]
  #prompt([6.4], [Set a critical damper])[
    A model $2x''+b x'+18x=0$ uses SI units. Find the positive $b$ for critical damping. With $x(0)=0.1$ m, $x'(0)=0$, find the motion and the units of $b$.
  ]
  #prompt([6.5], [Read the equation backwards])[
    A displacement is $e^(-t)(3cos(2t)-sin(2t))$. Construct a monic homogeneous second-order equation with constant real coefficients that it solves. Find its initial velocity.
  ]

  #link(<solutions-6>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-6>
  #prompt([6A–6D], [Roots and initial conditions])[
    *6A* $r^2+5r+6=0$; substituting $e^(-2t)$ gives $(4-10+6)e^(-2t)=0$. *6B* Roots $1,-2$ imply decay only when the growing coefficient is zero. Then $y=e^(-2t)$ and $y'(0)=-2$. *6C* $y=t e^(3t)$; without the factor $t$, the two proposed copies give only one free constant. *6D* $y=2sin(4t)$, amplitude $2$, period $pi/2$.
  ]
  #prompt([6W], [Damper comparison])[
    Roots for $b=0,2,4,5$ are respectively $plus.minus 2i$, $-1 plus.minus i sqrt(3)$, $-2$ repeated, and $-1,-4$. The first two oscillate. The underdamped envelope scales as $e^(-t)$; the slow overdamped mode is $e^(-t)$. At $b=2$, $x=e^(-t)(cos(sqrt(3)t)+sin(sqrt(3)t)/sqrt(3))$. At $b=5$, $x=(4e^(-t)-e^(-4t))/3$. Both start at $1$ with derivative zero. The identity $E'=x'(x''+4x)=-b(x')^2$ gives constant energy for $b=0$ and non-increasing energy for $b>0$.
  ]
  #prompt([6.1–6.3], [Three root patterns])[
    *6.1* Roots $3,-2$ give $y=e^(3t)+e^(-2t)$, dominated by $e^(3t)$. *6.2* $y=(2+4t)e^(-4t)$ has derivative $(-4-16t)e^(-4t)$. *6.3* Roots $-3 plus.minus 2i$ give $y=3e^(-3t)sin(2t)$, with first positive zero at $pi/2$ and envelope $3e^(-3t)$.
  ]
  #prompt([6.4–6.5], [Coefficients from roots])[
    *6.4* $b^2=4(2)(18)$ gives $b=12$ kg/s and repeated root $-3$. Hence $x=0.1(1+3t)e^(-3t)$ metres. *6.5* Roots $-1 plus.minus 2i$ give the polynomial $(r+1)^2+4$, so $y''+2y'+5y=0$. The initial velocity is $-3-2=-5$.
  ]
]

#leaf(s, [What to take away])[
  #panel([RECOGNISE THE ROOT PATTERN])[
    The characteristic polynomial turns differentiation of an exponential into multiplication. The form of the solution depends on how many distinct roots it has and whether they are real.
  ]

  #data-table(columns: (1fr, 1.4fr),
    table.header([Roots], [General solution]),
    [$r_1,r_2$ distinct and real], [$A e^(r_1 t)+B e^(r_2 t)$],
    [$r$ repeated and real], [$(A+B t)e^(r t)$],
    [$alpha plus.minus i beta$], [$e^(alpha t)(A cos(beta t)+B sin(beta t))$],
  )

  - Use both initial conditions after writing the full two-constant family.
  - Negative real parts give decaying modes. A positive real part gives a mode that can grow.
  - The imaginary part sets the oscillation rate. A repeated root adds a polynomial factor.
  - Compare the solution with the motion or energy balance you expect from the model.

  #heading(level: 3, numbering: none, outlined: false)[A change in the experiment]
  So far the motion begins when you release the mass, and the spring and damper determine what follows. If you continue pushing it with a prescribed force, the homogeneous calculation still describes the part due to free motion. The next section calculates one response to the ongoing force.
]
