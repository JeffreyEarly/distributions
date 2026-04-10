---
layout: default
title: varianceInRange
parent: Distribution
grand_parent: Classes
nav_order: 20
mathjax: true
---

#  varianceInRange

Compute the range-limited second moment of the distribution.


---

## Declaration
```matlab
 var = varianceInRange(self,zmin,zmax)
```
## Parameters
+ `zmin`  lower integration bound
+ `zmax`  upper integration bound

## Returns
+ `var`  range-limited second moment

## Discussion

  This method evaluates
  $$\int_{z_{\min}}^{z_{\max}} z^{2} p(z)\,\mathrm{d}z.$$ For
  centered distributions, that integral equals the variance
  contribution on the interval.


