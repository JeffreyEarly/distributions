---
layout: default
title: w
parent: Distribution
grand_parent: Classes
nav_order: 21
mathjax: true
---

#  w

Weight function $$w(z)$$ for residual-based reweighting.


---

## Discussion

  Robust-fitting code uses `w` as a residual-dependent variance
  proxy. When defined from the density, a common form is
  $$w(z) = -\frac{p(z)}{(\partial_z p(z))/z}.$$


