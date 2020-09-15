### version
- julia 1.5.1  

### setup
1. install julia
1. $ git clone https://github.com/takanari-saiki/sudoku-jl-server.git
1. $ cd sudoku-jl-server
1. $ julia
1. (in julia REPL) julia> ] (type "]" to activate package mode)
1. (@v1.5) pkg> activate .
1. (Sudoku) pkg> instantiate
1. (Sudoku) pkg> precompile
1. type "Back space" to end pakcage mode
1. julia> include("server.jl")

then server starts

### demo page
https://takanari-saiki.github.io/sudoku-jl-client/
