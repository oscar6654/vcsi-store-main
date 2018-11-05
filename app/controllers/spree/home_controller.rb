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
        # binding.pry
        @products = @products.where(featured: true)
        # @products = @products.in_sale
        @taxonomies = Spree::Taxonomy.includes(root: :children)
      else
        # Rails.cache.clear
        @searcher = build_searcher(params.merge(include_images: true))
        @products = @searcher.retrieve_products
        @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
        # @products = @products.where(featured: true)
        @products = @products.in_sale
        @taxonomies = Spree::Taxonomy.includes(root: :children)
      end
    end

    def build_searcher(params)
      searcher_class.new(params).tap do |searcher|
        searcher.current_user = try_spree_current_user
        searcher.current_currency = current_currency
      end
    end

    def searcher_class
      @searcher_class = Spree::Core::Search::Base
    end


  end
end
