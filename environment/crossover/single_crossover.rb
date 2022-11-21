module GeneticAlgo
  module Crossover
    class SingleClossover
      def self.single_clossover(f_gene, m_gene)
        female_gene = f_gene.map{|g| g}
        male_gene = m_gene.map{|g| g}

        if female_gene.size > male_gene.size
          cross_point = female_gene.size - male_gene.size
          
          (cross_point...female_gene.size).each do |index|
            tmp = female_gene[index]
            female_gene[index] = male_gene[index - cross_point]
            male_gene[index - cross_point] = tmp
          end
        else
          cross_point = rand(female_gene.size)

          (cross_point...female_gene.size).each do |index|
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

