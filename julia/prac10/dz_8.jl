
function visualisation(D, colors; markersize, backend::Function)
    backend()
    p=plot()
    for i in 1:length(colors)
        plot!(p, real(D[i]), imag(D[i]),
            seriestype = :scatter,
            markersize = markersize,
            markercolor = colors[i])
    end
    plot!(p; ratio = :equal, legend = false)
end

function newton(z::Complex, root::Vector{Complex}, ε::AbstractFloat,nmaxiter::Integer) 
    n=length(root)
    for k in 1:nmaxiter  
        z -= (z - 1/z^(n-1))/n 
        root_index = findfirst(r->abs(r-z) <= ε, root) 
        if !isnothing(root_index)
            return root_index
        end
    end
    return nothing
end


kelliproblem(; colors = [:red,:green,:blue], # определяет цвета бассейнов
               nmaxiter = 40, # определяет число итераций
               ε = 0.5, # определяет принадлежность корню
               numpoints = 10_000_000, # определяет число точек
               squaresize = 500, # определяет размер рассматриваемого квадрата на комплексной плоскости
               markersize = 0.01,  # опеределяет размер точки
               backend::Function = pyplot # определяет используемую графическую библиотеку 
            )
    n = length(colors)
    root = [exp(im*2π*k/n) for k in 0:n-1]
    D = []
    for _ in 1:n
        z = complex((rand(2) .- 0.5) .* squaresize)
        push!(D,newton(z,root,ε,nmaxiter))
    end
    visualisation(D,colors;markersize,backend)
end