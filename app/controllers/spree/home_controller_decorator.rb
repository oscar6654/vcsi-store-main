module Spree
  HomeController.class_eval do
    def sale
      # TODO Refactor to include sales in searcher builder
      if params[:id]
        @taxon = Spree::Taxon.find_by!(slug: params[:id])
        @products = Spree::Product.in_sale.in_taxon(@taxon)
      else
        @products = Spree::Product.in_sale
        
        #@searcher = build_searcher(params.merge(include_images: true))
        #@products = @searcher.retrieve_products
        #@products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
        #@products = @products.joins(master: :sale_prices)
        #                  .where(spree_sale_prices: {enabled: true})
      end
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
