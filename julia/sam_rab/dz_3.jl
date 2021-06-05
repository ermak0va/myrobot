function bubblesort!(a)
    size=length(a)
    for i in 1 : size-1
        for j in i : size
        if a[i]>a[j]
            a[i],a[j]=a[j],a[i]
        end
    end
end
return a
end

bubblesort(a)=bubblesort!(copy(a))

function bubblesortperm!(a)
    size=length(a)
    index=collect(1:size)
    for i in 1 : size-1
        for j in i : size
            if a[i]>a[j]
                a[i],a[j]=a[j],a[i]   
                index[i],index[j]= index[j],index[i]      
            end
        end
    end
    return index
end

bubblesortperm(a)= bubblesortperm!(copy(a))


