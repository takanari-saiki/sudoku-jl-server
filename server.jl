# include this file in REPL to start web server
# reinclude this file to reflect changes

# routing https://genieframework.github.io/Genie.jl/dev/tutorials/12--Advanced_Routing_Techniques.html#Routing-methods-(GET,-POST,-PUT,-PATCH,-DELETE,-OPTIONS)
using Genie, Genie.Router, Genie.Requests

using Sudoku
using JSON

route("/hello") do
    "Hello - Welcome to Genie!"
end
route("/sudoku/:problem_id") do
    # Genie.Requests.payload
    str_pid = payload(:problem_id)
    if (!isa(tryparse(Int, str_pid), Int))
        return JSON.json("invalid index $(str_pid)")
    end
    pid = parse(Int, str_pid)
    if (!isassigned(Sudoku.Problems.problems, pid))
        return JSON.json("the index $(pid) is out of bounds")
    end
    problem = Sudoku.Problems.get(pid)
    Sudoku.solve(problem)
    JSON.json(Dict([
        "problem" => Sudoku.Problems.get(pid),
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
