---
layout: default
title: NormalDistribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 2
---

#  NormalDistribution

Model a zero-mean normal distribution with standard deviation $$\sigma$$.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef NormalDistribution < Distribution</code></pre></div></div>

## Overview

`NormalDistribution` implements the
[normal distribution](https://en.wikipedia.org/wiki/Normal_distribution)
with density
$$p(z) = \frac{1}{\sigma \sqrt{2\pi}}
\exp\!\left(-\frac{z^{2}}{2\sigma^{2}}\right),$$
cumulative distribution
$$F(z) = \frac{1}{2}\left(1 + \operatorname{erf}\!\left(\frac{z}{\sigma \sqrt{2}}\right)\right),$$
and variance $$\sigma^{2}.$$

```matlab
distribution = NormalDistribution(0.5);
samples = distribution.rand([1000 1]);
```




## Topics
+ Create distributions
  + [`NormalDistribution`](/distributions/classes/normaldistribution/normaldistribution.html) Create a normal distribution from its standard deviation.
+ Inspect distribution properties
  + [`sigma`](/distributions/classes/normaldistribution/sigma.html) Standard deviation $$\sigma$$.
+ Sample from distributions
  + [`rand`](/distributions/classes/normaldistribution/rand.html) Draw normally distributed random samples.


---