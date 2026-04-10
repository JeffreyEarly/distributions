---
layout: default
title: distributionFromGroup
parent: Distribution
grand_parent: Classes
nav_order: 7
mathjax: true
---

#  distributionFromGroup

Initialize a persisted distribution from a NetCDF group.


---

## Declaration
```matlab
 distribution = distributionFromGroup(group)
```
## Parameters
+ `group`  NetCDF group containing a persisted distribution

## Returns
+ `distribution`  reconstructed concrete Distribution instance

## Discussion

  `distributionFromGroup` reconstructs the concrete subtype
  stored in the group's `AnnotatedClass` metadata through the
  shared annotated-class read path.


