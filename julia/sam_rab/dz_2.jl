function copy_user(a)
    size=length(a)
    b=similar(a)
    for i in 1:size
        b[i]=a[i]
    end
    return b
end
