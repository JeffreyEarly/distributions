---
layout: default
title: UniformDistribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 5
---

#  UniformDistribution

Model a continuous uniform distribution on the interval $$[a,b]$$.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef UniformDistribution < Distribution</code></pre></div></div>

## Overview

`UniformDistribution` implements the
[continuous uniform distribution](https://en.wikipedia.org/wiki/Continuous_uniform_distribution)
with density
$$p(z) = \frac{1}{b-a}, \quad a \le z \le b,$$
cumulative distribution
$$F(z) = \frac{z-a}{b-a}, \quad a \le z \le b,$$
together with the usual piecewise extensions to $$0$$ below $$a$$
and $$1$$ above $$b$$. The total variance is
$$\mathrm{variance} = \frac{(b-a)^{2}}{12}.$$

```matlab
distribution = UniformDistribution(a=-0.5, b=0.5);
samples = distribution.rand([1000 1]);
```




## Topics
+ Create distributions
  + [`UniformDistribution`](/distributions/classes/uniformdistribution/uniformdistribution.html) Create a continuous uniform distribution on $$[a,b]$$.
+ Inspect distribution properties
  + [`a`](/distributions/classes/uniformdistribution/a.html) Lower endpoint $$a$$ of the support interval.
  + [`b`](/distributions/classes/uniformdistribution/b.html) Upper endpoint $$b$$ of the support interval.


---