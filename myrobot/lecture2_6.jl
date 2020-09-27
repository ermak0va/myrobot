function per(r::Robot)
    path=go_conor(r)
    i=0
    while isborder(r,West)==false
        move!(r,West)
        i=i+1
    end
    n=i
    m=West
    while n==i
        move!(r,Sud)
        n=0
        m=HorizonSide(mod(Int(m)+2,4))
        while isborder(r,m)==false
            move!(r,m)
            n=n+1
        end
    end
    while isborder(r,m)==true
        putmarker!(r)
        move!(r,Sud)
    end
    putmarker!(r)
    move!(r,m)
    while isborder(r,Nord)==true
        putmarker!(r)
        move!(r,m)
    end
    putmarker!(r)
    move!(r,Nord)
    m=HorizonSide(mod(Int(m)+2,4))
    while isborder(r,m)==true
        putmarker!(r)
        move!(r,Nord)
    end
    putmarker!(r)
    move!(r,m)
    while isborder(r,Sud)==true
        putmarker!(r)
        move!(r,m)
    end
    putmarker!(r)
    go_conor(r)
    come_back(r,path)
end

function come_back(r,path)
    n=length(path)
    while n>0
        move!(r,path[n])
        n=n-1
    end
end
function go_conor(r)
    going=[]
    while isborder(r,Nord)==false || isborder(r,Ost)==false
        if isborder(r,Nord)==false
            move!(r,Nord)
            push!(going,Sud)
        end
        if isborder(r,Ost)==false
            move!(r,Ost)
            push!(going,West)
        end
    end
    return going
end
