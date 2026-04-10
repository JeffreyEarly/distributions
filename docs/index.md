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
distribution = NormalDistribution();
z = distribution.rand([1000 1]);
distribution.rho = @(tau) exp(-(tau/10).^2);
signal = distribution.noise((0:500).');
```

Distribution subclasses provide `pdf`, `cdf`, total variance, distribution-fit metrics, and correlated-noise generation through `rho` and `noise`.

The package also ships runnable demos in the repository `Examples` folder and formal automated coverage in `UnitTests/DistributionsUnitTests.m`.

## NetCDF persistence

Annotated persistence lets you write a distribution to a NetCDF file and reconstruct it later from either the abstract `Distribution` role or the concrete class.

```matlab
distribution = StudentTDistribution(nu=4.5, sigma=1.0);
distribution.writeToFile("student-t.nc", shouldOverwriteExisting=true);

distributionBack = Distribution.distributionFromFile("student-t.nc");
```

## Start here

- [Installation](installation)
- [Class documentation](classes)
- [Version history](version-history)
