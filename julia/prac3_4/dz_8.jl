function allunique_(A::Vector{T})::Vector{T} where T
    for i in 1:length(A)
        for j in 1:length(A)
            if (A[i]==A[j])
                return false
            end
        end
    end
    return true
end

function unique_(A::Vector{T})::Vector{T} where T
    n=length(A)
    a=sort!(copy(A))
    i=1
    while i<=n
        if length(findall(isequal(a[i]),a))!=1
            deleteat!(a,i)
            n=n-1
            i=i-1
        end
        i=i+1
    end
    return a
end
