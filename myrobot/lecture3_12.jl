function chess(r,n)
    x,y=go_conor(r)
    go_back(r,Nord)
    all=go_back(r,Sud)+1
    side=Nord
    t=0
    k=n
    kk=2n
    while isborder(r,Ost)==false
        if t>=k && t<kk
            for i in 1:n
                if isborder(r,side)==false
                    move!(r,side)
                end
            end
        end
        paint(r,side,n,all)
        move!(r,Ost)
        side=HorizonSide(mod(Int(side)+2,4))
        go_back(r,side)
        side=HorizonSide(mod(Int(side)+2,4))
        t=t+1
        if t>kk
            k=k+2n
            kk=kk+2n
        end
    end
    if t>=k && t<kk
        for i in 1:n
            if isborder(r,side)==false
                move!(r,side)
            end
        end
    end
    paint(r,side,n,all)
    go_conor(r)
    go_to(r,x,y)
    return all
end

function go_back(r,side)
    k=0
    while isborder(r,side)==false
        move!(r,side)
        k=k+1
    end
    return k
end

function go_to(r,x,y)
    for i in 1:x
        move!(r,Ost)
    end
    for j in 1:y
        move!(r,Nord)
    end
end
function go_conor(r)
    x=0
    y=0
    while isborder(r,West)==false
        move!(r,West)
        x=x+1
    end
    while isborder(r,Sud)==false
        move!(r,Sud)
        y=y+1
    end
    return (x,y)
end
function paint(r,side,n,all)
    k=0
    ii=0
    while isborder(r,side)==false
        ii=0
        for i in 1:n
            if isborder(r,side)==false
                putmarker!(r)
                move!(r,side)
                k=k+1
                ii=ii+1
            end
        end
        if isborder(r,side)==true && ii!=n
            putmarker!(r)
        end
        for j in 1:n
            if isborder(r,side)==false
                move!(r,side)
                k=k+1
            end
        end
    end
    mm=2n+1
    while all>=mm
        if all==mm
            move!(r,HorizonSide(mod(Int(side)+2,4)))
            if ismarker(r)==false
                move!(r,side)
                putmarker!(r)
            end
        end
        mm=mm+3n
    end

    return k
end