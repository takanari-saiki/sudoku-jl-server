module Sudoku

include(joinpath(@__DIR__, "solve.jl"));
include(joinpath(@__DIR__, "next.jl"));

include(joinpath(@__DIR__, "Problems.jl"));
end # module Sudoku
