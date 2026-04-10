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
 self = AddedDistribution(scalings=<value>,distributions=<value>)
```
## Parameters
+ `options.scalings`  mixture weights that sum to one
+ `options.distributions`  component distributions in mixture order

## Returns
+ `self`  AddedDistribution instance

## Discussion

  Supply either one scalar weight for a two-component mixture
  or one weight per component. The `distributions` input lists
  the component distributions in mixture order.


