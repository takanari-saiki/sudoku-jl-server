module Problems

problems = Dict(
    "1" => [
        8 0 0  0 0 0  2 0 1
        0 0 0  0 5 0  0 3 0
        0 0 0  2 0 4  0 0 8

        0 0 9  3 0 1  6 0 0
        0 4 0  0 0 0  0 8 0
        0 0 6  7 0 2  1 0 0

        5 0 0  1 0 6  0 0 0
        0 6 0  0 3 0  0 0 0
        2 0 4  0 0 0  0 0 5
    ],
    "2" => [
        0 0 0  0 0 1  2 0 0
        0 6 5  0 0 0  0 1 0
        0 9 3  0 0 0  4 0 6

        0 0 0  0 8 7  0 0 5
        0 0 0  5 0 6  0 0 0
        4 0 0  1 3 0  0 0 0

        3 0 9  0 0 0  1 2 0
        0 4 0  0 0 0  3 8 0
        0 0 2  7 0 0  0 0 0
    ],
)
function get(i)
    # return copy of array
    return collect(problems[i])
end
end
