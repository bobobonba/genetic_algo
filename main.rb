require './genetic_algo'

gene_size = 9
gene_types = ['cofee', 'water', 'banana', 'apple', 'rice', 'bread', 'nothing']

creature_num = 50

creatures = (0..creature_num).to_a.map do
  GeneticAlgo::Creature.new(gene_size: gene_size, gene_types: gene_types)
end


max_convi = Array.new
max_points = Array.new
100.times do
  ope_flag = rand(100)

  tmp_creatures = Array.new
  creatures_gene = creatures.map(&:gene)
  points = GeneticAlgo::Evaluation::KnapsackEvaluator.eval(creatures_gene)

  (creature_num / 2).times do
    index = GeneticAlgo::Select::RouletteSelect.roulette_select(points)
    tmp_creatures << creatures[index]
  end

  index_array = GeneticAlgo::Select::EliteSelect.elite_select(points, 10)
  index_array.each do |index|
    tmp_creatures << creatures[index]
  end

  (creature_num - tmp_creatures.size).times do
    c_pair = creatures.sample(2)
    gene_pair = GeneticAlgo::Crossover::UniformCrossover.uniform_crossover(c_pair[0].gene, c_pair[1].gene)
    point_pair = GeneticAlgo::Evaluation::KnapsackEvaluator.eval(gene_pair)
    if point_pair.first >= point_pair.last
      tmp_creatures << GeneticAlgo::Creature.new(init_gene: gene_pair.first)
    else
      tmp_creatures << GeneticAlgo::Creature.new(init_gene: gene_pair.last)
    end
  end
  
  (creature_num / 4).times do
    creature = tmp_creatures.sample
    creature_index = tmp_creatures.index(creature)
    mutant = GeneticAlgo::Mutation::RandomMutation.random_mutation(creature.gene, 3, gene_types)
    tmp_creatures[creature_index] = GeneticAlgo::Creature.new(init_gene: mutant)
  end

  max_convi << creatures[points.index(points.max)].gene
  max_points << points.max
  creatures = tmp_creatures
end

max_convi.each.with_index do |convi, index|
  p("#{convi} : #{max_points[index]}")
end

p max_points.max 

