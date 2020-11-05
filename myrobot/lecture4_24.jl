
function find_big_rect(r)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    s_max=0
    c=false
    side=Ost
    while isborder(r,Nord)==false
        while move_if_possible!(r,side)==true
            if isborder(r,Nord)==true
                c=true
            end
            if isborder(r,Nord)==false
                if c==true
                    move!(r,Nord)
                    if isborder(r,inverseside(side))==true
                        s=find_plosh(r,inverseside(side))
                        if s>s_max
                            s_max=s
                        end
                    end
                    c=false
                    move!(r,Sud)
                end
            end
        end
        side=inverseside(side)
        move!(r,Nord)
    end
    return s_max
end

function find_plosh(r,xside)
    x=0
    y=0
    if xside==Ost || xside==West
        yside=Nord
    else
        yside=West
    end
    while isborder(r,xside)==true
        x=x+1
        move!(r,yside)
    end
    move!(r,xside)
    while isborder(r,inverseside(yside))==true
        y=y+1
        move!(r,xside)
    end
    k=y
    while k>0
        k=k-1
        move!(r,inverseside(xside))
    end
    move!(r,inverseside(xside))
    k=x
    while k>0
        k=k-1
        move!(r,inverseside(yside))
    end
    return x*y
end