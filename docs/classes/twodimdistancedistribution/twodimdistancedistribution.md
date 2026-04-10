---
layout: default
title: TwoDimDistanceDistribution
parent: TwoDimDistanceDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  TwoDimDistanceDistribution

Create a radial-distance distribution from a 1D input model.


---

## Declaration
```matlab
 self = TwoDimDistanceDistribution(distribution1d=<value>)
```
## Parameters
+ `options.distribution1d`  one-dimensional distribution for each coordinate

## Returns
+ `self`  TwoDimDistanceDistribution instance

## Discussion

  This constructor numerically builds the radial `pdf` and
  `cdf` implied by two independent draws from `distribution1d`.


