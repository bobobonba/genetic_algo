require 'csv'

module GeneticAlgo
  module Evaluation
    class Evaluator
      def self.eval(creatures_gene)
        collect_answers = CSV.open('./problem.csv').map {|row| row[1] }
        fitness_array = creatures_gene.map do |gene|
          point = 0
          collect_answers.each.with_index do |answer, index|
            if answer == gene[index]
              point += 1
            end
          end
          point
        end

        fitness_array
      end
    end
  end
end