function srez(A::AbstractMatrix,I::AbstractVector{<:Integer},J::AbstractVector{<:Integer})
    mass_srez=Matrix{eltype(A)}(undef,length(I),length(J))
    for i in 1:length(I)
        for j in 1:length(J)
            mass_srez[i,j]=A[I[i],J[j]]
        end
    end
    return  mass_srez
end