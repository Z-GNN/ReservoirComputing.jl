using ReservoirComputing

train_data = ones(Int, 2, 10)
rule = 30
generations = 3
expansion_size = 10
permutations = 2

reca = RECA_discrete(train_data, rule, generations, expansion_size, permutations)

@test isequal(reca.train_data, train_data)
@test isequal(reca.rule, rule)
@test isequal(reca.generations, generations)
@test isequal(reca.expansion_size, expansion_size)
@test isequal(reca.permutations, permutations)

W_out = ESNtrain(reca, 0.001, train_data = ones(Float64, 2, 10))
output = RECAdirect_predict_discrete(reca, W_out, ones(Int, 2, 10))

@test isequal(size(output), size(ones(Int, 2, 10)))
