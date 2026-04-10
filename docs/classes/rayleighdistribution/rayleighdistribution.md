---
layout: default
title: RayleighDistribution
parent: RayleighDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  RayleighDistribution

Create a Rayleigh distribution from its scale parameter.


---

## Declaration
```matlab
 self = RayleighDistribution(sigma=<value>)
```
## Parameters
+ `options.sigma`  positive scale parameter, default `1`

## Returns
+ `self`  RayleighDistribution instance

## Discussion

  Use this constructor for nonnegative radial data whose
  density follows the Rayleigh family. When called with no
  inputs, the constructor uses the default scale $$\sigma = 1.$$


