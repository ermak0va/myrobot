function reverse_user!(a)
    size=length(a)
    size_h=div(size,2)
    for i in 1:size_h
        a[i],a[size+1-i]=a[size+1-i],a[i]
    end
    return a
end

function reverse_user!(a::Matrix; dim=1)
    s=size(a)
    if dim==1
        for i in 1:s[2]
            reverse_user!(@view a[:,i])
        end
    elseif dim==2
        for j in 1:s[1]
            reverse_user!(@view a[j,:])
        end
    else
        return ("dim in 1:2")
    end
    return a
end