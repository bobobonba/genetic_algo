require 'yaml'

module GeneticAlgo
  module Config
    class Config
      attr_reader(:yaml_hash, :generation, :group_size, :creature_class, :chromosome_size, :gene_types, :eval_class,\
                  :select_class, :selected_group_size, :crossover_class, :crossover_group_size, \
                  :crossover_probability, :mutation_class, :mutation_probability, :mutated_gene_number)



      def initialize(file_path)
        @config_file_path = file_path
        @yaml_hash = open(File.expand_path(@config_file_path, File.dirname(__FILE__))) { |file| YAML.load(file) }

        @generation = @yaml_hash['generation']
        @group_size = @yaml_hash['group_size']

        @creature_path = @yaml_hash['creature_path']
        require_file(@creature_path)
        @creature_class = convert_to_class(@yaml_hash['creature_class'])
        @chromosome_size = @yaml_hash['chromosome_size']
        @gene_types = @yaml_hash['gene_types']

        @eval_path = @yaml_hash['eval_path']
        require_file(@eval_path)
        @eval_class = convert_to_class(@yaml_hash['eval_class'])

        @select_path = @yaml_hash['select_path']
        require_file(@select_path)
        @select_class = convert_to_class(@yaml_hash['select_class'])
        @selected_group_size = @yaml_hash['selected_group_size']

        @crossover_path = @yaml_hash['crossover_path']
        require_file(@crossover_path)
        @crossover_class = convert_to_class(@yaml_hash['crossover_class'])
        @crossover_convi_number = @yaml_hash['crossover_convi_number']
        @crossover_probability = @yaml_hash['crossover_probability']
        @crossover_group_size = @yaml_hash['crossover_group_size']

        @mutation_path = @yaml_hash['mutation_path']
        require_file(@mutation_path)
        @mutation_class = convert_to_class(@yaml_hash['mutation_class'])
        @mutation_probability = @yaml_hash['mutation_probability']
        @mutated_gene_number  = @yaml_hash['mutated_gene_number']
      end

      private
      def convert_to_class(string)
        Module.const_get(string)
      end

      def require_file(file_path)
        require_relative(file_path)
      end
    end
  end
end