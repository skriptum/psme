# 17.11.2026 Time Series

Time Series data = same unit, multiple observations

Idea: forecast the series into the future

- no causal effects
- no OVB
- only external validity (must hold in near future)



other Notation

- 1st / j-th Lag: $Y_{t-1}, Y_{t-j}$
- First Difference: $\Delta Y_t = Y_t - Y_{t-1}$
- FD of Log: $\Delta \ln Y_t = ln(Y_t)- ln(Y_{t-1})$
- Perfectage change of T.S $\approx 100 \times \Delta \ln(Y_t)$ (from t-1 to t)





## Trends + Seasonality

- Linear trend: $Y_t = a_0+a_1 t+e_t$

- Exponential trend: $log(Y_t) = a_0+a_1 t+e_t$
- other forms possible

De-trending: regress each variable on t

- calculate a regression of Y ~ t
- Residuals: $y-\hat{y} = r$



Seasonality: periodicall returning trends

- solved by adding seasonal dummies to data
- regress on all dummies **+** omit intercept



both: requires stationarity

> **Stationarity**: distribution of data does not change over time (e.g the mean or variance etc)

- E($\epsilon_t$) = 0
- E($\epsilon_t^2) = Var(\epsilon_t) = \sigma^2$
- $Cov(e_t, e_{t+1}) = 0$

= white noise 



## Autoregression

>  **Autocorrelation**: Series depends on its own lagged values

Autogregression:

- regression model: current values on lagged values
- number of lags = order of the autoregression
- e.g First order model: AR(1): $Y_t = b_0 + b_1Y_{t-1}+u_t$



Forecast: $Y_{T+1|T}$

- out-of-sample = in the future
- different from predicted values! 

Forecast error: $Y_{T+1}- \hat{Y}_{T+1|T}$

- different from residuals 
- as value of Yt+1 is not used in estimation



Example: Inflation Rate 

- Estimation: $\Delta Inf_t = 0.017-0.238 \Delta Inf_{t-1}$
- 4th quarter: $\Delta Inf_{t-1} = Inf_{2004|IV}-Inf_{2004|III} = 3.5-1.6 = 1.9$
- Forecast for 1st quarter next year
  - based on 4th quarter: $\hat{\Delta}Inf_{2005:I|2004:IV}$
  - $= 0.017*0.238* [1.9] = -0.4$
- then: inflation rate (afterchange)
  -  $\hat{Inf}_{2005:I|2004:IV} = Inf_{2004:IV}+ \hat{\Delta} = 3.5-0.4 = 3.1$



How many lags to use?

- use F-test to check whether added help
- optimal p = information criterion



### with Additional Predictors



