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
        if ismarker(r)==false
            move_if_possible!(r,line_side[1])
        end
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
    while move_if_possible!(r,side)==true
        n=n+1
    end
    return n
end

move_num!(r,side,n)=
while n>0
    n=n-1
    move_if_possible!(r,side)
end

function movements_if_posible!(robot, side, max_num_steps)
    if typeof(side)==NTuple{2,HorizonSide}
        side=side[2]
    end
    m=true
    for _ in 1:max_num_steps
        m=move_if_possible!(robot,side)
    end
    return m
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
    move_if_possible!(r,side[1])
    move_if_possible!(r,side[2])
 else
    move_if_possible!(r,side)
 end

putmarkers!(r::Robot, side::HorizonSide) = 
begin
    while move_if_possible!(r,side)==true
        putmarker!(r)
    end
end

get_start_side(line_side::NTuple{2,HorizonSide}, ortogonal_line_side::NTuple{2,HorizonSide}) = ortogonal_line_side

inverseside(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

inverseside(side::NTuple{2,HorizonSide}) = (HorizonSide(mod(Int(side[1])+2, 4)),HorizonSide(mod(Int(side[2])+2, 4)))
putmarkers!(r::Robot,side::NTuple{2,HorizonSide}) =
while (move_if_possible!(r,side[1])==true && move_if_possible!(r,side[2])==true)
        putmarker!(r)
end

function get_num_movements!(r::Robot, side::HorizonSide)
    num_steps = 0
    while move_if_possible!(r,side)==true
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
        #УТВ: Робот или уперся в угол внешней рамки поля, или готов сделать шаг (или несколько) в направлении 
        # direct_side
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