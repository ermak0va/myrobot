function chess(r)
    m=Nord
    i=0
    c=1
    while isborder(r,West)==false
        i=i+1
        m=HorizonSide(mod(Int(m)+2,4))
        num=paint(r,m)
        move!(r,West)
        if (c==1) && isodd(num)
            i=0
            c=0
        end
        if isodd(i)
            if isborder(r,Sud)
                move!(r,Nord)
            end
            if isborder(r,Nord)
                move!(r,Sud)
            end
        end
    end
    while isborder(r,Ost)==false
        i=i+1
        m=HorizonSide(mod(Int(m)+2,4))
        num=paint(r,m)
        move!(r,Ost)
        if (c==1) && isodd(num)
            i=0
            c=0
        end
        if isodd(i)
            if isborder(r,Sud)
                move!(r,Nord)
            end
            if isborder(r,Nord)
                move!(r,Sud)
            end
        end
        
    end
    m=HorizonSide(mod(Int(m)+2,4))
    paint(r,m)
end

function paint(r,side)
    k=0
    while isborder(r,side)==false
        putmarker!(r)
        move!(r,side)
        k=k+1
        if isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
            k=k+1
        end
    end
    return(k)
end




