module GeneticAlgo
  class Creature
    attr_reader :gene

    def initialize(gene_size: nil, gene_types: nil, init_gene: nil)
      @gene_size = gene_size || init_gene.size
      @gene_types = gene_types || init_gene.uniq

      @gene = generate_gene(@gene_size, @gene_types, init_gene: init_gene)
    end

    def generate_gene(size, types, init_gene: nil)
      if init_gene.nil?
        Array.new(size) { types.sample }
      else
        init_gene
      end
    end
  end
end
