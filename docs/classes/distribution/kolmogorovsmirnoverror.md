---
layout: default
title: kolmogorovSmirnovError
parent: Distribution
grand_parent: Classes
nav_order: 9
mathjax: true
---

#  kolmogorovSmirnovError

Compute the Kolmogorov-Smirnov fit statistic for a sample.


---

## Declaration
```matlab
 totalError = kolmogorovSmirnovError(self,epsilon,zmin,zmax)
```
## Parameters
+ `epsilon`  sample values to compare against the distribution
+ `zmin`  optional lower bound for a truncated comparison interval
+ `zmax`  optional upper bound for a truncated comparison interval

## Returns
+ `totalError`  Kolmogorov-Smirnov discrepancy statistic

## Discussion

  This method evaluates the scaled KS discrepancy
  $$\left(\sqrt{n} + 0.12 + \frac{0.11}{\sqrt{n}}\right) D_n,$$
  where $$D_n$$ is the maximum separation between the empirical
  CDF and the theoretical CDF. When `zmin` and `zmax` are
  supplied, the comparison is restricted to that interval and
  the theoretical CDF is renormalized there.


