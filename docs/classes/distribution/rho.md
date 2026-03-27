---
layout: default
title: rho
parent: Distribution
grand_parent: Classes
nav_order: 11
mathjax: true
---

#  rho

Autocorrelation function $$\rho(\tau)$$ used by `noise`.


---

## Discussion

  When nonempty, `rho` is evaluated on the lag grid passed to
  `noise`, and the resulting Toeplitz correlation model is used to
  correlate otherwise independent draws.


