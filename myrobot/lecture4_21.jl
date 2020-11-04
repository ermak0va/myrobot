function count_gor_vert(r)
    n_gor=count_side(r,Nord)
    n_vert=count_side(r,Ost)
    return n_gor,n_vert
end


function count_side(r,side_count)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    n=0
    c=false
    side=inverseside(nextside(side_count))
    while isborder(r,side_count)==false
        while move_if_possible!(r,side)==true
            if isborder(r,side_count)==true
                c=true
            end
            if isborder(r,side_count)==false
                if c==true
                    c=false
                    n=n+1
                end
            end
        end
        side=inverseside(side)
        move!(r,side_count)
    end
    return n
end