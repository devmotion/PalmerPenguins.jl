using PalmerPenguins
using CSV
using DataFrames
using Tables
using Test

# Always accept download in CI tests
ENV["DATADEPS_ALWAYS_ACCEPT"] = true

@testset "PalmerPenguins.jl" begin
    @testset "load" begin
        table = PalmerPenguins.load()
        
        # Check some properties
        @test table isa CSV.File
        @test length(table) == 344
        @test Tables.columnnames(Tables.columns(table)) == [
            :species,
            :island,
            :bill_length_mm,
            :bill_depth_mm,
            :flipper_length_mm,
            :body_mass_g,
            :sex,
        ]

        # Check first row
        firstrow = first(table)
        @test firstrow.species == "Adelie"
        @test firstrow.island == "Torgersen"
        @test firstrow.bill_length_mm == 39.1
        @test firstrow.bill_depth_mm == 18.7
        @test firstrow.flipper_length_mm == 181
        @test firstrow.body_mass_g == 3750
        @test firstrow.sex == "male"
    end

    @testset "DataFrames" begin
        df = DataFrame(PalmerPenguins.load())

        # Check some properties
        @test df isa DataFrame
        @test nrow(df) == 344
        @test names(df) == [
            "species",
            "island",
            "bill_length_mm",
            "bill_depth_mm",
            "flipper_length_mm",
            "body_mass_g",
            "sex",
        ]
        @test eltype(df[!, :species]) === String
        @test eltype(df[!, :island]) === String
        @test eltype(df[!, :bill_length_mm]) === Union{Missing,Float64}
        @test eltype(df[!, :bill_depth_mm]) === Union{Missing,Float64}
        @test eltype(df[!, :flipper_length_mm]) === Union{Missing,Int}
        @test eltype(df[!, :body_mass_g]) === Union{Missing,Int}
        @test eltype(df[!, :sex]) === Union{Missing,String}

        # Check first row
        firstrow = df[1, :]
        @test firstrow.species == "Adelie"
        @test firstrow.island == "Torgersen"
        @test firstrow.bill_length_mm == 39.1
        @test firstrow.bill_depth_mm == 18.7
        @test firstrow.flipper_length_mm == 181
        @test firstrow.body_mass_g == 3750
        @test firstrow.sex == "male"
    end
end
