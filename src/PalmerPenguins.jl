module PalmerPenguins

using CSV: CSV
using DataDeps: DataDeps

const DEPNAME = "PalmerPenguins"
const LINK = "https://cdn.jsdelivr.net/gh/allisonhorst/palmerpenguins@433439c8b013eff3d36c847bb7a27fa0d7e353d8/inst/extdata/"
const DATA = ["penguins.csv", "penguins_raw.csv"]
const INFO = """
             Dataset: The Palmer penguins dataset
             Authors: Allison Horst, Alison Hill, Kristen Gorman
             Website: https://allisonhorst.github.io/palmerpenguins/index.html

             The Palmer penguins dataset is a dataset for data exploration & visualization, as an
             alternative to the Iris dataset.

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

             Please include this citation if you plan to use this database:
             [Gorman et al., 2014]
                 Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism and Environmental
                 Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3):
                 e90081. https://doi.org/10.1371/journal.pone.0090081
             """

"""
    load([; raw = false])

Load the Palmer penguins dataset.

If `raw` is `true`, then the raw data is returned. Otherwise the simplified version of
the data is loaded.

# References

[Gorman et al., 2014]
    Gorman KB, Williams TD, Fraser WR (2014) Ecological Sexual Dimorphism and Environmental
    Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3):
    e90081. https://doi.org/10.1371/journal.pone.0090081
"""
function load(; raw::Bool=false)
    file = DataDeps.@datadep_str DEPNAME * "/" * DATA[1 + Int(raw)]
    return CSV.File(
        file;
        missingstring="NA",
        truestrings=["Yes"],
        falsestrings=["No"],
        dateformat="y-m-d",
    )
end

function __init__()
    return DataDeps.register(
        DataDeps.DataDep(
            DEPNAME,
            INFO,
            LINK .* DATA,
            "839b058be09b164f7dfa0d030a959cb3c5426dea281e8a34d34c557e398bd01f",
        ),
    )
end

end
