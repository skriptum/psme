# Tanks or Teachers



Extension Solow Model

- idea: why do countries spend on military
  - current NATO Expansion
- there is a opportunity cost for it
  - swords to ploughshares
  - guns and butter
  - today: Tanks or Teachers



model the decision making process

- between military spending 
- and human capital

=> military spending = protection

- protects the physical capital stock (Destruction)
- and human capital (loss of lifes)



Simple Model

- following MRW
- with fixed tax amount, either going to military spending or education
  - empirical: rising military atm lower education spending
- function modelling the risk of war

$$
D = (n+d) + z(m) \\
z(m) =z_0e^{-\sigma m}
$$

- n+d = normal depreciation 
- $z(m) = z_0 e^{-km}$ = expected war loss
  - chance of war
  - and destruction in case of war
  - Z0 = chance of war without military
  - $e^{-\sigma m}$ = decreasing war loss due to military
    - deterrence effect
    - or better protection (e.g air defence)
  - sigma = factor defining it. in simple case: k=1
- D = Deprecetion / Damage Factor



Laws of Motion
$$
\dot{k} = s(1-t)y - (n+d)k - z(m)k \\= s(1-t)y - D(m) \cdot k \\
\dot{h} = (t-m)y - D(m) \cdot h \\
$$

- both stocsk are impacted by deprecation + destruction
- factor into equation as in normal version


Steady State
$$
\dot{k} = 0 \implies k^* = \frac{s(1-t)}{D(m)}y \\
h^* = \frac{(t-m)}{D(m)}y \\
$$
Subst in $y = k^{\alpha} h^\beta$
$$
y = [\frac{s(1-t)}{D(m)}y]^\alpha [\frac{(t-m)}{D(m)}y]^\beta \\
  = y^{\alpha+\beta}[s(1-t)]^\alpha [t-m]^\beta D(m)^{-(\alpha+\beta)} \\
  y^* = \{[s(1-t)]^\alpha [t-m]^\beta D(m)^{-(\alpha+\beta)} \}^{1/1-\alpha-\beta}
$$

- investment into physical capital
- investment into human capital 
- damage term, applying to both of them



Maximize:

- we want to maximize y over military consumption
  - bracket factor doesnt matter (no m)
  - physical capital factor doesnt matter

Derivative of $D: D' = - \sigma z_0$


$$
= \overbrace{[t-m]^\beta}^f \overbrace{D(m)^{-(a+b)}}^g\\

\overbrace{-\beta[t-m]^{\beta-1}}^{f'} \cdot \overbrace{D(m)^{-(a+b)}}^{g} +
\overbrace{[t-m]^{\beta}}^{f} \cdot \overbrace{-(\alpha+\beta) D(m)^{-(a+b)-1}D'}^{g'} \\
$$
Factor out positive things
$$
[-\beta D - (\alpha+\beta)(t-m) D'] \cdot (t-m)^{\beta-1} D(m)^{-(a+b)-1}
$$

- on both sides similar terms
- both negative exponents, aka both negative, combined both positive
- inside the bracket, the relevant things are left

Extract and insert: $D = n+d+z(m)$, $D' = -\sigma z(m)$
$$
N(m) = [-\beta D - (\alpha+\beta)(t-m) D'] \\
= - \beta[n+d+z(m)] 
-(\alpha+\beta)(t-m) [-\sigma z(m)]
$$
Optimum: N(m) = 0
$$
(\alpha+\beta)(t-m) \sigma z(m) = \beta[n+d+z(m)] \\
\frac{(\alpha+\beta)\sigma z(m)}{n+d+z(m)} = \frac{\beta}{(t-m)}
$$
Intuitive explanation

- right = cost of tanks
  - dependent on improtance of human capital 
  - and share of taxes spent on military
- left = benefit of tanks
  - Denom: higher m = lower z = lower destruction 
  - Nom: higher chance of war = higher benefit
    - (a+b) = both stocks combined, protection



military spending: $m^* > 0$ IF N(m) > 0

- aka MB > MC of tanks

rearrange
$$
N(0) = -\beta[n+d+z(0)]-(\alpha+\beta)t[-\sigma z(0)] \\
= z_0 [-\beta + (\alpha+\beta)t \sigma ] - \beta(n+d) > 0 \\
z_0 > \frac{-\beta(n+d)}{(\alpha+\beta)\sigma t-\beta}
$$
= Critical Value for Military



Numerical Solving

- $\alpha = \beta = 1/3$
- (n+d) = 0.05
- sigma = 1
- t = total taxes 



first of all: RHS only positive if 
$$
(\alpha+\beta) \sigma t - \beta > 0 \\
(\alpha+\beta) \sigma t > \beta \\ 
\implies t > 0.5
$$
Only if tax rate in economy is > 50%, military spending is worth it

- Otherwise: not really



- Take a numerical example with a higher sigma
  - to illustrate these examples
  - 





Policymakers:

- in this example: build assumptions about z_0 and sigma
  - Sigma = deterrence effect
    - nuclear bombs: infinity
  - z_0: how realistic is a war risk at this moment
- 
