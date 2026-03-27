---
layout: default
title: rand
parent: NormalDistribution
grand_parent: Classes
nav_order: 2
mathjax: true
---

#  rand

Draw normally distributed random samples.


---

## Declaration
```matlab
 y = rand(self,sz)
```
## Parameters
+ `sz`  size vector of nonnegative integers

## Returns
+ `y`  array of Gaussian random samples

## Discussion

  This override uses MATLAB's `randn` directly and expects one
  size vector `sz` describing the requested output shape.


