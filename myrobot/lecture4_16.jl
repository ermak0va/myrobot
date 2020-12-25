function mark_field(r)
    x=0
    y=0
    y_all=0
    while move_if_possible!(r,Sud)==true
        y=y+1
    end
    while move_if_possible!(r,West)==true
        x=x+1
    end
    side_ort=Ost
    side_vert=Nord
    while isborder(r,side_ort)==false
        mark_row(r,side_vert)
        move!(r,side_ort)
        y_all=y_all+1
        side_vert=inverseside(side_vert)
    end
    mark_row(r,side_vert)
    if side_vert==Ost
        while move_if_possible!(r,West)==true
        end
    end
    while x>0
        x=x-1
        move_if_possible!(r,Ost)
    end
    y=y_all-y
    while y>0
        y=y-1
        move_if_possible!(r,Sud)
    end
end


function mark_row(r::Robot,side::HorizonSide)
    putmarker!(r)
    while move_if_possible!(r,side) == true
        putmarker!(r)
    end
end
