function mark_kross(r)
    for side in (Nord, West, Sud, Ost)
        num_steps = putmarkers!(r,side)
        movements!(r,inverseside(side), num_steps)
    end
    putmarker!(r)
end


function putmarkers!(r::Robot,side::HorizonSide)
    num_steps=0 
    while move_if_possible!(r, side) == true
        putmarker!(r)
        num_steps += 1
    end 
    return num_steps
end
function move_if_possible!(r::Robot, direct_side::HorizonSide)::Bool
    orthogonal_side = nextside(direct_side)
    reverse_side = inverseside(orthogonal_side)
    num_steps=0
    if isborder(r,direct_side)==false
        move!(r,direct_side)
        result=true
    else
        while isborder(r,direct_side) == true
            if isborder(r, orthogonal_side) == false
                move!(r, orthogonal_side)
                num_steps += 1
            else
                break
            end
        end
        if isborder(r,direct_side) == false
            move!(r,direct_side)
            while isborder(r,reverse_side) == true
                move!(r,direct_side)
            end
            result = true
        else
            result = false
        end
        while num_steps>0
            num_steps=num_steps-1
            move!(r,reverse_side)
        end
    end
    return result
end


movements!(r::Robot, side::HorizonSide, num_steps::Int) =
for _ in 1:num_steps
    move_if_possible!(r,side)
end