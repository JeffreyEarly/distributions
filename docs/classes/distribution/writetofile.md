---
layout: default
title: writeToFile
parent: Distribution
grand_parent: Classes
nav_order: 22
mathjax: true
---

#  writeToFile

Write this distribution to a NetCDF file.


---

## Declaration
```matlab
 ncfile = writeToFile(self,path,properties,options)
```
## Parameters
+ `path`  path to the NetCDF file to create
+ `properties`  optional additional property names to persist
+ `options.shouldOverwriteExisting`  optional logical scalar that overwrites an existing file when true
+ `options.attributes`  optional global NetCDF attributes to add to the file

## Returns
+ `ncfile`  NetCDFFile handle for the written file

## Discussion

  `writeToFile` persists the canonical constructor state needed
  to reconstruct the concrete distribution subtype. When `rho`
  is nonempty, it is also serialized through the annotated
  function-handle path.


