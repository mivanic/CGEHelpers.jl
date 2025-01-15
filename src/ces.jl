"""
           ces(y, p, α, σ, γ)

       Compute the vector of demands for output `y` under CES technology with a price vector `p`, 
       distribution parameters `α`, elasticity `σ` and scaling factor `γ`.

       # Examples
       ```jldoctest
       julia> ces(10, [1,2,3], [.1,.3,.6], 2.1, 2)
       3-element Vector{Float64}:
       1.5374084155938235
       3.6023084600464648
       6.591014163653714
       ```
"""
function ces(y, p, α, σ, γ)
   if σ == 1
      y / (γ * prod((α ./ p) .^ α)) * (α ./ p)
   elseif σ == 0
      y .* α ./ γ
   elseif σ > 0
      α = Vector(α)
      c = 1 / γ * sum((α .^ σ) .* (p .^ (1.0 - σ)))^(1.0 / (1.0 - σ))
      toRet = Vector((y / γ) .* ((α .* γ .* c) ./ (p)) .^ σ)
      toRet[α.==0] .= 0
      return (toRet)
   else
      σ_adj = fill(σ, length(p))
      σ_adj[Vector(α).==0] .= 1
      c = 1 / γ * sum((α .^ σ_adj) .* (p .^ (1 - σ)))^(1 / (1 - σ))
      toret = (y / γ) .* ((α .* γ .* c) ./ (p)) .^ σ_adj
      return (toret)
   end
end



