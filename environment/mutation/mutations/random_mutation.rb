module GeneticAlgo
  module Mutation
    class RandomMutation
      def self.random_mutation(g, mutate_num, g_types)
        gene = g.map{ |g| g }
        gene_types = g_types.map{ |g| g }

        mutate_index = (0...gene.size).to_a.sample(mutate_num)

        mutate_index.each do |index|
          gene[index] = gene_types.select{ |g| g != gene[index] }.sample
        end
        
        gene
      end
    end
  end
end

