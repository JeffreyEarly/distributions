---
layout: default
title: Chi2Distribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 6
---

#  Chi2Distribution

Model a chi-squared distribution with $$k$$ degrees of freedom.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef Chi2Distribution < Distribution</code></pre></div></div>

## Overview

`Chi2Distribution` implements the
[chi-squared distribution](https://en.wikipedia.org/wiki/Chi-squared_distribution)
with density
$$p(z) = \frac{z^{k/2-1} e^{-z/2}}
{2^{k/2}\Gamma(k/2)}, \quad z \ge 0,$$
cumulative distribution
$$F(z) = P\!\left(\frac{k}{2},\frac{z}{2}\right),$$
where $$P$$ is the regularized lower incomplete gamma function, and
variance $$\mathrm{variance} = 2k.$$

```matlab
distribution = Chi2Distribution(k=4);
samples = distribution.rand([1000 1]);
```




## Topics
+ Create distributions
  + [`Chi2Distribution`](/distributions/classes/chi2distribution/chi2distribution.html) Create a chi-squared distribution from its degrees of freedom.
+ Inspect distribution properties
  + [`k`](/distributions/classes/chi2distribution/k.html) Degrees of freedom $$k$$.


---