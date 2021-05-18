function slice(A::Vector{T},p::Vector{Int})::Vector{T} where T
    B=Vector{T}(undef,size(A))
    B=A[p]
    return B
end