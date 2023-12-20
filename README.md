# ARCH2021 AINNCS

This is the JuliaReach repeatability evaluation (RE) package for the ARCH-COMP
2021 category report: Artificial Intelligence and Neural Network Control Systems
(AINNCS) for Continuous and Hybrid Systems Plants of the 5th International
Competition on Verifying Continuous and Hybrid Systems (ARCH-COMP '21).

To cite the work, you can use:

```
@inproceedings{JohnsonLBFGSICWL21,
  author    = {Taylor T. Johnson and
               Diego Manzanas Lopez and
               Luis Benet and
               Marcelo Forets and
               Sebasti{\'{a}}n Guadalupe and
               Christian Schilling and
               Radoslav Ivanov and
               Taylor J. Carpenter and
               James Weimer and
               Insup Lee},
  editor    = {Goran Frehse and
               Matthias Althoff},
  title     = {{ARCH-COMP21} Category Report: Artificial Intelligence and Neural
               Network Control Systems {(AINNCS)} for Continuous and Hybrid Systems
               Plants},
  booktitle = {{ARCH}},
  series    = {EPiC Series in Computing},
  volume    = {80},
  pages     = {90--119},
  publisher = {EasyChair},
  year      = {2021},
  url       = {https://doi.org/10.29007/kfk9},
  doi       = {10.29007/kfk9}
}
```

## Installation

*Note:* Running the full benchmark suite should take no more than two hours with
a reasonable internet connection.

There are two ways to install and run this RE: either using the Julia script or
using the Docker script.
In both cases, first clone this repository:

```shell
$ git clone https://github.com/JuliaReach/ARCH2021_AINNCS.git
$ cd ARCH2021_AINNCS
```

**Using the Julia script.**
First install the Julia language following the instructions
[here](http://julialang.org/downloads).
Once you have installed Julia, execute

```shell
$ julia startup.jl
```

to run all the benchmarks.


**Using the Docker container.**
To build the container, you need the program `docker`.
For installation instructions on different platforms, consult
[the Docker documentation](https://docs.docker.com/install/).
For general information about `Docker`, see
[this guide](https://docs.docker.com/get-started/).
Once you have installed Docker, start the `measure_all` script:

```shell
$ ./measure_all
```

---

The Docker container can also be run interactively:

```shell
$ docker run -it juliareach bash

$ julia

julia> include("startup.jl")
```

## Outputs

After the benchmark runs have finished has finished, the results will be stored
in the folder `result`.

---

## How the Julia environment was created

```julia
julia> ]

(@v1.6) pkg> activate .
  Activating new environment at `.../ARCH2021_AINNCS/Project.toml`

pkg> add https://github.com/sisl/NeuralVerification.jl#09b5c9f
pkg> add https://github.com/JuliaReach/NeuralNetworkAnalysis.jl#b2f0255
pkg> add MAT
pkg> add DifferentialEquations
pkg> add Plots
pkg> add Symbolics@0.1.32
```
