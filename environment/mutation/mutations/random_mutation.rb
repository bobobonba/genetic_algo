require_relative '../abstract_mutation.rb'

class RandomMutation < GeneticAlgo::Environment::Mutation::AbstractMutation
  def self.mutation_logic(chromo, mutated_num, g_types)
    chromosome = chromo.map{ |g| g }
    gene_types = g_types.map{ |g| g }
    mutate_index = (0...chromosome.size).to_a.sample(mutated_num)
    mutate_index.each do |index|
      chromosome[index] = gene_types.select{ |g| g != chromosome[index] }.sample
    end
    chromosome
  end
end


