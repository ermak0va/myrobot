function findallmax(f::Function, A)
    imax=1
    fmax=f(A[1])
    count=0
    for i in eachindex(A)
        if f(A[i]) > f(A[imax]) 
            imax = i
            fmax=f(A[i])
        end
    end

    for j in eachindex(A)
        if f(A[j]) == fmax
            count+=1
        end
    end
    
    arr=collect(1:count)
    c=1
    for k in eachindex(A)
        if f(A[k]) == fmax
            arr[c]=k
            c+=1
        end
    end
    return arr
end

