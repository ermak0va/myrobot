function reverse!_(A::Vector{T})::Vector{T} where T
    for i in 1:div(length(A),2)
        A[i],A[length(A)-i+1]=A[length(A)-i+1],A[i]
    end
    return A
end