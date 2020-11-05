function count_gor_vert_rect(r)
    n_gor=count_side(r,"g")
    n_vert=count_side(r,"v")
    n_rect=count_rect(r)
    return n_gor,n_vert,n_rect
end

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
                    move!(r,Nord)
                    if isborder(r,inverseside(side))==true
                        n=n+1
                    end
                    c=false
                    move!(r,Sud)
                end
            end
        end
        side=inverseside(side)
        move!(r,Nord)
    end
    return n
end
function count_side(r,text)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    n=0
    c=false
    if text=="g"
        side=Ost
        side_count=Nord
    end
    if text=="v"
        side=Nord
        side_count=Ost
    end
    while isborder(r,side_count)==false
        while move_if_possible!(r,side)==true
            if isborder(r,side_count)==true
                c=true
            end
            if isborder(r,side_count)==false
                if c==true
                    move!(r,side_count)
                    if isborder(r,inverseside(side))==false
                        n=n+1
                    end
                    c=false
                    move!(r,inverseside(side_count))
                end
            end
        end
        side=inverseside(side)
        move!(r,side_count)
    end
    return n
end