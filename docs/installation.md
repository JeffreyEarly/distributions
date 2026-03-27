---
layout: default
title: Installation
nav_order: 2
description: Installation instructions
permalink: /installation
---

# Installation

Install `Distributions` either through the OceanKit MPM repository or directly from the authoring repository.

## Runtime requirements

- MATLAB R2024b or newer
- no package dependencies

## Install from OceanKit

Clone the OceanKit repository:

```text
git clone https://github.com/JeffreyEarly/OceanKit.git
```

Then register it with MPM from within MATLAB:

```matlab
mpmAddRepository("OceanKit", "path/to/OceanKit")
mpminstall("Distributions")
```

## Install from the authoring repository

Clone the source repository:

```text
git clone https://github.com/JeffreyEarly/distributions.git
```

Then install it from MATLAB:

```matlab
mpminstall("local/path/to/distributions", Authoring=true)
```

## Development and documentation

If you want to rebuild the website documentation locally, install the `class-docs` tooling used by OceanKit package sites in addition to the runtime requirements.
