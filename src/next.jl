function next1(problem)
    return diterminedNums(problem)
end
function possibilityMask(problem, num)
    mask = [problem[i,j] == 0 for i=1:9, j=1:9]
    indices = findall(a->a==num, problem)
    for cIndex in indices
        beam!(mask, cIndex)
    end
    return mask
end
function beam!(mask, cIndex)
    i = cIndex[1]
    j = cIndex[2]
    btl_i = (div(i,3,RoundUp) - 1) * 3 + 1
    btl_j = (div(j,3,RoundUp) - 1) * 3 + 1
    # substitute
    mask[i,:] .= false
    mask[:,j] .= false
    mask[btl_i:btl_i+2, btl_j:btl_j+2] .= false
end
function diterminedNums(problem)
    scanAndPutNum = function (ditermined, pm, num)
        for i in 1:9
            if count(b->b==1, pm[i,:]) == 1
                indexJ = findfirst(b->b==1, pm[i,:])
                ditermined[i, indexJ] = num
            end
        end
        for j in 1:9
            if count(b->b==1, pm[:,j]) == 1
                indexI = findfirst(b->b==1, pm[:,j])
                ditermined[indexI, j] = num
            end
        end
        for bi = 1:3:7, bj = 1:3:7
            if count(b->b==1, pm[bi:bi+2,bj:bj+2]) == 1
                cIndex = findfirst(b->b==1, pm[bi:bi+2,bj:bj+2])
                ditermined[bi+cIndex[1]-1, bj+cIndex[2]-1] = num
            end
        end
    end
    ditermined = [0 for i=1:9, j=1:9]
    for num = 1:9
        pm = possibilityMask(problem, num)
        scanAndPutNum(ditermined, pm, num)
    end
    return ditermined
end
