# deactivate plot GUI, which is not available in Docker
ENV["GKSwstype"] = "100"

# instantiate project
import Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

# create output folder and table
const TARGET_FOLDER = "result"
const RESULTS_FILE = "results.csv"

# function to run benchmarks
function main()
    if !isdir(TARGET_FOLDER)
        mkdir(TARGET_FOLDER)
    end
    global io = open(joinpath(TARGET_FOLDER, RESULTS_FILE), "w")
    println(io, "Tool, Model, Scenario, Result, Time [ns]\n")

    println("Running AINNCS benchmarks...")

    println("###\nRunning ACC benchmark\n###")
    include("models/ACC/ACC.jl")

    println("###\nRunning Sherlock-Benchmark-9-TORA benchmark\n###")
    include("models/Sherlock-Benchmark-9-TORA/Sherlock-Benchmark-9-TORA.jl")

    println("###\nRunning Sherlock-Benchmark-10-Unicycle benchmark\n###")
    include("models/Sherlock-Benchmark-10-Unicycle/Sherlock-Benchmark-10-Unicycle.jl")

    println("###\nRunning VertCAS benchmark\n###")
    include("models/VertCAS/VertCAS.jl")

    println("###\nRunning Single-Pendulum benchmark\n###")
    include("models/Single-Pendulum/Single-Pendulum.jl")

    println("###\nRunning Double-Pendulum benchmark\n###")
    include("models/Double-Pendulum/Double-Pendulum.jl")

    println("###\nRunning Airplane benchmark\n###")
    include("models/Airplane/Airplane.jl")

    print(io, "\n")
    println("Finished running benchmarks.")
    close(io)
    nothing
end

# run benchmarks
main()
