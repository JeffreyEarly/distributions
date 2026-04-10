---
layout: default
title: RayleighDistribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 4
---

#  RayleighDistribution

Model a Rayleigh distribution with scale $$\sigma$$.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef RayleighDistribution < Distribution</code></pre></div></div>

## Overview

`RayleighDistribution` implements the
[Rayleigh distribution](https://en.wikipedia.org/wiki/Rayleigh_distribution)
with density
$$p(z) = \frac{z}{\sigma^{2}}
\exp\!\left(-\frac{z^{2}}{2\sigma^{2}}\right), \quad z \ge 0,$$
cumulative distribution
$$F(z) = 1 - \exp\!\left(-\frac{z^{2}}{2\sigma^{2}}\right), \quad z \ge 0,$$
and variance
$$\mathrm{variance} = \frac{4-\pi}{2}\sigma^{2}.$$ This family is
the radial-distance law obtained from two independent zero-mean
Gaussian coordinates with common standard deviation $$\sigma.$$

```matlab
distribution = RayleighDistribution(sigma=1.0);
samples = distribution.rand([1000 1]);
```




## Topics
+ Create distributions
  + [`RayleighDistribution`](/distributions/classes/rayleighdistribution/rayleighdistribution.html) Create a Rayleigh distribution from its scale parameter.
+ Inspect distribution properties
  + [`sigma`](/distributions/classes/rayleighdistribution/sigma.html) Scale parameter $$\sigma$$.


---