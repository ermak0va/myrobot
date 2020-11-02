# Файл roblib.jl

"""
    moves!(r::Robot, side::HorizonSide)

-- перемещает Робота до упора в заданном направлении
"""
moves!(r::Robot, side::HorizonSide) = 
while isborder(r,side) 
    move!(r,side) 
end

"""
    moves!(r::Robot, side::HorizonSide, num_steps::Int)

-- перемещает Робота в заданном направлении на заданное число шагов (если на пути - перегородка, то - ошибка)
"""
moves!(r::Robot, side::HorizonSide, num_steps::Int) = 
for _ in 1:num_steps
    move!(r,side)
end

"""
    find_border!(r::Robot,side_to_border::HorizonSide, side_of_movement::HorizonSide)

-- останавливает робота у перегородки, которая ожидается с направления side_to_border, при движении робота "змейкой" в сторону перегородки (от упора до упора в поперечном этому напавлении). 

-- side_of_movement - начальное "поперечное" направление
"""
find_border!(r::Robot,side_to_border::HorizonSide, side_of_movement::HorizonSide) = 
while isborder(r,side_to_border)==false  
    if isborder(r,side_of_movement)==false
        move!(r,side_of_movement)
    else
        move!(r,side_to_border)
        side_of_movement=inverse(side_of_movement)
    end
end

"""
    inverseside(side::HorizonSide)

-- возвращает сторону горизонта, противоположную заданной
"""
inverseside(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))

nextside(side::HorizonSide)=HorizonSide(mod(Int(side)+1, 4))

"""
    putmarkers!(r::Robot, side::HorizonSide)

-- ставит маркеры, пермещая Робота до упора в заданном направлении (в начальной клетке маркер не ставится)    
"""
putmarkers!(r::Robot, side::HorizonSide) = 
while isborder(r,side)==false
    move!(r,side)
    putmarker!(r)
end

"""
    putmarkers!(r::Robor,side_of_movement::Horizonside,side_to_border::HorizonSide)

-- Ставит маркеры и перемещает Робота в направлении side_of_movement пока рядом с ним в направлении side_to_border имеется перегородка (эти два направления должны быть взаимно перпендикулярными) 
"""
putmarkers!(r::Robot,side_of_movement::HorizonSide,side_to_border::HorizonSide) = 
while isborder(r,side_to_border)==true
    move!(r,side_of_movement)
end

movements!(r::Robot, side::HorizonSide, num_steps::Int) = for _ in 1:num_steps move!(r,side) end

movements!(r::Robot, side::HorizonSide) = while isborder(r,side)==false move!(r,side) end 
    
function get_num_movements!(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r,side)==false 
        move!(r,side) 
        num_steps += 1    
    end
    return num_steps
end

"""
    through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})

-- Перемещает Робота в заданный угол, прокладывая путь межу внутренними прямоугольными перегородками и возвращает массив, содержащий числа шагов в каждом из заданных направлений на этом пути
"""
function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот - не в юго-западном углу
        push!(num_steps, movements!(r, angle[2]))
        push!(num_steps, movements!(r, angle[1]))
    end
    return num_steps
end

"""
    movements!(r,sides,num_steps::Vector{Int})

-- перемещает Робота по пути, представленного двумя последовательностями, sides и num_steps 
-- sides - содержит последовательность направлений перемещений
-- num_steps - содержит последовательность чисел шагов в каждом из этих направлений, соответственно; при этом, если длина последовательности sides меньше длины последовательности num_steps, то предполагается, что последовательность sides должна быть продолжена периодически        
"""
function movements!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(num_steps)
        movements!(r, sides[mod(i-1, length(sides))+1], n)
    end
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