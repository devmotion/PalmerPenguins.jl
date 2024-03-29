# PalmerPenguins.jl <a href='https://allisonhorst.github.io/palmerpenguins'><img src='https://allisonhorst.github.io/palmerpenguins/reference/figures/logo.png' align="right" height="138.5" /></a>

[![Build Status](https://github.com/devmotion/PalmerPenguins.jl/workflows/CI/badge.svg?branch=main)](https://github.com/devmotion/PalmerPenguins.jl/actions?query=workflow%3ACI+branch%3Amain)
[![Coverage](https://codecov.io/gh/devmotion/PalmerPenguins.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/devmotion/PalmerPenguins.jl)
[![Coverage](https://coveralls.io/repos/github/devmotion/PalmerPenguins.jl/badge.svg?branch=main)](https://coveralls.io/github/devmotion/PalmerPenguins.jl?branch=main)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

Load the [Palmer penguins dataset](https://allisonhorst.github.io/palmerpenguins/), an alternative to the Iris dataset, in Julia.

## Overview

The [Palmer penguins dataset](https://allisonhorst.github.io/palmerpenguins/) by Allison Horst, Alison Hill, and Kristen Gorman is a dataset for data exploration & visualization, as an alternative to the Iris dataset.

The dataset contains data for 344 penguins.
There are 3 different species of penguins in this dataset, collected from 3 islands in the Palmer Archipelago, Antarctica.

Data were collected and made available by [Dr. Kristen Gorman](https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php) and the [Palmer Station, Antarctica LTER](https://pal.lternet.edu/), a member of the [Long Term Ecological Research Network](https://lternet.edu/).

Data are available by [CC-0](https://creativecommons.org/share-your-work/public-domain/cc0/) license in accordance with the [Palmer Station LTER Data Policy](http://pal.lternet.edu/data/policies) and the [LTER Data Access Policy for Type I data](https://lternet.edu/data-access-policy/).

More information about the dataset is available in [its official documentation](https://allisonhorst.github.io/palmerpenguins/).

## Usage

The simplified version of the raw data can be loaded by

```julia
julia> using PalmerPenguins

julia> table = PalmerPenguins.load()
```

This will download the data (both the simplified and the raw version) once using [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl), displaying the information above and making it available for future use.

The prompt and the confirmation before downloading the data for the first time can be bypassed by setting the [`DATADEPS_ALWAYS_ACCEPT` environment variable](https://www.oxinabox.net/DataDeps.jl/stable/z10-for-end-users/#Configuration-1).
In particular, this is required for [non-interactive use](https://github.com/devmotion/PalmerPenguins.jl/issues/9) such as in continuous integration tests.

The function `PalmerPenguins.load()` returns a [`CSV.File`](https://juliadata.github.io/CSV.jl/stable/#CSV.File) object that supports the [Tables.jl](https://github.com/JuliaData/Tables.jl) interface.
For instance, it can be converted to a [`DataFrame`](https://juliadata.github.io/DataFrames.jl/stable/man/getting_started/#The-DataFrame-Type-1) by executing

```julia
julia> using DataFrames

julia> df = DataFrame(table)
```
The raw data can be loaded with
```julia
julia> tableraw = PalmerPenguins.load(; raw = true)
```

If `raw = false` (the default), then the simplified version is returned.

## References

Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism and Environmental Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3): e90081. https://doi.org/10.1371/journal.pone.0090081
