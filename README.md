# PalmerPenguins.jl <a href='https://allisonhorst.github.io/palmerpenguins'><img src='man/figures/logo.png' align="right" height="138.5" /></a>

[![Build Status](https://github.com/devmotion/PalmerPenguins.jl/workflows/CI/badge.svg)](https://github.com/devmotion/PalmerPenguins.jl/actions)
[![Build Status](https://travis-ci.com/devmotion/PalmerPenguins.jl.svg?branch=master)](https://travis-ci.com/devmotion/PalmerPenguins.jl)
[![Coverage](https://codecov.io/gh/devmotion/PalmerPenguins.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/devmotion/PalmerPenguins.jl)
[![Coverage](https://coveralls.io/repos/github/devmotion/PalmerPenguins.jl/badge.svg?branch=master)](https://coveralls.io/github/devmotion/PalmerPenguins.jl?branch=master)

Load the [Palmer penguins dataset](https://allisonhorst.github.io/palmerpenguins/) in Julia.

## Overview

The [Palmer penguins dataset](https://allisonhorst.github.io/palmerpenguins/) by Allison
Horst, Alison Hill, and Kristen Gorman is a dataset for data exploration & visualization,
as an alternative to the Iris dataset.

The dataset contains data for 344 penguins. There are 3 different species of penguins in
this dataset, collected from 3 islands in the Palmer Archipelago, Antarctica.

Data were collected and made available by
[Dr. Kristen Gorman](https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php)
and the [Palmer Station, Antarctica LTER](https://pal.lternet.edu/), a member of the
[Long Term Ecological Research Network](https://lternet.edu/).

Data are available by
[CC-0](https://creativecommons.org/share-your-work/public-domain/cc0/) license in
accordance with the [Palmer Station LTER Data Policy](http://pal.lternet.edu/data/policies)
and the
[LTER Data Access Policy for Type I data](https://lternet.edu/data-access-policy/).

More information about the dataset is available in
[its official documentation](https://allisonhorst.github.io/palmerpenguins/).

## Usage

The dataset can be loaded by

```julia-repl
julia> using PalmerPenguins

julia> table = PalmerPenguins.load()
```

This will download the dataset once using [DataDeps.jl](https://github.com/oxinabox/DataDeps.jl),
displaying the information above and making it available for future use. The function
`PalmerPenguins.load()` returns a
[`CSV.File`](https://juliadata.github.io/CSV.jl/stable/#CSV.File) object that supports the
[Tables.jl](https://github.com/JuliaData/Tables.jl) interface. For instance, it can be
converted to a
[`DataFrame`](https://juliadata.github.io/DataFrames.jl/stable/man/getting_started/#The-DataFrame-Type-1)
by executing

```julia-repl
julia> using DataFrames

julia> df = DataFrame(table)
```

## Bibliography

Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism and Environmental
Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3):
e90081. https://doi.org/10.1371/journal.pone.0090081