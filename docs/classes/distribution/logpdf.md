---
layout: default
title: logPDF
parent: Distribution
grand_parent: Classes
nav_order: 7
mathjax: true
---

#  logPDF

Logarithm of the probability density $$\log p(z)$$.


---

## Discussion

  `logPDF` can be evaluated directly in the tails without first
  forming `pdf(z)`, which is often more stable than computing
  `log(pdf(z))`.


