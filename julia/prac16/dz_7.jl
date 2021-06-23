function dijkstra(G::AbstractMatrix,s::Integer)
    n = size(G,1)
    d = Int64[]
    used = Bool[]
    for i in 1:n
        push!(d,G[s,i])
        push!(used,false)
    end
    d[s] = 0
    ind = 0
    cur = 0
    for _ in 1:n
        min = 1e8
        for j in 1:n
            if !used[j] && d[j]<min
                min = d[j]
                ind = j
            end
        end
        cur = ind
        used[cur] = true
        for j in 1:n
            if !used[j] && G[cur,j]!=1e8 && d[cur]!= 1e8 && d[cur]+G[cur,j]<d[j]
                d[j] = d[cur] + G[cur,j]
            end
        end
    end
    return d
end