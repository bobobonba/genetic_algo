module GeneticAlgo
  module Mutation
    class AbstractMutation
      def self.mutate(chromosome)
        mutation_logic(chromosome)
      end

      #継承したクラスはこのメソッドを実装する
      def self.mutation_logic(chromosome)
      end
    end
  end
end
