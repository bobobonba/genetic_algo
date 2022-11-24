module GeneticAlgo
  module Environment
    module Mutation
      class AbstractMutation
        def self.mutate(chromosome, mutated_num, gene_types)
          mutation_logic(chromosome, mutated_num, gene_types)
        end
  
        #継承したクラスはこのメソッドを実装する
        def self.mutation_logic(chromosome, mutated_num, gene_types)
        end
      end
    end
  end
end
