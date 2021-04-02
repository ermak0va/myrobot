function my_copy(x::AbstractArray{Int64})
    a=zeros(Int64,length(x))
    fir=firstindex(x)
    las=lastindex(x)
    for i in fir:las
        a[i]=x[i]        
    end
    return a
end

function my_copy(x::AbstractArray{Int64,2})
    a=zeros(Int64,2,div(length(x),2))
    fir=firstindex(x)
    las=lastindex(x)
    for i in fir:las
        a[i]=x[i]        
    end
    return a
end