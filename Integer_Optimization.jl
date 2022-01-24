using JuMP
using GLPK  # replace GLPK with the name of your solver package if necessary (e.g. Gurobi)

function gcd(a::Int, b::Int)
    model = Model(GLPK.Optimizer)  # replace Gurobi with the name of your solver package if necessary (e.g. Gurobi)
    
    ### MODEL ##############
    # Integer variables x and y
    @variable(model, x, Int)
    @variable(model, y, Int)

    # Constraint
    @constraint(model, a*x + b*y >= 1)

    # Objective value
    @objective(model, Min, a*x + b*y)
    ##########################

    # pretty-print the model and solve it
    print(model)
    optimize!(model)
    
    # retrieve and print objective value
    println()
    println("====== SOLUTION ======")
    println("gcd($(a), $(b)) = ", round(Int, objective_value(model)))  # Note: everything inside $(...) will be replaced with its actual value
    
    #=
        TODO for part (c):
        Retrieve solution. Access the value that variable x1 takes in the optimal solution by
            value(x1)
    =#
end

gcd(13,2)
gcd(8265, 24)