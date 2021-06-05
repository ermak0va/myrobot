function eratosphen(n::Integer)
    array=fill(true,n)
    array[1]=false
    k=2
    while k < n 
        for i = 2k:k:length(array)
            array[i]=false
        end
        k=findnext(array, k+1)
        if isnothing(k)
            break
        end
    end
    return findall(array)
end