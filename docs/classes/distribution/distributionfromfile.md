---
layout: default
title: distributionFromFile
parent: Distribution
grand_parent: Classes
nav_order: 6
mathjax: true
---

#  distributionFromFile

Initialize a persisted distribution from a NetCDF file.


---

## Declaration
```matlab
 distribution = distributionFromFile(path)
```
## Parameters
+ `path`  path to an existing NetCDF file

## Returns
+ `distribution`  reconstructed concrete Distribution instance

## Discussion

  Use this abstract-role factory when the concrete distribution
  subtype is only known from the persisted `AnnotatedClass`
  metadata in the file.


