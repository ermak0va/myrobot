function mark_zebra!(robot, line_side, ortogonal_line_side, num_passes, num_start_passes=0)
    num_passes+=1
    start_side = get_start_side(line_side,ortogonal_line_side)
    num_steps = [get_num_movements!(robot,inverseside(start_side[i])) for i in 1:2]
    movements_if_posible!(robot, ortogonal_line_side, num_start_passes) || return
    line_mark!(robot,inverseside(line_side))
    line_mark!(robot,line_side)
    while movements_if_posible!(robot,ortogonal_line_side, num_passes) == true
        line_mark!(robot,line_side)
        line_side = inverseside(line_side)
        line_mark!(robot,line_side)
    end
    back_side=inverseside(start_side)
    move_end!(r,back_side[1])
    move_end!(r,back_side[2])
    move_num!(robot,start_side[1], num_steps[1])
    move_num!(robot,start_side[2], num_steps[2])
end

function move_end!(r,side)
    n=0
    while isborder(r,side)==false
        n=n+1
        move!(r,side)
    end
    return n
end

move_num!(r,side,n)=
while n>0 && isborder(r,side)==false
    n=n-1
    move!(r,side)
end

function movements_if_posible!(robot, side, max_num_steps)
    for _ in 1:max_num_steps
        isbordered(robot,side) && (return false)
        moved!(robot,side)
    end
    return true
end

function line_mark!(robot,side)
    putmarker!(robot)
    putmarkers!(robot,side)
end

get_start_side(line_side::HorizonSide,ortogonal_line_side::HorizonSide) = (line_side,ortogonal_line_side)

 isbordered(r,side)=
 if typeof(side)==NTuple{2,HorizonSide}
     isborder(r,side[1])||isborder(r,side[2])
 else
     isborder(r,side)
 end
 
 moved!(r,side)=
 if typeof(side)==NTuple{2,HorizonSide}
     move!(r,side[1])
     move!(r,side[2])
 else
     move!(r,side)
 end

putmarkers!(r::Robot, side::HorizonSide) = 
while isbordered(r,side)==false
    move!(r,side)
    putmarker!(r)
end

get_start_side(line_side::NTuple{2,HorizonSide}, ortogonal_line_side::NTuple{2,HorizonSide}) = ortogonal_line_side

inverseside(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

inverseside(side::NTuple{2,HorizonSide}) = (HorizonSide(mod(Int(side[1])+2, 4)),HorizonSide(mod(Int(side[2])+2, 4)))
putmarkers!(r::Robot,side::NTuple{2,HorizonSide}) =
while isbordered(r,side)==false
        moved!(r,side)
        putmarker!(r)
end

function get_num_movements!(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r,side)==false 
        move!(r,side) 
        num_steps += 1    
    end
    return num_steps
end