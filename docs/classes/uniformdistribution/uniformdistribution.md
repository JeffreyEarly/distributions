---
layout: default
title: UniformDistribution
parent: UniformDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  UniformDistribution

Create a continuous uniform distribution on $$[a,b]$$.


---

## Declaration
```matlab
 self = UniformDistribution(a,b)
```
## Parameters
+ `a`  lower endpoint of the interval
+ `b`  upper endpoint of the interval

## Returns
+ `self`  UniformDistribution instance

## Discussion

  When called with no inputs, the constructor uses the default
  interval $$[-0.5,0.5].$$ Supplying one endpoint alone is not
  supported because the interval must be defined completely.


