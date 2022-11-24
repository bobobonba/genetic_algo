require_relative '../abstract_crossover.rb'

class UniformCrossover < GeneticAlgo::Environment::Crossover::AbstractCrossover
  def self.crossover_logic(chromosomes)
    female_chromo = chromosomes.first.map{ |g| g }
    male_chromo = chromosomes.last.map{ |g| g }
    #puts "f: #{female_chromo}"
    #puts "m: #{male_chromo}"
    bit_mask = Array.new(female_chromo.size) { rand(0..1) }

    bit_mask.each.with_index do |bit, index|
      if bit.zero?
        tmp = female_chromo[index]
        female_chromo[index] = male_chromo[index]
        male_chromo[index] = tmp
      end
    end
    [female_chromo, male_chromo]
  end
end
