# CGEHelpers

[![Build Status](https://github.com/mivanic/CGEHelpers.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/mivanic/CGEHelpers.jl/actions/workflows/CI.yml?query=branch%3Amaster)

# The purpose

The purpose of this package is to offer a library of common functions used in computable general equilibrium (CGE) modeling. CGE relies on several common types of demand functions arising from various preference/production structures (e.g., Cobb-Douglas, Constant Elasticity of Substitution, Constant Difference of Elasticities, etc.)

The functions in this package in principle help calculate a vector of demands. For example, if the user would like to calculate CES demands for output of 10, with three commodities of prices `[1,2,3]`, distribution parameters `[0.1, 0.3, 0.6]`, and elasticity of substitution `2.1` and scaling factor `2` they can run

```
ces(10, [1,2,3], [0.1,0.3,0.6], 2.1, 2)

# Result:
# 1.5374084155938235
# 3.6023084600464648
# 6.591014163653714

```
The package currently includes CES/CET function, and CDE function.
