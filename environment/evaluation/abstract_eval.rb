module GeneticAlgo
  module Evaluation
    class AbstractEval
      #評価値を返す
      def eval(chromosome)
        eval_logic(chromosome)
      end

      #評価値の一次元配列を返す
      def eval_for_array(chromosomes)
        chromosomes.map{ |chromosome| chromosome.eval }
      end

      private
      #評価ロジック
      #子クラスはこれを実装する
      #戻り値は評価値
      def eval_logic(chromosome)
      end
    end
  end
end
