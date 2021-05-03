function sortind!(A::Vector{Int64}, indperm::Vector{Int64})
    n=length(A)
    for _ in 1:n
        for i in 1:n
            A[i],A[indperm[i]]=A[indperm[i]],A[i]
            indperm[indperm[i]],indperm[i]=indperm[i],indperm[indperm[i]]
        end
    end
    return A
end