---
layout: default
title: StudentTDistribution
parent: StudentTDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  StudentTDistribution

Create a Student's t-distribution from scale or variance.


---

## Declaration
```matlab
 self = StudentTDistribution(nu=<value>,sigma=<value>)
```
## Parameters
+ `options.nu`  positive degrees of freedom
+ `options.sigma`  optional positive scale parameter
+ `options.variance`  optional positive total variance for `nu > 2`

## Returns
+ `self`  StudentTDistribution instance

## Discussion

  Supply exactly one of `sigma` or `variance` together with the
  degrees of freedom `nu`. The `variance` parameterization is
  only valid for $$\nu > 2.$$


