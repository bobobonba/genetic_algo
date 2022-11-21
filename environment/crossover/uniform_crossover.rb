module GeneticAlgo
  module Crossover
    class UniformCrossover
      def self.uniform_crossover(f_gene, m_gene)
        female_gene = f_gene.map{|g| g }
        male_gene = m_gene.map{|g| g }
        bit_mask = Array.new(female_gene.size) { rand(0..1) }

        bit_mask.each.with_index do |bit, index|
          if bit.zero?
            tmp = female_gene[index]
            female_gene[index] = male_gene[index]
            male_gene[index] = tmp
          end
        end
        [female_gene, male_gene]
      end
    end
  end
end
