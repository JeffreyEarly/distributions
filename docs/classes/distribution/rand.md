---
layout: default
title: rand
parent: Distribution
grand_parent: Classes
nav_order: 10
mathjax: true
---

#  rand

Draw random samples from the distribution.


---

## Declaration
```matlab
 y = rand(self,varargin)
```
## Parameters
+ `varargin`  size vector or one nonnegative integer per output dimension

## Returns
+ `y`  random samples with the requested output shape

## Discussion

  `rand` draws samples by mapping uniform random numbers
  through a discretized approximation to the inverse CDF. Pass
  either one size vector or one nonnegative integer per output
  dimension.


