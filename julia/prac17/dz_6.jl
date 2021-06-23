ConnectList{T}=Vector{Vector{T}}

#1 способ
function weakly_connected(graph::ConnectList)
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
    return all_achievable(1,neograph)
end

#2 способ
function weakly_connected_dfs(graph::ConnectList)
    mark = zeros(Bool,length(graph))
    stack  = [1]
    mark[1] = 1 
    while !isempty(stack)
        v = pop!(stack)
        for i in 1:length(graph)
            for j in graph[i]
                if j==v
                    push!(graph[v],i)
                end
            end
        end
        for u in graph[v]
            if mark[u] == 0
                push!(stack,u)
                mark[u] = 1
            end
        end
    end
    return count(m->m==0, mark) == 0
end