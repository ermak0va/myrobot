function my_reverse!(x::AbstractArray{Int64,1})
    len=length(x)

    fir=firstindex(x)
    las=lastindex(x)
    if len>1
        last=x[las]
        for i in 1:div(las,2)
            x[i],x[las-i+1]=x[las-i+1],x[i]
        end
    end
    return x
end

function my_reverse!(x::AbstractArray{Int64,2},dims=1)
    len=div(length(x),2)
    if dims==1
        for i in 1:len
            reverse!(@view x[:,i])
        end
    end
    if dims==2
        for i in 1:2
            reverse!(@view x[i,:])
        end
    end
    if dims!=1 && dims!=2
        error("wrong dims")
    end
    return x
end

