#главная функция
function crest(r::Robot)
    i=0
    while (ismarker(r)==false) && (i<4)
        side=HorizonSide(i)
        i=i+1;
        mark_side(r,side)
    end
    putmarker!(r)
end
#вспомогательные фyнкции
function mark_side(r::Robot, side::HorizonSide) 
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
    side=HorizonSide(mod(Int(side)+2,4))
    while ismarker(r)==true 
        move!(r,side)
    end
end
