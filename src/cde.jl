"""
           cde(α, β, e, u, p, c)

       Compute the vector of demands and sum of consumption shares for a CDE demand system, 
       with parameters `α`, `β` and `e`, at utility level `u`, prices `p` and income `c`.

       # Examples
       ```jldoctest
       julia> cde([0.1, 0.2, 0.3], [1, 2, 3], [1.1, 0.9, 1.0], 1, [2, 1, 1], [4])
        4-element Vector{Float64}:
        0.5341500255889858
        1.1690947909189762
        1.762605157903052
        2.3324281115373924
        ```
"""
function cde(α, β, e, u, p, c)
    x = β .* u .^ (e .* (1 .- α)) .* (1 .- α) .* (p ./ c) .^ (-α) ./ sum((β) .* u .^ (e .* (1 .- α)) .* (1 .- α) .* (p ./ c) .^ (1 .- α))
    i = sum(β .* u .^ ((1 .- α) .* e) .* (p ./ c) .^ (1 .- α))

    return [x; i]
end


cde([0.1, 0.2, 0.3], [1, 2, 3], [1.1, 0.9, 1.0], 1, [2, 1, 1], [4])
