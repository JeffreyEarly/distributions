---
layout: default
title: noise
parent: Distribution
grand_parent: Classes
nav_order: 8
mathjax: true
---

#  noise

Draw a correlated noise process on a lag grid.


---

## Declaration
```matlab
 y = noise(self,t)
```
## Parameters
+ `t`  lag grid used to evaluate the autocorrelation model

## Returns
+ `y`  random process samples with the same shape as `t`

## Discussion

  When `rho` is empty, `noise` returns independent samples with
  the same shape as `t`. When `rho` is defined, it evaluates
  $$\rho(t)$$, forms the corresponding Toeplitz correlation
  model, and applies its Cholesky factor to the independent
  draws.


