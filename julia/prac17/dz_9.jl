ConnectList{T}=Vector{Vector{T}}

function is_bipartite(graph::ConnectList{T}) where T
    n = length(graph)
    C=Array{Bool,2}(undef,n,n)
    for i in 1:n
        for j in graph[i]
            C[i,j] = 1
            C[j,i] = 1
        end
    end
    neograph = Array{Int64,1}[]
    for i in 1:n 
        push!(neograph,Int64[])
        for j in 1:n
            if C[i,j]
                push!(neograph[i],j)
            end
        end
    end
    return attempt_divide!(1,neograph)
end

function attempt_divide!(startver::T, graph::ConnectList{T}) where T
    mark = zeros(Int16,length(graph))
    queue = [startver]
    mark[startver] = 1 
    while !isempty(queue)
        v = popfirst!(queue)
        for u in graph[v]
            next_num = (mark[v] % 2) + 1
            if mark[u] == 0    
                push!(queue, u)
                mark[u] = next_num
            elseif mark[u] == next_num
                return false
            end
        end
    end
    return true
end