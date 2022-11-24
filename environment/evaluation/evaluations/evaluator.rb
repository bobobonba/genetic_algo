require_relative '../abstract_eval.rb'

class TestEvaluator < GeneticAlgo::Environment::Evaluation::AbstractEval
  def eval_logic(chromosome)
    answer = ['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C']
    point = 0
    answer.each.with_index do |ans, index|
      if ans == chromosome[index]
        point += 1
      end
    end
    point
  end
end