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
          creatures = group_size.to_a.map do
            @config_obj.creature_class.new(@config_obj.chromosome_size, @config_obj.gene_types)
          end

          #evalクラスインスタンスの生成
          eval_instance = @config_obj.eval_class.new

          #mainループ
          @generation.times do |generation_index|
            #集団の評価
            points  = eval_instance.eval_for_array(creatures.map { |creature| creature.chromosome })

            #集団の選択
            selected_creatures = @config_obj.selected_group_size.map { @config_obj.select_class(points) }

            children = @config_obj.crossover_group_size.map do
              creatures_convi = creatures.sample(@config_obj.crossover_convi_number)
              @config_file_path.crossover_class.crossover(creatures_convi)
            end

            next_generations = (selected_creatures + children).flatten

            #次世代集団のそれぞれについて突然変異を行う
            next_generations.each_with_index do |creature, index|
              flag = rand(100)
              if flag <= @config_obj.mutation_probability
                mutant_chromosome = @config_obj.mutation_class.mutate(creature.chromosome, @config_obj.mutated_gene_number)
                next_generations[index] = @config_obj.creature_class.new(init_chromosome: mutant_chromosome)
              end
            end
          end
        end
      end
    end
  end
end