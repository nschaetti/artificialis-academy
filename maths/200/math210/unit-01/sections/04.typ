#import "../../../../../template/unit.typ": *
#let s = [04 / DIRECTION FIELDS]
#start([Direction fields], number: "4")[
  A first-order equation $y'=f(t,y)$ gives a slope at every point $(t,y)$ where $f$ is defined. You can draw short segments of these slopes on a grid before solving the equation. The result is a *direction field*. A solution curve follows the segments in the sense that its tangent at each point has the prescribed slope.

  Consider $y'=t-y$. Below the line $y=t$, the rate is positive. Above the line, it is negative. Along the line, the rate is zero. This simple classification already tells you where an unknown solution is rising or falling.

  #diagram(image("../figures/direction-field.svg", width: 100%, alt: "Slopes for y prime equals t minus y, with two trajectories and the diagonal of zero slopes."), [The curve starting at $1.7$ first falls and then rises. The dashed diagonal has horizontal field segments.])

  A direction field contains many possible tracks. The starting point selects the track of interest. A field is especially helpful when the main question is whether a solution grows, turns, or stays between two bounds.

  #activity([4A])[
    For this field, find the slopes at $(0,1)$, $(1,1)$, and $(2,1)$. Draw three correctly tilted marks at these points on a sheet of paper.
  ]
]

#leaf(s, [Draw the field by hand])[
  A field need not be fine to be informative. Start with places where the slope is zero or especially simple. Take a few sample points between them and mark a short line segment centred at each point. On equally scaled axes, slope $2$ means rise two units for each unit to the right. On differently scaled axes, account for the visual scale.

  #example([Lines of equal slope])[
    For $y'=t-y$, set the slope equal to $m$ and solve for the points with this slope:
    $ t-y=m, quad y=t-m. $
    Thus every segment along $y=t-1$ has slope $1$, and each along $y=t+1$ has slope $-1$. The lines themselves have slope $1$. Only $y=t-1$ is a solution curve because its own derivative agrees with its assigned slope everywhere.
  ]

  Sets where $f(t,y)$ has a fixed value are called *isoclines*. A horizontal segment written on the zero-slope isocline gives the tangent of a solution at that point. The zero-slope isocline can itself be tilted, curved or disconnected.

  #activity([4B])[
    Draw the isoclines corresponding to slopes $-1$, $0$, and $1$ for $y'=2-y$. Mark the correct slope on each. Which isocline is a solution?
  ]

  Use short marks. Long strokes connect points that may have different slopes and can make a misleading trail.
]

#leaf(s, [Equilibria and the sign line])[
  An equation $y'=F(y)$ is *autonomous*. Its direction field repeats the same pattern at every time. You can compress its sign information into a line of state values, with an arrow toward increasing $y$ where $F(y)>0$ and toward decreasing $y$ where $F(y)<0$.

  #example([Two equilibria])[
    For $y'=y(1-y)$, the signs on the three intervals are
    #data-table(columns: (1fr, 1fr, 1fr),
      table.header([$y<0$], [$0<y<1$], [$y>1$]),
      [decreases], [increases], [decreases],
    )
    Near $1$, arrows point towards it from both sides, so it is attracting. Near $0$, both sides move away, so it is repelling. Starting exactly at either equilibrium gives a constant solution. Near an equilibrium the rate can be small even though the long-term trend is decided.
  ]

  The sign line describes motion between equilibria, but does not give a travel time. A solution beginning in $(0,1)$ increases and stays bounded by $1$ by uniqueness. Its limit must have zero rate, since a rate that remains bounded away from zero would eventually carry it past the limit. Here the limit is $1$.

  #activity([4C])[
    Draw the sign line for $y'=(y-1)^2$. Which side approaches $1$ and which side moves away? Use the exact formula from the $u'=u^2$ example if you want to check the right-hand endpoint.
  ]
]

#leaf(s, [When solutions turn or meet])[
  For a rule $f(t,y)$ that is continuous with continuous partial derivative in $y$ near a point, a standard local uniqueness theorem gives one solution through that point. On a region where this condition holds, distinct solution curves cannot cross there: at the intersection they would have the same initial data. The theorem is local and does not rule out finite-time blow-up.

  For $y'=t-y$, define $d=y-t$. Then $d'=-d-1$. The zero-slope line for $y$ is $d=0$. There, $d'=-1$, so the solution crosses this moving line from above to below. The function $y$ changes from falling to rising at the crossing.

  #example([A turning time])[
    With $y(0)=2$, the difference equation gives $d=-1+3e^(-t)$. It crosses zero at $t=ln 3$. Since $y'= -d$, the sign changes from negative to positive. Therefore $y$ has a minimum at $t=ln 3$, with minimum value $ln 3$.
  ]

  #activity([4D])[
    For $y'=t-y$, take $y(0)=-1$. Predict the curve geometrically using the isocline of slope $1$. Then test your prediction by substitution.
  ]

  A slope of zero at one point supplies a candidate extremum. To conclude there is an extremum, check the slope on each side of that point.
]

#leaf(s, [Workshop · A moving equilibrium value])[
  A store of energy is measured by $y$. Suppose its instantaneous rate obeys $y'=2(t-y)$ in scaled units. Compare histories starting at $y(0)=3$ and $y(0)=0$.

  #prompt([4W.1], [Create a small direction field])[
    Use times $0,1,2,3$ and state values $0,1,2,3$. At each point mark the slope $2(t-y)$. Draw the zero-slope line in a different style and indicate increasing and decreasing regions.
  ]
  #prompt([4W.2], [Make a qualitative forecast])[
    Sketch the two starting tracks. For the first, explain why the rate is initially negative and what happens if it reaches the zero-slope line. For the second, compare its initial tangent with the initial direction of motion of the line.
  ]
  #prompt([4W.3], [Find a parallel solution])[
    Test a straight line $y=t+c$ in the equation. Find $c$. Explain how a trajectory starting above the line can approach it while remaining above it.
  ]
  #prompt([4W.4], [Test the turning point])[
    Set $d=y-t$, solve the resulting equation for the track starting at $3$, and find its minimum. Compare the result with the sketch.
  ]

  The field and the straight-line solution show visually what the algebra will confirm: both starting tracks tend towards a fixed lag behind the moving line $y=t$.
]

#leaf(s, [End-of-section exercises])[
  #prompt([4.1], [Make an isocline sketch])[
    For $y'=t+y$, draw the isoclines for slopes $-2$, $0$, and $2$. Add segments with those slopes and sketch the initial direction of the track starting at $(0,1)$.
  ]
  #prompt([4.2], [Read a sign line])[
    For $y'=y(y-2)$, find the equilibria, classify each by the arrows nearby, and predict the behaviour from $y(0)=1$ for positive time.
  ]
  #prompt([4.3], [Spot a curve that cannot be a solution])[
    In the field for $y'=1-t$, could a solution cross the vertical line $t=1$ with non-zero slope? Sketch two possible histories. Can these histories intersect?
  ]
  #prompt([4.4], [Locate a turn])[
    For $y'=t-y$ with $y(0)=1$, use $d=y-t$ to find the time of the minimum. Find another initial value for which the solution grows throughout $t>0$.
  ]
  #prompt([4.5], [Compare a zero rate and equilibrium])[
    For $y'=t^2-y$, find the zero-slope isocline. Explain why the entire isocline is not a solution. At which point does its own slope equal the prescribed slope?
  ]

  #link(<solutions-4>)[Check your answers →]
]

#leaf(s, [Activity and exercise solutions])[
  #metadata(none) <solutions-4>
  #prompt([4A–4D], [Read slopes and equilibria])[
    *4A* Slopes $-1,0,1$. *4B* The horizontal lines are $y=3,2,1$, respectively. Only $y=2$ has zero slope as required. *4C* Motion is increasing on both sides. The lower side approaches $1$; the upper side moves away and blows up at $t=1/(y(0)-1)$. *4D* The track $y=t-1$ starts correctly, has derivative $1$ and satisfies $t-y=1$.
  ]
  #prompt([4W], [Moving reference line])[
    Below $y=t$ the marks tilt up, and above they tilt down. From $(0,3)$ the track falls until it meets the diagonal and then rises. From $(0,0)$ its initial tangent is flat, so the diagonal initially moves above it. A straight solution has $1=-2c$, so $c=-1/2$. Uniqueness prevents crossing that solution. For the first track, $d'+2d=-1$ gives $d=-1/2+(7/2)e^(-2t)$. It reaches zero at $t=(ln 7)/2$ and $y=t$ there. For the second track $d=-1/2+(1/2)e^(-2t)$.
  ]
  #prompt([4.1–4.3], [Geometry of the field])[
    *4.1* $y=-t-2$, $y=-t$, $y=-t+2$. The starting slope is $1$. *4.2* Signs are positive, negative, positive on the intervals split by $0$ and $2$. Thus $0$ attracts and $2$ repels. From $1$ the track decreases to $0$. *4.3* All slopes are zero at $t=1$. Histories are vertical translates of $t-t^2/2$, so distinct ones never meet.
  ]
  #prompt([4.4–4.5], [Moving zero-slope sets])[
    *4.4* $d=-1+2e^(-t)$ gives the minimum at $ln 2$. The initial value $-1$ gives slope $1$ everywhere. *4.5* The isocline is $y=t^2$. The equation assigns slope zero along it, but its derivative is $2t$. These slopes agree only at $(0,0)$.
  ]
]

#leaf(s, [What to take away])[
  #panel([READ THE GEOMETRY])[
    A direction field replaces an equation by a picture of its local slopes. It can show many solution curves at once, including thresholds, turning points and attracting states.
  ]

  - A solution curve must have slope $f(t,y)$ at every point it passes through.
  - Isoclines mark equal slopes. A zero-slope isocline is a set of horizontal tangencies.
  - For an autonomous equation, a zero of the rate gives an equilibrium. The rate signs on either side describe attraction or repulsion.
  - A smooth rate law gives local uniqueness. Check the assumptions before relying on a non-crossing argument.
  - A sketch can tell you the direction of change. Computing values at specified times calls for a formula or a numerical method.

  #heading(level: 3, numbering: none, outlined: false)[One prediction to carry forward]
  When you draw a solution curve through a field by hand, your pencil changes direction continuously. A computer can instead move by short straight segments, reading a fresh slope at each new point. As the segments get shorter, you would expect the approximation to improve. The next section shows how to test that expectation.
]
