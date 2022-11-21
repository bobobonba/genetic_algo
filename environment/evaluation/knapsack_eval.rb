module GeneticAlgo
  module Evaluation
    class KnapsackEvaluator
      def self.eval(creatures_gene)
        value_hash = {"nothing" => 0, 'cofee' => 120, 'water' => 130, 'banana' => 80, 'apple' => 100, 'rice' => 250, 'bread' => 185 }
        weight_hash = {"nothing" => 0, 'cofee' => 10, 'water' => 12, 'banana' => 7, 'apple' => 9, 'rice' => 21, 'bread' => 16 }
        knapsack_limit = 65

        fitness_array = Array.new

        creatures_gene.each do |gene|
          if gene.map{ |item| weight_hash[item] }.sum > knapsack_limit
            fitness_array << (knapsack_limit - gene.map{ |item| weight_hash[item] }.sum)
          else
            values = gene.map{ |item| value_hash[item] }.sum
            fitness_array << values
          end
        end
        fitness_array
      end
    end
  end
end