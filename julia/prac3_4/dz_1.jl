function find_all_max(a)
    ind_max=Vector{Int}(undef,size(a))
    imd_max[begin]=firstindex(a)
    n = firstindex(ind_max)
    for i in firstindex(a)+1:lastindex(a)
        if A[i]>A[ind_max[end]]
            ind_max[begin]=i
            n = firstindex(ind_max)
        elseif A[i]==A[ind_max[end]]
            n+=1
            ind_max[n]=i
        end
    end
    return resize!(ind_max,n)
end