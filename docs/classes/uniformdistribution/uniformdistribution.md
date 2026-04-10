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
 self = UniformDistribution(a=<value>,b=<value>)
```
## Parameters
+ `options.a`  lower endpoint of the interval, default `-0.5`
+ `options.b`  upper endpoint of the interval, default `0.5`

## Returns
+ `self`  UniformDistribution instance

## Discussion

  When called with no inputs, the constructor uses the default
  interval $$[-0.5,0.5].$$ If either endpoint is omitted, the
  remaining endpoint uses its default value.


