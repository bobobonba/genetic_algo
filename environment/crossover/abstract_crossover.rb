module GeneticAlgo
  module Environment
    module Crossover
      class AbstractCrossover
        def self.crossover(chromosomes)
          crossover_logic(chromosomes)
        end
  
        #継承したクラスはこのメソッドを実装する
        private
        def self.crossover_logic(chromosomes)
        end
      end
    end
  end
end
