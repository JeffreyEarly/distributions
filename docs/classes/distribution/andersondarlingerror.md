---
layout: default
title: andersonDarlingError
parent: Distribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  andersonDarlingError

Compute the Anderson-Darling fit statistic for a sample.


---

## Declaration
```matlab
 totalError = andersonDarlingError(self,epsilon)
```
## Parameters
+ `epsilon`  sample values to compare against the distribution

## Returns
+ `totalError`  Anderson-Darling discrepancy statistic

## Discussion

  Given the sorted sample $$Y_i$$, this method evaluates the
  Anderson-Darling statistic formed from the theoretical CDF
  $$F$$ and the empirical order statistics.


