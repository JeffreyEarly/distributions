---
layout: default
title: kolmogorovSmirnovInterquartileError
parent: Distribution
grand_parent: Classes
nav_order: 10
mathjax: true
---

#  kolmogorovSmirnovInterquartileError

Compute an interquartile Kolmogorov-Smirnov fit statistic.


---

## Declaration
```matlab
 totalError = kolmogorovSmirnovInterquartileError(self,epsilon)
```
## Parameters
+ `epsilon`  sample values to compare against the distribution

## Returns
+ `totalError`  interquartile Kolmogorov-Smirnov discrepancy statistic

## Discussion

  This method evaluates the empirical-versus-theoretical CDF
  mismatch on the middle half of the sorted sample and returns
  the scaled interquartile KS discrepancy.


