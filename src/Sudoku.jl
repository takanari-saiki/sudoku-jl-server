module Sudoku

include(joinpath(@__DIR__, "solve.jl"));
include(joinpath(@__DIR__, "next.jl"));

module Problems
    include(joinpath(@__DIR__, "problems.jl"));
    # Sudoku.Problems.test()
    function test()
        print("test")
    end
    function get(i)
        # return copy of array
        return collect(problems[i])
    end
end
end # module Sudoku
