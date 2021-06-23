function convert!(A)
    for k in firstindex(A,1):lastindex(A,1)
        imax = argmax1(abs,@view A[k:end,k])+k-1
        colon_to_zeros!(A,k,imax)
    end
end

function colon_to_zeros!(A,k,imax)
    if imax != k
        A[k,:], A[imax,:] = A[imax,:], A[k,:] 
    end
    for i in k+1:lastindex(A,1)
        if isapproxzero(A[i,k]) 
            continue
        end
        t=-A[i,k]/A[k,k]
        A[i,k:end] += t*(@view A[k,k:end])  
    end
end

function argmax1(f::Function, a::AbstractVector)
    imax = firstindex(a)
    for i in firstindex(a)+1:lastindex(a)
        if f(a[i])>f(a[imax])
            imax = i
        end
    end
    return imax
end

function isapproxzero(a)
    isapprox(a,0.0; atol=1e-8)
end