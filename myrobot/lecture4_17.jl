function mark_field_special(r)
    while isborder(r,Sud)==false || isborder(r,West)==false
            move_if_possible!(r,Sud)
            move_if_possible!(r,West)
    end
    all=get_num_movements!(r,Ost)
    get_num_movements!(r,West)
    no=all+1
    while isborder(r,Nord)==false
        for i in 1:no
            putmarker!(r)
            move_if_possible!(r,Ost)
        end
        while move_if_possible!(r,West)==true
        end
        move!(r,Nord)
        no=no-1
    end
end