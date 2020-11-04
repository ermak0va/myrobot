function count_rect(r)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    n=0
    c=false
    side=Ost
    while isborder(r,Nord)==false
        while move_if_possible!(r,side)==true
            if isborder(r,Nord)==true
                c=true
            end
            if isborder(r,Nord)==false
                if c==true
                    c=false
                    n=n+1
                end
            end
        end
        side=inverseside(side)
        move!(r,Nord)
    end
    return n
end