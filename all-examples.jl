### A Pluto.jl notebook ###
# v0.20.4

using Markdown
using InteractiveUtils

# ╔═╡ e955b756-01a6-11f0-190e-5b1a8d750176
md"""
# Introduction to Julia

collecting all example snippets from the presentation
"""

# ╔═╡ 488a2e2a-fae6-4f71-9432-ec39a0794990
md"""
## A few example commands for Slide 7
mention \pi<TAB> to get π
"""	

# ╔═╡ eefeffb3-f13d-4ac0-a894-c2f008a29fc8
a = 4

# ╔═╡ db493241-9e0b-4325-85e2-2d0003e6cdec
b = 6

# ╔═╡ 2b5b0a26-21d3-401c-8d32-315447f8d85b
c = "Moin!"

# ╔═╡ 0dca2800-c5d4-49b0-b282-b19bd71fd8cc
md"""
## Slide 11: Control Flow I
"""

# ╔═╡ b0fbc8b4-555f-4016-920d-30577af36c55
for i=1:4
    print(i," ")
end
# prints "1 2 3 4" on REPL, which Pluto displays in green

# ╔═╡ 0160658a-0d8f-4bf8-957b-e91501f9a2ee
for i ∈ 1:3, j ∈ 1:2
    print(i,"×",j,", ")
end

# ╔═╡ a7ab88a5-eb3c-448f-ba52-23f21f012006
for (i,j) ∈ zip(1:4, 5:8)
    print(i,"|",j," ")
end

# ╔═╡ 11fb4917-f8e9-4695-8378-34394e8bfe3a
v = [3*s for s ∈ 1:3] 

# ╔═╡ 213f4257-9092-4c38-b38f-73e10708131a
md"""
## Slide 12; Control Flow II: Conditionals
"""

# ╔═╡ 73cb0cb8-d948-4904-934c-b39b90eb00b8
x = 3; z = 1

# ╔═╡ d36acbc7-1b6f-4c24-9543-e62fbbae11f2
if (x > 3) || (z > 3) # brackets (x > 3) are optional
    print("one of x,z is at least 3")
else
    print("x,z are both 3 or less")
end

# ╔═╡ bdbd1e9f-0c21-4da5-a572-5281179ab3b2
(x > 4) && print("x > 4")

# ╔═╡ 3d5f0f52-a54f-48fc-9f85-7cf6e372016a
(x <= 4) || print("x > 4")

# ╔═╡ 2d7e78e0-36a7-4c5d-ae15-830443386c20
y = (x > 4) ? 1 : 3*x

# ╔═╡ de324579-9c06-4f52-9200-96fc4a17034d
md"""
## Slide 13: Defining functions
"""

# ╔═╡ b4ee432c-edc2-4eb6-8832-bd8e69f5f603
"""
    phase(z)

Compute the phase of a complex number z
"""
function phase(z)
    return atan(imag(z), real(z))
end

# ╔═╡ e93939bb-d4fd-421e-9c37-0ad080aae5c7
md"""
## Slide 14: positional and keyword args
"""

# ╔═╡ bb93ee87-b59c-4a8e-94d6-249637778536
f(a, b=2, c=3) = a*exp(b/c)

# ╔═╡ b99a004e-5c01-44fa-8dc1-8c32a41f0d2a
f(1) #equals f(1,2,3)

# ╔═╡ b5fac958-c0ca-4a1e-b947-119da1c69ed7
f(1,3) #equals f(1,3,3)

# ╔═╡ f47b09e2-70ef-4cb2-b241-2501ef82f44a
f(1,2,5) #equals f(1,2,5)

# ╔═╡ c672cfd1-471b-4488-9457-3acf130d4197
g(a; b=2, c=3) = a*exp(b/c)

# ╔═╡ 693eb9ea-268b-488e-90ec-260e60a10be0
g(1; b=3) #equals g(1; b=3, c=3)

# ╔═╡ 8eec5cc5-c1de-47a4-a476-79bd99ee65b0
g(1; c=5) #equals g(1; b=2, c=5)

# ╔═╡ 70ae8faa-e5a1-4dd2-803d-51a1f34cc6f5
md"""
## Slide 15: More on functions II: Broadcast & mutate
"""

# ╔═╡ ba823f78-c114-44a8-a728-a119578a11ab
fct = (x,y) -> x^y

# ╔═╡ de6799ca-1255-4166-b338-bdec88ddd1e9
fct(2,3)

# ╔═╡ 51fdf0f8-299b-4f1b-87eb-5efbb3885088
X = [0.1, 0.2, 0.3]; Y = [1.0, 2.0, 3.0]; X.^Y

# ╔═╡ 39ff9d75-55a5-45c5-8e68-7d3149e21f3e
# same as the comprehension – or [0.1, 0.04, 0.027]
[X[i]^Y[i] for i=1:3] 

# ╔═╡ b0d16859-896b-40a9-9aa5-be0b8282dfb7
md"""
## Slide 16: Data structures
"""

# ╔═╡ c75f55d4-065f-4eb1-80d5-884a4579d415
abstract type ExperimentData end

# ╔═╡ 6fa61308-d275-4482-89fa-33dbc418c693
"""
	TimeSeries <: ExperimentData

Describing the data type, it has a `name` and contains `data`.
"""
struct TimeSeries <: ExperimentData
    name::String
    data::Vector
end # default constructor:

# ╔═╡ 2719c32c-0a77-4df2-9477-c543a38896ef
ts = TimeSeries("A", [1,2,3])

# ╔═╡ 0baa0dc0-f3b7-49ed-8329-8fe48b805415
ts.name = "A"

# ╔═╡ 2ddb8d33-e4ca-413e-9d6d-f6adb81a2073
ts.data = [1,2,3]

# ╔═╡ 6517b042-287b-4bfb-a039-4e7a68d8c8a3
ts.data[2] = 2

# ╔═╡ eda709d0-475f-4dab-b080-f5f0da7c9347
mutable struct Measurement <: ExperimentData
    name::String
    value::Float64
end # same constructor

# ╔═╡ 9266dcea-df23-4609-a59f-757247d1bdc1
m = Measurement("B", 3.1415)

# ╔═╡ 81f1ade9-e01c-40c6-a20d-a777afba8733
m.name="B"

# ╔═╡ c156eee0-af41-458a-91b5-68187d0813cb
m.value = π

# ╔═╡ db75660a-a560-4356-b20d-fd5923765119
md"""
## Slide 17: Parametric types & functions
"""

# ╔═╡ e7b0e3e7-6729-45fc-999d-7e0a5a1d0230
begin 
	mutable struct TimeSeries2{T} <: ExperimentData
        param::T        # maybe some concentration
        data::Vector{T} # actually parametrized by element-type
    end
	function TimeSeries2(c::T, v::Vector{T}=fill(c,5)) where {T}
    	return TimeSeries2{T}(c, v)
	end
end

# ╔═╡ 93139b37-3ebf-40a5-838e-183bb7c5394c
# Constructor now maybe a bit clumsy:
ts2 = TimeSeries2{Float64}(3.1415, [1.2, 1.3])

# ╔═╡ 3e98061a-402d-4ac1-8c38-47598337cf51
# but if all are actually Float64, Julia can do it by itself
ts2b = TimeSeries2(3.1415, [1.2, 1.3])

# ╔═╡ 3670400a-059e-4906-a635-759606f2dec4


# ╔═╡ 7b46bfbf-8878-4899-91f7-993d1de1139b
ts2c = TimeSeries2(3.1415)

# ╔═╡ 403a3fe3-b0af-4f9d-9b4d-5113e7da5ab3
md"""
# Slide 18: Multiple dispatch
"""

# ╔═╡ 44aa4c60-9578-482a-875d-9f862f368ef9
begin
	h(x) = "A"
	h(x::Number) = "B"
	h(x::Float64) = "C"
end

# ╔═╡ d32a2025-af42-4204-8ea7-9e397348bca5
h.(["a", 1, 1.0im, 2.0])

# ╔═╡ cdbaf13e-5ed5-45ce-a522-ae6d6ae57919
function k(a::Number, t::TimeSeries)
  TimeSeries(t.name, a .* t.data)
end

# ╔═╡ 88e0f0cd-4419-40ee-ae8b-b4bdd713e2d1
function k(a::String, t::TimeSeries)
  TimeSeries("$(a) $(t.name)", t.data)
end

# ╔═╡ f0e8522f-234f-4319-9ece-a3d893189f53
function k(a::Number, ts::TimeSeries2)
  TimeSeries2(a*ts.param, a .* ts.data)
end

# ╔═╡ aacbbb39-974c-4264-9d7d-a429c4ecc814
k(2, ts)

# ╔═╡ 465d806e-77f8-415c-be49-331e319143f9
k("B", ts)

# ╔═╡ c0cf684b-f0f4-4d6c-924c-d44b5f7f4041
k(2, ts2)

# ╔═╡ dd0b9e86-e050-430c-8a46-e04213eea7b1
md"""
## Slide 19: Operators are functions
"""

# ╔═╡ 14699c91-21da-4665-a978-6e7dd6e07806
function Base.:+(t::TimeSeries, s::TimeSeries)
    if !(length(t.data)==length(s.data))
        error("Time series not of same length")
    end
    return TimeSeries(
        "$(t.name) and $(s.name)",
        t.data .+ s.data
    )
end

# ╔═╡ e226d58e-8038-47fa-ad59-be9745f2df1a
a+b

# ╔═╡ 7a1d110a-2638-4332-a802-25ef31d68b1d
d = 4 + 4.35

# ╔═╡ 0466a293-d8ae-4593-a0ed-b9f9d1fecd8a
e = π + 7

# ╔═╡ b7bbd91f-5028-4840-b686-91986135e781
begin # For technical reasons: a block in Pluto
    i = 1;
    while i <= 4 # do as long as i <= 4
        print(i," ");
        i += 1
    end # also prints "1 2 3 4"
end

# ╔═╡ 135387b1-5033-4495-9a82-575136d4403c
"""
	magnitude(z)

Compute the magnitute or absolute value of a (complex) number `z`
"""
magnitude(z) = sqrt(imag(z)^2+real(z)^2)

# ╔═╡ 732c516b-bfcc-48c6-9f77-12baebaf199d
Z = [1.0im, 2.0, 1.0 + 0.2im]

# ╔═╡ ee87fb78-8b59-476a-a7ff-358d7bd017ba
phase.(Z)

# ╔═╡ cfa2f5fe-e8ad-4f21-b0d1-6b8449cac77b
function add_scalar!(X, v)
    X .+= v  # X an array, v a scalar: add to every entry
    return X # the X we got passed is now changed
end

# ╔═╡ 82179377-b885-48e6-820c-b90d6fbecb70
V = [1,2,3]; add_scalar!(V, 2); V

# ╔═╡ bb7030e0-c47c-492f-b4ff-343c1c6c6670
u = TimeSeries("A", [1,2]) + TimeSeries("B", [3,4])

# ╔═╡ 81f5dab8-0109-4f8b-85bb-275417c6dffb
md"""
## Slide 20: Functors
"""

# ╔═╡ 32b93ce2-1f94-400d-9ded-57425e783b09
begin
	struct Polynomial{R}
    	coeffs::Vector{R}
	end
	function (p::Polynomial)(x)
    	v = p.coeffs[end] # Horner Schema, (a_2x + a_1)x + a_0
    	for i = (length(p.coeffs)-1):-1:1
        	v = v*x + p.coeffs[i]
    	end
    	return v
	end
end

# ╔═╡ 9904d0ca-6f1d-42cb-acdd-8421541d9a5b
p = Polynomial([1, 10, 100]); p(3)

# ╔═╡ 01d069f2-0997-499d-a12a-1638fa548be2
md"""
## Slide 24 Packages
"""

# ╔═╡ 1f9d209f-7455-4cb5-b451-c04ac57ffce7
module MyModule #Same naming convention as types: CamelCase
    	f(x) = x^2         # is exported
    	struct MyField end # is not exported
    	export f
end

# ╔═╡ fd3ef6c7-1359-4bae-837a-fdc6f2ecc06e
# illustrate this in REPL, since in Pluto they open too many workspaces
# using .MyModule

# ╔═╡ Cell order:
# ╟─e955b756-01a6-11f0-190e-5b1a8d750176
# ╟─488a2e2a-fae6-4f71-9432-ec39a0794990
# ╠═eefeffb3-f13d-4ac0-a894-c2f008a29fc8
# ╠═db493241-9e0b-4325-85e2-2d0003e6cdec
# ╠═e226d58e-8038-47fa-ad59-be9745f2df1a
# ╠═2b5b0a26-21d3-401c-8d32-315447f8d85b
# ╠═7a1d110a-2638-4332-a802-25ef31d68b1d
# ╠═0466a293-d8ae-4593-a0ed-b9f9d1fecd8a
# ╟─0dca2800-c5d4-49b0-b282-b19bd71fd8cc
# ╠═b0fbc8b4-555f-4016-920d-30577af36c55
# ╠═0160658a-0d8f-4bf8-957b-e91501f9a2ee
# ╠═a7ab88a5-eb3c-448f-ba52-23f21f012006
# ╠═11fb4917-f8e9-4695-8378-34394e8bfe3a
# ╠═b7bbd91f-5028-4840-b686-91986135e781
# ╟─213f4257-9092-4c38-b38f-73e10708131a
# ╠═73cb0cb8-d948-4904-934c-b39b90eb00b8
# ╠═d36acbc7-1b6f-4c24-9543-e62fbbae11f2
# ╠═bdbd1e9f-0c21-4da5-a572-5281179ab3b2
# ╠═3d5f0f52-a54f-48fc-9f85-7cf6e372016a
# ╠═2d7e78e0-36a7-4c5d-ae15-830443386c20
# ╟─de324579-9c06-4f52-9200-96fc4a17034d
# ╠═b4ee432c-edc2-4eb6-8832-bd8e69f5f603
# ╠═135387b1-5033-4495-9a82-575136d4403c
# ╟─e93939bb-d4fd-421e-9c37-0ad080aae5c7
# ╠═bb93ee87-b59c-4a8e-94d6-249637778536
# ╠═b99a004e-5c01-44fa-8dc1-8c32a41f0d2a
# ╠═b5fac958-c0ca-4a1e-b947-119da1c69ed7
# ╠═f47b09e2-70ef-4cb2-b241-2501ef82f44a
# ╠═c672cfd1-471b-4488-9457-3acf130d4197
# ╠═693eb9ea-268b-488e-90ec-260e60a10be0
# ╠═8eec5cc5-c1de-47a4-a476-79bd99ee65b0
# ╟─70ae8faa-e5a1-4dd2-803d-51a1f34cc6f5
# ╠═ba823f78-c114-44a8-a728-a119578a11ab
# ╠═de6799ca-1255-4166-b338-bdec88ddd1e9
# ╠═732c516b-bfcc-48c6-9f77-12baebaf199d
# ╠═ee87fb78-8b59-476a-a7ff-358d7bd017ba
# ╠═51fdf0f8-299b-4f1b-87eb-5efbb3885088
# ╠═39ff9d75-55a5-45c5-8e68-7d3149e21f3e
# ╠═cfa2f5fe-e8ad-4f21-b0d1-6b8449cac77b
# ╠═82179377-b885-48e6-820c-b90d6fbecb70
# ╠═b0d16859-896b-40a9-9aa5-be0b8282dfb7
# ╠═c75f55d4-065f-4eb1-80d5-884a4579d415
# ╠═6fa61308-d275-4482-89fa-33dbc418c693
# ╠═2719c32c-0a77-4df2-9477-c543a38896ef
# ╠═0baa0dc0-f3b7-49ed-8329-8fe48b805415
# ╠═2ddb8d33-e4ca-413e-9d6d-f6adb81a2073
# ╠═6517b042-287b-4bfb-a039-4e7a68d8c8a3
# ╠═eda709d0-475f-4dab-b080-f5f0da7c9347
# ╠═9266dcea-df23-4609-a59f-757247d1bdc1
# ╠═81f1ade9-e01c-40c6-a20d-a777afba8733
# ╠═c156eee0-af41-458a-91b5-68187d0813cb
# ╠═db75660a-a560-4356-b20d-fd5923765119
# ╠═e7b0e3e7-6729-45fc-999d-7e0a5a1d0230
# ╠═93139b37-3ebf-40a5-838e-183bb7c5394c
# ╠═3e98061a-402d-4ac1-8c38-47598337cf51
# ╠═3670400a-059e-4906-a635-759606f2dec4
# ╠═7b46bfbf-8878-4899-91f7-993d1de1139b
# ╠═403a3fe3-b0af-4f9d-9b4d-5113e7da5ab3
# ╠═44aa4c60-9578-482a-875d-9f862f368ef9
# ╠═d32a2025-af42-4204-8ea7-9e397348bca5
# ╠═cdbaf13e-5ed5-45ce-a522-ae6d6ae57919
# ╠═88e0f0cd-4419-40ee-ae8b-b4bdd713e2d1
# ╠═f0e8522f-234f-4319-9ece-a3d893189f53
# ╠═aacbbb39-974c-4264-9d7d-a429c4ecc814
# ╠═465d806e-77f8-415c-be49-331e319143f9
# ╠═c0cf684b-f0f4-4d6c-924c-d44b5f7f4041
# ╠═dd0b9e86-e050-430c-8a46-e04213eea7b1
# ╠═14699c91-21da-4665-a978-6e7dd6e07806
# ╠═bb7030e0-c47c-492f-b4ff-343c1c6c6670
# ╟─81f5dab8-0109-4f8b-85bb-275417c6dffb
# ╠═32b93ce2-1f94-400d-9ded-57425e783b09
# ╠═9904d0ca-6f1d-42cb-acdd-8421541d9a5b
# ╟─01d069f2-0997-499d-a12a-1638fa548be2
# ╠═1f9d209f-7455-4cb5-b451-c04ac57ffce7
# ╠═fd3ef6c7-1359-4bae-837a-fdc6f2ecc06e
