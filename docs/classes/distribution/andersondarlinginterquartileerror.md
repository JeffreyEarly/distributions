---
layout: default
title: andersonDarlingInterquartileError
parent: Distribution
grand_parent: Classes
nav_order: 2
mathjax: true
---

#  andersonDarlingInterquartileError

Compute an interquartile Anderson-Darling fit statistic.


---

## Declaration
```matlab
 totalError = andersonDarlingInterquartileError(self,epsilon)
```
## Parameters
+ `epsilon`  sample values to compare against the distribution

## Returns
+ `totalError`  interquartile Anderson-Darling discrepancy statistic

## Discussion

  This method forms the Anderson-Darling contribution sequence
  and retains only the middle half of the ordered sample before
  summing the error.


