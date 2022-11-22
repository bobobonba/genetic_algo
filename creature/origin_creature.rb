module GeneticAlgo
  module Creature
    class OriginCreature
      attr_reader :chromosome

      def initialize(chromosome_size, gene_types, init_chromosome: nil)
        @chromosome_size = chromosome_size
        @gene_types = gene_types
        
        @chromosome = generate_chromosome(@chromosome_size, @gene_types, init_array: init_chromosome)
      end

      private
      def generate_chromosome(size, types, init_array: nil)
        if init_array.nil?
          Array.new(size) { types.sample }
        else
          init_array
        end
      end
    end
  end
end
