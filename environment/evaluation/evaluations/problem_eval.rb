require_relative '../abstract_eval.rb'

class ProblemEvaluator < GeneticAlgo::Environment::Evaluation::AbstractEval
  def eval_logic(chromosome)
    x_coordinate = [100, 200, 100, 200]
    y_coordinate = [100, 100, 200, 200]

    point = 0
    x_coordinate.size.times do |index|
      point += distance(x_coordinate[index], y_coordinate[index], chromosome.first, chromosome.last)
    end

    point
  end

  def distance(xi, yi, x, y)
    Math.sqrt((xi - x)**2 + (yi - y)**2)
  end
end
