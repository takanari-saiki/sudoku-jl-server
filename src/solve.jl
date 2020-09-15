function existingNumList(problem, i, j)
    btl_i = (div(i,3,RoundUp) - 1) * 3 + 1
    btl_j = (div(j,3,RoundUp) - 1) * 3 + 1
    concatinated = [
        problem[i,:]
        problem[:,j]
        collect(Iterators.flatten(problem[btl_i:btl_i+2, btl_j:btl_j+2]))
    ]
#     [(j-1)*9+i for j=1:3 for i=1:3]
    return unique(concatinated[concatinated .> 0])
end
function possibleNumList(problem, i, j)
    if (problem[i,j] > 0)
        return Array{Int64}([])
    end
    return setdiff(collect(1:9), existingNumList(problem,i,j))
end
function possibleNumNums(problem, i, j)
    if (problem[i,j] > 0)
        return 10
    end
    return 9 - length(existingNumList(problem,i,j))
end
function solve(problem)
    if (minimum(problem) > 0)
        return true
    end
    pnn = [possibleNumNums(problem,i,j) for i=1:9, j=1:9]
    cIndex = findfirst(a->minimum(pnn)==a, pnn)
    pnl = possibleNumList(problem,cIndex[1],cIndex[2])
    for pn in pnl
        problem[cIndex] = pn
        if (solve(problem))
            return true
        end
    end
    problem[cIndex] = 0
    return false
end
