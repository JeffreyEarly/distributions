---
layout: default
title: locationOfCDFPercentile
parent: Distribution
grand_parent: Classes
nav_order: 6
mathjax: true
---

#  locationOfCDFPercentile

Find the location of a CDF percentile.


---

## Declaration
```matlab
 z = locationOfCDFPercentile(self,alpha)
```
## Parameters
+ `alpha`  target percentile strictly between 0 and 1

## Returns
+ `z`  location where `cdf(z)` equals `alpha`

## Discussion

  This method returns $$z_{\alpha}$$ satisfying
  $$F(z_{\alpha}) = \alpha$$ for the current cumulative
  distribution $$F$$.


