---
layout: default
title: AddedDistribution
parent: AddedDistribution
grand_parent: Classes
nav_order: 1
mathjax: true
---

#  AddedDistribution

Create a weighted mixture from two or more distributions.


---

## Declaration
```matlab
 self = AddedDistribution(scalings,distribution1,distribution2,varargin)
```
## Parameters
+ `scalings`  mixture weights that sum to one
+ `distribution1`  first component distribution
+ `distribution2`  second component distribution
+ `varargin`  additional component distributions

## Returns
+ `self`  AddedDistribution instance

## Discussion

  Supply either one scalar weight for a two-component mixture
  or one weight per component. The remaining positional inputs
  are the component distributions in mixture order.


