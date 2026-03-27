---
layout: default
title: StudentTDistribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 3
---

#  StudentTDistribution

Model a zero-mean Student's t-distribution with scale $$\sigma$$ and degrees of freedom $$\nu$$.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef StudentTDistribution < Distribution</code></pre></div></div>

## Overview

`StudentTDistribution` implements the
[Student's t-distribution](https://en.wikipedia.org/wiki/Student%27s_t-distribution)
with density
$$p(z) = \frac{\Gamma\!\left(\frac{\nu+1}{2}\right)}
{\sqrt{\pi \nu}\,\sigma\,\Gamma\!\left(\frac{\nu}{2}\right)}
\left(1 + \frac{z^{2}}{\nu \sigma^{2}}\right)^{-\frac{\nu+1}{2}},$$
cumulative distribution $$F(z)$$ given by the corresponding
Student-t CDF, and variance
$$\mathrm{variance} = \frac{\nu \sigma^{2}}{\nu-2}$$ for
$$\nu > 2.$$ The constructor accepts either the scale parameter
`sigma` or the total variance, but not both.

```matlab
distribution = StudentTDistribution(nu=4.5, sigma=8.5);
```




## Topics
+ Create distributions
  + [`StudentTDistribution`](/distributions/classes/studenttdistribution/studenttdistribution.html) Create a Student's t-distribution from scale or variance.
+ Inspect distribution properties
  + [`nu`](/distributions/classes/studenttdistribution/nu.html) Degrees of freedom $$\nu$$.
  + [`sigma`](/distributions/classes/studenttdistribution/sigma.html) Scale parameter $$\sigma$$.


---