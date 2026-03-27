---
layout: default
title: Home
nav_order: 1
description: "Classes for modeling distributions and stochastic processes"
permalink: /
---

# Distributions

`Distributions` provides MATLAB classes for modeling probability distributions and stochastic processes.

These classes are core to the robust fitting techniques in [Spline Core](https://jeffreyearly.github.io/spline-core/).

## Quick start

The abstract `Distribution` class is used through concrete subclasses such as `NormalDistribution`.

```matlab
distribution = NormalDistribution(1);
z = distribution.rand([1000 1]);
distribution.rho = @(tau) exp(-(tau/10).^2);
signal = distribution.noise((0:500).');
```

Distribution subclasses provide `pdf`, `cdf`, total variance, distribution-fit metrics, and correlated-noise generation through `rho` and `noise`.

## Start here

- [Installation](installation)
- [Class documentation](classes)
- [Version history](version-history)
