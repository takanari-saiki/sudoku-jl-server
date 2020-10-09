# include this file in REPL to start web server
# reinclude this file to reflect changes

# aws server
# $ nohup julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); Pkg.precompile(); include(\"server.jl\")" &

# routing https://genieframework.github.io/Genie.jl/dev/tutorials/12--Advanced_Routing_Techniques.html#Routing-methods-(GET,-POST,-PUT,-PATCH,-DELETE,-OPTIONS)
using Genie, Genie.Router, Genie.Requests

using Sudoku
using JSON

route("/hello") do
    "Hello - Welcome to Genie!"
end
route("/sudoku/:problem_code") do
    # Genie.Requests.payload
    pCode = payload(:problem_code)
    if ( !(pCode in keys(Sudoku.Problems.problems)) )
        return JSON.json("the index $(pCode) is not in problemList")
    end
    problem = Sudoku.Problems.get(pCode)
    Sudoku.solve(problem)
    JSON.json(Dict([
        "problem" => Sudoku.Problems.get(pCode),
        "solution" => problem
    ]))
end
route("/solve") do
    problem = JSON.parse(@params(:problem))
    convedProblem = [problem[j][i] for i=1:9,j=1:9]
    # problem = Array{Array{Int}}(problem)
    Sudoku.solve(convedProblem)
    JSON.json(Dict([
        "problem" => problem,
        "solution" => convedProblem
    ]))
end
route("/next1") do
    problem = JSON.parse(@params(:problem))
    convedProblem = [problem[j][i] for i=1:9,j=1:9]
    JSON.json(Dict([
        "problem" => problem,
        "next1" => Sudoku.next1(convedProblem)
    ]))
end
up()
