#import "../../../../../template/unit.typ": *
#let s = [07 / UNDETERMINED COEFFICIENTS]
#start([Undetermined coefficients], number: "7")[
  Push a mass while it moves. Write the scaled equation as
  $ a y''+b y'+c y=f(t), quad a!=0. $
  Denote the operator on the left by $L[y]$. The forcing $f(t)$ is prescribed. Suppose you find *one* function $y_p$ with $L[y_p]=f$. If $y_c$ solves $L[y_c]=0$, linearity gives
  $ L[y_p+y_c]=L[y_p]+L[y_c]=f. $
  Conversely, the difference of any two responses to the same forcing solves the homogeneous equation. So $y=y_c+y_p$ gives the full solution family. We call $y_c$ the *complementary function* and $y_p$ a *particular integral*.

  The method of undetermined coefficients uses the fact that some families of functions stay in a small space under differentiation. A quadratic differentiates to a linear polynomial, then to a constant. A sine differentiates to a cosine, then returns to a sine with the opposite sign. Guess a form built from the whole relevant family, substitute it, and solve for its coefficients.

  #example([Constant push])[
    For $y''+2y'+5y=10$, try a constant $y_p=A$. Then $5A=10$, so $y_p=2$. The complementary function uses roots $-1 plus.minus 2i$. The full answer is $2+e^(-t)(C cos(2t)+D sin(2t))$. The constant response is the displacement for which the restoring term balances the push.
  ]

  #activity([7A])[
    Find the full solution of the constant-push example when $y(0)=2$ and $y'(0)=1$. Which part of the solution carries the initial velocity?
  ]
]

#leaf(s, [Polynomial and exponential forcing])[
  #example([Match all the powers])[
    Find a particular integral for $y''+y'+y=2t+3$. Use $y_p=A t+B$. The left side becomes $A t+(A+B)$. Comparing with $2t+3$ gives $A=2$, $B=1$. The constant term in the trial compensates for the constant produced when $A t$ is differentiated.
  ]

  For exponential forcing $K e^(lambda t)$, try $A e^(lambda t)$. Write $P(r)=a r^2+b r+c$. The resulting left side is $A P(lambda)e^(lambda t)$. If $P(lambda)!=0$, set $A=K/P(lambda)$. If it is zero, the exponential is already a free motion and the trial must change.

  #example([An exponential input])[
    For $y''+3y'+2y=12e^t$, test $y_p=A e^t$. Since $P(1)=6$, we have $A=2$. The full solution is
    $ y=C e^(-t)+D e^(-2t)+2e^t. $
    At late times the forced term grows while the free components fade. This growth comes from the input, despite both characteristic roots being negative.
  ]

  #activity([7B])[
    Find a particular integral for $y''+4y=3t^2+2$. Use the full quadratic. After substitution, decide which coefficient must be zero.
  ]
]

#leaf(s, [Sinusoidal forcing])[
  Sine and cosine must generally travel together in a trial, because the first derivative mixes them. For $y_p=A cos(omega t)+B sin(omega t)$, the coefficients of cosine and sine in $L[y_p]$ are
  $ (c-a omega^2)A+b omega B, quad (c-a omega^2)B-b omega A. $
  Set these equal to the corresponding coefficients of the forcing. The two-by-two system is invertible unless both $c-a omega^2=0$ and $b omega=0$.

  #example([A damped oscillator with periodic input])[
    For $y''+2y'+5y=4cos(t)$, the coefficient equations are $4A+2B=4$ and $4B-2A=0$. Hence $A=4/5$, $B=2/5$. Check the sine coefficient is zero. Both free modes decay, so the forced oscillation eventually describes the motion well.

    The forcing has its peak at $t=0$, while the particular integral initially rises, with slope $2/5$. The peaks of its cycle occur later by an angle $arctan(1/2)$ in radians.
  ]

  #activity([7C])[
    Find a particular integral for $y''+y'+2y=sin(t)$. Write the coefficient equations before solving them.
  ]

  If the forcing is a sum, solve for each contribution and add them. Linearity applies to both the free and the driven parts.
]

#leaf(s, [Resonance and the extra factor of time])[
  When a trial is already part of the complementary function, its image under $L$ is zero. Multiplying by $t$ often creates the missing component. For the exponential case,
  $ L[t e^(lambda t)]=e^(lambda t)(t P(lambda)+P'(lambda)). $
  A simple root has $P(lambda)=0$, $P'(lambda)!=0$, so the extra $t$ makes a useful trial. For a double root, use $t^2 e^(lambda t)$; substitution yields $2a e^(lambda t)$. Constant forcing is the exponential case $lambda=0$. For a resonant sine or cosine, multiply the whole sine-cosine trial by $t$.

  #example([Driving at the natural frequency])[
    For $y''+4y=cos(2t)$, compute $L[t sin(2t)]=4cos(2t)$. Thus $y_p=t sin(2t)/4$. Its value and its first derivative both vanish at zero, so it also solves the problem of a mass starting at rest at equilibrium.
  ]

  #diagram(image("../figures/resonance.svg", width: 100%, alt: "The oscillatory response stays within two straight envelopes whose absolute heights grow in time."), [An ideal undamped oscillator driven at its natural frequency. The linear envelopes come from the extra factor of time.])

  #activity([7D])[
    Find a particular integral for $y''-2y'+y=e^t$. Explain why multiplying the basic exponential trial once by $t$ still gives zero.
  ]
]

#leaf(s, [Workshop · Change the rhythm of the push])[
  Consider $y''+4y=cos(omega t)$, with $y(0)=0$ and $y'(0)=0$. Time and displacement are scaled. In the ideal model the same oscillator can show bounded interference or growing oscillations, depending on the driving frequency.

  #prompt([7W.1], [Find a nearby non-resonant response])[
    Use $omega=1$. Find a particular integral, add the complementary function, and apply both starting conditions. Check the first acceleration against the original equation.
  ]
  #prompt([7W.2], [Drive exactly at resonance])[
    Use $omega=2$. Find the full response from rest. Sketch the waveform and its envelope. Where in the formula does the growth appear?
  ]
  #prompt([7W.3], [Connect the two formulas])[
    For $omega!=2$ and $omega>0$, show that the response is
    $ (cos(omega t)-cos(2t))/(4-omega^2). $
    For fixed $t$, take the limit as $omega$ approaches $2$. Differentiate numerator and denominator with respect to $omega$, or use a first-order expansion at $omega=2$.
  ]
  #prompt([7W.4], [Add a damper])[
    For $y''+2y'+4y=cos(2t)$, find one particular integral. Explain why the large-time behaviour now differs from the undamped resonant case.
  ]

  Applying initial conditions to the combined response is essential. Near resonance, two large terms can cancel at early times, even when each term alone is large.
]

#leaf(s, [End-of-section exercises])[
  #prompt([7.1], [A constant force with initial data])[
    Solve $y''+3y'+2y=6$, $y(0)=0$, $y'(0)=0$. Give the equilibrium displacement and the long-time limit.
  ]
  #prompt([7.2], [Polynomial forcing])[
    Find a particular integral for $y''+2y'+3y=6t-1$. Verify its constant term by substitution.
  ]
  #prompt([7.3], [An overlapping exponential])[
    Find the general solution of $y''+y'-2y=3e^t$. Justify the factor in the trial and determine its coefficient.
  ]
  #prompt([7.4], [Two inputs at once])[
    Find a particular integral for $y''+2y'+2y=2+5cos(t)$. Use separate trials for the constant and periodic inputs.
  ]
  #prompt([7.5], [A constant that overlaps twice])[
    Solve $y''=4$ with $y(0)=1$, $y'(0)=-3$ by undetermined coefficients. Identify the root multiplicity and check using direct integration.
  ]
  #prompt([7.6], [Explain a failed trial])[
    For $y''+9y=sin(3t)$, explain why $A sin(3t)+B cos(3t)$ cannot work. Find a particular integral that does work, and check it by direct differentiation.
  ]

  #link(<solutions-7>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-7>
  #prompt([7A–7D], [Find and check trials])[
    *7A* $y=2+e^(-t)sin(2t)/2$; the free sine term carries the velocity. *7B* Write $y_p=A t^2+B t+C$. Matching $4A$, $4B$, $2A+4C$ to $3,0,2$ gives $A=3/4$, $B=0$, $C=1/8$. *7C* $A+B=0$, $B-A=1$, so $y_p=(-cos t+sin t)/2$. *7D* The root $1$ is double, so $L[t e^t]=0$ and $L[t^2 e^t]=2e^t$. Thus $y_p=t^2 e^t/2$.
  ]
  #prompt([7W], [Driving frequency])[
    At $omega=1$, $y=(cos t-cos(2t))/3$, so $y''(0)=1$. At $omega=2$, $y=t sin(2t)/4$, bounded between the growing envelopes $plus.minus t/4$. For other positive frequencies use $cos(omega t)/(4-omega^2)$ and subtract the free cosine with equal initial value. Differentiating the quotient’s numerator and denominator separately gives the limit $-t sin(2t)/(-4)$. With damping, $y_p=sin(2t)/4$ works since the acceleration and stiffness cancel and twice its first derivative is $cos(2t)$. The free response decays, leaving a bounded periodic motion.
  ]
  #prompt([7.1–7.3], [Constant, polynomial and exponential])[
    *7.1* $y=3-6e^(-t)+3e^(-2t)$; the equilibrium and limit are $3$. *7.2* $y_p=2t-5/3$ since $4+3(-5/3)=-1$. *7.3* Roots $1,-2$ make $e^t$ overlap. $L[t e^t]=3e^t$, so $y=C e^t+D e^(-2t)+t e^t$.
  ]
  #prompt([7.4–7.6], [Add responses and remove overlap])[
    *7.4* The constant contributes $1$. Solve $A+2B=5$, $B-2A=0$ for $y_p=1+cos t+2sin t$. *7.5* Zero is a double root. $y_p=2t^2$ and $y=1-3t+2t^2$, also found by integrating $y''=4$ twice. *7.6* Both trial terms solve the homogeneous equation. Since $L[t cos(3t)]=-6sin(3t)$, take $y_p=-t cos(3t)/6$.
  ]
]

#leaf(s, [What to take away])[
  #panel([ADD FREE MOTION AND A FORCED RESPONSE])[
    A complementary function contains the constants that let you fit the starting data. A particular integral supplies one response to the given forcing. Add them, then apply the initial conditions.
  ]

  #data-table(columns: (1fr, 1.3fr),
    table.header([Forcing term], [Basic trial before adjusting for overlap]),
    [Polynomial of degree $n$], [Full polynomial of degree $n$],
    [$K e^(lambda t)$], [$A e^(lambda t)$],
    [A sine or cosine at frequency $omega$], [$A cos(omega t)+B sin(omega t)$],
  )

  - If the exponential root matches a characteristic root of multiplicity $m$, multiply the trial by $t^m$. For a matching sinusoidal pair in a second-order equation, use $t$.
  - Substitute and match coefficients term by term. Solve for each distinct forcing contribution and add the results.
  - Integrating factors serve first-order linear equations even when the forcing has an inconvenient form. Undetermined coefficients relies on the special families in the table.
  - Resonant growth in the ideal undamped model arises from driving in step with the oscillator. Damping can turn it into a finite steady oscillation.

  #heading(level: 3, numbering: none, outlined: false)[A check that uses the original problem]
  For a mass released from rest, compute its first acceleration directly from the force balance. Then differentiate your finished formula twice at the starting time. The two values should agree.
]
