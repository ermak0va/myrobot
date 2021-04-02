function bubblesort!(x::AbstractArray{Int64,1})
    size=length(x)
    fir=firstindex(x)
    las=lastindex(x)
    for i in fir:las
        for j in i:las
            if x[i]>x[j]
                x[i],x[j]=x[j],x[i]
            end
        end
    end
end

function bubblesort(x::AbstractArray{Int64,1})
    sort_puz!(copy(x))
end#x not changed

function bubblesortperm!(x::AbstractArray{Int64,1})
    size=length(x)
    fir=firstindex(x)
    las=lastindex(x)
    k=collect(1:size)
    for i in fir:las
        for j in i:las
            if x[i]>x[j]
                x[i],x[j]=x[j],x[i]
                k[i],k[j]=k[j],k[i]
            end
        end
    end
    return k
end

function bubblesortperm(x::AbstractArray{Int64,1})
    bubblesortperm!(copy(x))
end