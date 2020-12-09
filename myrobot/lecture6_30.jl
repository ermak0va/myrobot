function paint_gor(r)
    x=get_num_movements!(r,West)
    y=get_num_movements!(r,Sud)
    side=Ost
    y_all=0
    while isborder(r,Nord)==false
        y_all=y_all+1
        putmarker!(r)
        putmarkers!(r,Ost)
        move_if_possible!(r,Nord)
        putmarker!(r)
        putmarkers!(r,West)
        if isborder(r,Nord)==false
            move!(r,Nord)
            y_all=y_all+1
        end
    end
    putmarker!(r)
    putmarkers!(r,Ost)
    movements!(r,West)
    movements!(r,Sud,y_all-y)
    movements!(r,Ost,x)
end