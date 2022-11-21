module GeneticAlgo
  module Crossover
    class DoubleCrossover
      def self.double_crossover(f_gene, m_gene)
        female_gene = f_gene.map{|g| g }
        male_gene = m_gene.map{|g| g }

        first_point = rand(female_gene.size - 1)
        second_point = first_point == female_gene.size - 2 ? first_point : rand((first_point + 1)...(female_gene.size - 1))

        (first_point..second_point).each do |index|
          tmp = female_gene[index]
          female_gene[index] = male_gene[index]
          male_gene[index] = tmp
        end

        [female_gene, male_gene]
      end
    end
  end
end

