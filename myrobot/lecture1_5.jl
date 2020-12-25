function mark_angles(r)
    x=0
    y=0
    while move_if_possible!(r,Sud)==true
        y=y+1
    end
    while move_if_possible!(r,West)==true
        x=x+1
    end
    for side in (Nord, Ost, Sud, West)
        while isborder(r,side)==false
            move!(r,side)
        end
        putmarker!(r)
    end
    while x>0
        x=x-1
        move_if_possible!(r,Ost)
    end
    while y>0
        y=y-1
        move_if_possible!(r,Nord)
    end
end
