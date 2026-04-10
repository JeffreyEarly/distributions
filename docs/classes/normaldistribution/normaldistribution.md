---
layout: default
title: NormalDistribution
parent: NormalDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  NormalDistribution

Create a normal distribution from its standard deviation.


---

## Declaration
```matlab
 self = NormalDistribution(sigma=<value>)
```
## Parameters
+ `options.sigma`  positive standard deviation, default `1`

## Returns
+ `self`  NormalDistribution instance

## Discussion

  Use this constructor for a zero-mean Gaussian model with
  variance $$\sigma^{2}.$$ When called with no inputs, the
  constructor uses the default scale $$\sigma = 1.$$


