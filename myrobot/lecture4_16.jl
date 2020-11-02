function mark_field(r)
    side_ort=Ost
    side_vert=Nord
    while isborder(r,side_ort)==false
        mark_row(r,side_vert)
        move!(r,side_ort)
        side_vert=inverseside(side_vert)
    end
    mark_row(r,side_vert)
end


function mark_row(r::Robot,side::HorizonSide)
    putmarker!(r)
    while move_if_possible!(r,side) == true
        putmarker!(r)
    end
end