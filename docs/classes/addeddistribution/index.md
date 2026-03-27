---
layout: default
title: AddedDistribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 7
---

#  AddedDistribution

Model a weighted mixture of component distributions.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef AddedDistribution < Distribution</code></pre></div></div>

## Overview

`AddedDistribution` implements a
[mixture distribution](https://en.wikipedia.org/wiki/Mixture_distribution)
by combining component densities $$p_i(z)$$ with nonnegative weights
$$\alpha_i$$ that sum to one. The resulting density and cumulative
distribution are
$$p(z) = \sum_{i=1}^{N} \alpha_i p_i(z),$$
$$F(z) = \sum_{i=1}^{N} \alpha_i F_i(z),$$
and the stored total variance is the weighted sum
$$\mathrm{variance} = \sum_{i=1}^{N} \alpha_i \,
\mathrm{variance}_i.$$ When `scalings` is supplied as a scalar, the
constructor interprets it as the first weight in a two-component
mixture and expands it to $$[\alpha, 1-\alpha].$$

```matlab
distribution = AddedDistribution([0.2 0.8], ...
    NormalDistribution(2.0), ...
    StudentTDistribution(nu=4.5, sigma=1.0));
```




## Topics
+ Compose distributions
  + [`AddedDistribution`](/distributions/classes/addeddistribution/addeddistribution.html) Create a weighted mixture from two or more distributions.
  + [`distributions`](/distributions/classes/addeddistribution/distributions.html) Component distributions used in the mixture model.
  + [`scalings`](/distributions/classes/addeddistribution/scalings.html) Mixture weights $$\alpha_i$$ for the component distributions.


---