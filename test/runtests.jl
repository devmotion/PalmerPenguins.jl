using PalmerPenguins
using CSV
using DataFrames
using Tables

using Dates
using Test

# Always accept download in CI tests
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset "PalmerPenguins.jl" begin
    # column names
    colnames_simplified = [
        "species",
        "island",
        "bill_length_mm",
        "bill_depth_mm",
        "flipper_length_mm",
        "body_mass_g",
        "sex",
    ]
    coleltypes_simplified = [
        String,
        String,
        Union{Missing,Float64},
        Union{Missing,Float64},
        Union{Missing,Int},
        Union{Missing,Int},
        Union{Missing,String},
    ]
    firstrow_simplified = ["Adelie", "Torgersen", 39.1, 18.7, 181, 3750, "male"]

    colnames_raw = [
        "studyName",
        "Sample Number",
        "Species",
        "Region",
        "Island",
        "Stage",
        "Individual ID",
        "Clutch Completion",
        "Date Egg",
        "Culmen Length (mm)",
        "Culmen Depth (mm)",
        "Flipper Length (mm)",
        "Body Mass (g)",
        "Sex",
        "Delta 15 N (o/oo)",
        "Delta 13 C (o/oo)",
        "Comments",
    ]
    coleltypes_raw = [
        String,
        Int,
        String,
        String,
        String,
        String,
        Bool,
        Date,
        Union{Missing,Float64},
        Union{Missing,Float64},
        Union{Missing,Int},
        Union{Missing,Int},
        Union{Missing,String},
        Float64,
        Float64,
        String,
    ]
    firstrow_raw = [
        "PAL0708",
        1,
        "Adelie Penguin (Pygoscelis adeliae)",
        "Anvers",
        "Torgersen",
        "Adult, 1 Egg Stage",
        "N1A1",
        true,
        Date(2007, 11, 11),
        39.1,
        18.7,
        181,
        3750,
        "MALE",
        missing,
        missing,
        "Not enough blood for isotopes.",
    ]

    @testset "load" begin
        @testset "simplified" begin
            table = PalmerPenguins.load()
            table2 = PalmerPenguins.load(; raw=false)
            for i in 1:length(table)
                @test all(table[i] .=== table2[i])
            end

            # Check some properties
            @test table isa CSV.File
            @test length(table) == 344
            @test Tables.columnnames(Tables.columns(table)) == Symbol.(colnames_simplified)
            for (name, T) in zip(colnames_simplified, coleltypes_simplified)
                eltype(Tables.getcolumn(Tables.columns(table), Symbol(name))) === T
            end

            # Check first row
            firstrow = first(table)
            for i in 1:length(firstrow)
                @test isequal(firstrow[i], firstrow_simplified[i])
            end
        end

        @testset "raw" begin
            table = PalmerPenguins.load(; raw=true)

            # Check some properties
            @test table isa CSV.File
            @test length(table) == 344
            @test Tables.columnnames(Tables.columns(table)) == Symbol.(colnames_raw)
            for (name, T) in zip(colnames_raw, coleltypes_raw)
                eltype(Tables.getcolumn(Tables.columns(table), Symbol(name))) === T
            end

            # Check first row
            firstrow = first(table)
            for i in 1:length(firstrow)
                @test isequal(firstrow[i], firstrow_raw[i])
            end
        end
    end

    @testset "DataFrames" begin
        @testset "simplified" begin
            df = DataFrame(PalmerPenguins.load())
            df2 = DataFrame(PalmerPenguins.load(; raw=false))
            for i in 1:size(df, 2)
                @test all(df[!, i] .=== df2[!, i])
            end

            # Check some properties
            @test df isa DataFrame
            @test nrow(df) == 344
            @test names(df) == colnames_simplified
            for (name, T) in zip(colnames_simplified, coleltypes_simplified)
                eltype(df[!, name]) === T
            end

            # Check first row
            firstrow = df[1, :]
            for i in 1:length(firstrow)
                @test isequal(firstrow[i], firstrow_simplified[i])
            end
        end

        @testset "raw" begin
            df = DataFrame(PalmerPenguins.load(; raw=true))

            # Check some properties
            @test df isa DataFrame
            @test nrow(df) == 344
            @test names(df) == colnames_raw
            for (name, T) in zip(colnames_raw, coleltypes_raw)
                eltype(df[!, name]) === T
            end

            # Check first row
            firstrow = df[1, :]
            for i in 1:length(firstrow)
                @test isequal(firstrow[i], firstrow_raw[i])
            end
        end
    end
end
