---
layout: default
title: cdf
parent: Distribution
grand_parent: Classes
nav_order: 3
mathjax: true
---

#  cdf

Cumulative distribution function $$F(z)$$.


---

## Discussion

  `cdf` stores a function handle that evaluates
  $$F(z) = \int_{-\infty}^{z} p(\zeta)\,\mathrm{d}\zeta$$ at one or
  more query locations.


