# 29.10.2026 Endogeneity

> coherent, interesting and doable research agenda is the solid foundation on which useful statistical analyses are built

=> think about quesiton before regressing

Interesting questions: causal! but proving something is involved with a lot of problems...

**Endogeneity**:

- Mathematical: covariance of $x_1$ and error terms
- Intuition: Population has some characteristics, that influence the relationship



## Reverse Causality

$$
y = a + bx + e
$$

x => y, but also y => x 

e.g economic institutions and performance; police and crime



> Example: Acemoglu and Institutions
>
> Institutios => Growth or Growth => Institutions (endogeneity)
>
> Solution: Instrumental Variable
>
> - Mortality Rates of European Settlers in colonial times
>   - High Mortality = extractive institutions were set up
> - These Inst. = persist until today
>
> => European Mortality = Instrument for todays institutions 
>
> and surely not related to growth trajectory



## Omitted Variables (OVB)

An unknown variable correlates with one / more explanatory variables

leads to biased estimation $E(\hat{\beta}_1) = \beta_1$

*Direction of the bias*: 

|               | Corr (x1,x2) > 0 | Corr < 0 |
| ------------- | ---------------- | -------- |
| $\beta_2 > 0$ | +                | -        |
| $\beta_2 < 0$ | -                | +        |



Example: 

- real: $wage = \beta_0 + \beta_1 educ + \beta_2 abil$
- Estimated: $wage = \alpha_0 + \alpha_1 educ$

=> $\hat{\alpha} = \hat{\beta_1}+\hat{\beta_2} \lambda$ 

Direction:

- $\beta_2$ > 0 (ability is good for wage)
- Corr(educ, abil) > 0

=> $\alpha$ upward biased

Easier: to find sign of OV *z*

$$
\underbrace{\beta_2}_{\text{effect: z on y}} \times \underbrace{ Cov(x,z)}_{\text{rel. x and z}}
$$

Multiply to find sign

## Measurement Error

Variable is measured with noise (often in social science)

**dependent variable**

- we observe $\tilde{y} = y+v$, with $E(v)=0$

$$
\tilde{y} = \alpha + \beta x + u \\
y + v = \alpha + \beta x + u \\
\implies \underline{y = \alpha + \beta x + u - v}
$$

aka $\epsilon = u-v$

- no effect on estimators: $\hat{\alpha}_2 = \hat{\alpha_1}$
- but standard errors will increase

=> imprecise 

**independent variable**

measurement error = big problems

- True model: $y = a + bx+e$
- our observation: $\tilde{x} = x+u$, with E(u) = 0
- then: $y = a + b(\tilde{x}-u)+e \to a+b\tilde{x} + (e-bu)$

Effect: Attenuation bias $\hat{\beta} < \beta$



## Remarks

Panel Data = potential solution to OVB

- unobservable fixed char of units => fixed effects
- effects that are unique, but constant over time => unit FE
- effects that are year specific, but over all states => time FE



Instrumental Variables

- estimate effect of x -> y (with endogeneity concern)
- IV: *z* that affects *y* only trough *x*







**The central question is always the same : why should the variation in x that I use be unrelated to the unobserved determinants of y ?**
