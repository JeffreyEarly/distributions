---
layout: default
title: varianceInPercentileRange
parent: Distribution
grand_parent: Classes
nav_order: 14
mathjax: true
---

#  varianceInPercentileRange

Compute the second moment between two CDF percentiles.


---

## Declaration
```matlab
 var = varianceInPercentileRange(self,pctmin,pctmax)
```
## Parameters
+ `pctmin`  lower percentile strictly between 0 and 1
+ `pctmax`  upper percentile strictly between 0 and 1

## Returns
+ `var`  second moment between the requested percentiles

## Discussion

  This method first finds $$z_{\alpha_{\min}}$$ and
  $$z_{\alpha_{\max}}$$ from the inverse CDF and then evaluates
  `varianceInRange` between those locations.


