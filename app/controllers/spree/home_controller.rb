module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      if spree_current_user
        # Rails.cache.clear
        @searcher = build_searcher(params.merge(include_images: true))
        @products = @searcher.retrieve_products
        @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
        @products = @products.where(featured: true)
        @taxonomies = Spree::Taxonomy.includes(root: :children)
      else
        # Rails.cache.clear
        @searcher = build_searcher(params.merge(include_images: true))
        @products = @searcher.retrieve_products
        @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
        @products = @products.where(featured: true)
        @taxonomies = Spree::Taxonomy.includes(root: :children)
      end
    end
  end
end
