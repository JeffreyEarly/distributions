---
layout: default
title: Distribution
has_children: false
has_toc: false
mathjax: true
parent: Class documentation
nav_order: 1
---

#  Distribution

Represent a univariate probability distribution and related noise model.


---

## Declaration

<div class="language-matlab highlighter-rouge"><div class="highlight"><pre class="highlight"><code>classdef (Abstract) Distribution</code></pre></div></div>

## Overview

`Distribution` is the abstract base class for a univariate
[probability distribution](https://en.wikipedia.org/wiki/Probability_distribution)
with density $$p(z)$$ and cumulative distribution
$$F(z) = \int_{-\infty}^{z} p(\zeta)\,\mathrm{d}\zeta.$$ Subclasses
provide those distribution functions, and this base class adds
percentile inversion, range-limited second-moment integrals, random
sampling, correlated-noise generation, and goodness-of-fit
diagnostics.

The method `locationOfCDFPercentile` returns $$z_{\alpha}$$ satisfying
$$F(z_{\alpha}) = \alpha.$$ The method `varianceInRange` evaluates
$$\int_{z_{\min}}^{z_{\max}} z^{2} p(z)\,\mathrm{d}z,$$ which
coincides with the variance contribution on that interval for
centered distributions. The Anderson-Darling and Kolmogorov-Smirnov
methods compare the empirical distribution of a sample against the
theoretical CDF $$F(z)$$ through standard AD and KS statistics.




## Topics
+ Inspect distribution properties
  + [`cdf`](/distributions/classes/distribution/cdf.html) Cumulative distribution function $$F(z)$$.
  + [`distributionFromFile`](/distributions/classes/distribution/distributionfromfile.html) Initialize a persisted distribution from a NetCDF file.
  + [`distributionFromGroup`](/distributions/classes/distribution/distributionfromgroup.html) Initialize a persisted distribution from a NetCDF group.
  + [`locationOfCDFPercentile`](/distributions/classes/distribution/locationofcdfpercentile.html) Find the location of a CDF percentile.
  + [`logPDF`](/distributions/classes/distribution/logpdf.html) Logarithm of the probability density $$\log p(z)$$.
  + [`pdf`](/distributions/classes/distribution/pdf.html) Probability density function $$p(z)$$.
  + [`sigma0`](/distributions/classes/distribution/sigma0.html) Initialization scale $$\sigma_0$$ satisfying $$w(\sigma_0) = \sigma_0^2$$.
  + [`variance`](/distributions/classes/distribution/variance.html) Total variance.
  + [`varianceInPercentileRange`](/distributions/classes/distribution/varianceinpercentilerange.html) Compute the second moment between two CDF percentiles.
  + [`varianceInRange`](/distributions/classes/distribution/varianceinrange.html) Compute the range-limited second moment of the distribution.
  + [`w`](/distributions/classes/distribution/w.html) Weight function $$w(z)$$ for residual-based reweighting.
  + [`writeToFile`](/distributions/classes/distribution/writetofile.html) Write this distribution to a NetCDF file.
  + [`zrange`](/distributions/classes/distribution/zrange.html) Support interval $$[z_{\min}, z_{\max}]$$ for the distribution.
+ Sample from distributions
  + [`rand`](/distributions/classes/distribution/rand.html) Draw random samples from the distribution.
+ Evaluate distribution fit
  + [`andersonDarlingError`](/distributions/classes/distribution/andersondarlingerror.html) Compute the Anderson-Darling fit statistic for a sample.
  + [`andersonDarlingInterquartileError`](/distributions/classes/distribution/andersondarlinginterquartileerror.html) Compute an interquartile Anderson-Darling fit statistic.
  + [`kolmogorovSmirnovError`](/distributions/classes/distribution/kolmogorovsmirnoverror.html) Compute the Kolmogorov-Smirnov fit statistic for a sample.
  + [`kolmogorovSmirnovInterquartileError`](/distributions/classes/distribution/kolmogorovsmirnovinterquartileerror.html) Compute an interquartile Kolmogorov-Smirnov fit statistic.
+ Model correlated noise
  + [`noise`](/distributions/classes/distribution/noise.html) Draw a correlated noise process on a lag grid.
  + [`rho`](/distributions/classes/distribution/rho.html) Autocorrelation function $$\rho(\tau)$$ used by `noise`.
+ Developer
  + [`classDefinedPropertyAnnotations`](/distributions/classes/distribution/classdefinedpropertyannotations.html) return array of WVPropertyAnnotation initialized by default
+ Other
  + [`classRequiredPropertyNames`](/distributions/classes/distribution/classrequiredpropertynames.html)
  + [`isequal`](/distributions/classes/distribution/isequal.html)


---