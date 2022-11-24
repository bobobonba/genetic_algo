module GeneticAlgo
  module Environment
    module LifeCycle
      class SimpleLifeCycle
        def initialize(config_obj)
          @config_obj = config_obj

          @generation = @config_obj.generation
        end

        def life_cycle
          cycle_logic
        end

        private
        #継承したクラスはこのメソッドをオーバーロード
        def cycle_logic

          #初期集団の生成
          group_size = @config_obj.group_size
          creatures = (0..group_size).to_a.map do
            @config_obj.creature_class.new(@config_obj.chromosome_size, @config_obj.gene_types.to_a)
          end

          #puts "init: #{creatures.map(&:chromosome)}"

          #evalクラスインスタンスの生成
          eval_instance = @config_obj.eval_class.new

          #puts "init points: #{eval_instance.eval_for_array(creatures.map(&:chromosome))}"

          #mainループ
          @generation.times do |generation_index|
            #集団の評価
            points = eval_instance.eval_for_array(creatures.map { |creature| creature.chromosome })

            #集団の選択
            selected_index = (0..@config_obj.selected_group_size).to_a.map { @config_obj.select_class.select(points) }
            selected_creatures = selected_index.map { |index| creatures[index] }

            #交叉
            children = (0..@config_obj.crossover_group_size).to_a.map do
              creatures_convi = creatures.sample(@config_obj.crossover_convi_number)
              children_convi = @config_obj.crossover_class.crossover(creatures_convi.map(&:chromosome))
              init_chromosome = eval_instance.evaluation(children_convi.first) > eval_instance.evaluation(children_convi.last) ? children_convi.first : children_convi.last
              @config_obj.creature_class.new(init_chromosome: init_chromosome)
            end
            next_generations = selected_creatures + children
            

            #次世代集団のそれぞれについて突然変異を行う
            next_generations.each_with_index do |creature, index|
              flag = rand(100)
              if flag <= @config_obj.mutation_probability * 100
                mutant_chromosome = @config_obj.mutation_class.mutate(creature.chromosome, @config_obj.mutated_gene_number, @config_obj.gene_types)
                next_generations[index] = @config_obj.creature_class.new(init_chromosome: mutant_chromosome)
              end
            end

            puts "i: #{generation_index}\nmax point: #{points.max}\nmax convi: #{creatures[points.index(points.max)].chromosome}\n" 
            #puts "#{eval_instance.eval_for_array(creatures.map(&:chromosome))}"
            #creatures[points.index(points.max)].chromosome
            #points.max
            creatures = next_generations
          end
        end
      end
    end
  end
end