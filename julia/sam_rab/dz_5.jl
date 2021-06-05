function sort_key!(key_values,x)
    ind=sortperm!(key_values)
    return x[ind]
end

function sortperm!(key)
    size=length(key)
    index=collect(1:size)
    for i in 1 : size-1
        for j in i : size
            if key[i]>key[j]
                key[i],key[j]=key[j],key[i]   
                index[i],index[j]= index[j],index[i]      
            end
        end
    end
    return index  
end

sort_key!(f::Function,x)=sort_key!(f.(x),x)

sort_summ(x)=hcat(sort_key!(sum(x,dims=1),[@view x[:,j] for j in 1:size(x,2)])...)


function sort_zero(x)
    a = [@view x[:,j] for j in 1:size(x,2)]
    keyvalues = [length(findall(x[:,j] .== 0)) for j in 1:size(x,2)]
    B = hcat(sort_key!(keyvalues, a)...)
    return B
end
  

