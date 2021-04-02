function bubblesort!(A::AbstractArray{Int64,2})
    (strok,stolb)=size(A)
    for i in 1:stolb
        a=@view A[:,i]
        bubblesort!(a)
    end
    return A
end

