module Spree
  class TaxonsController < Spree::StoreController
    helper 'spree/products'

    respond_to :html

    def show
      Searchkick.disable_callbacks
      @taxon = Taxon.friendly.find(params[:id])
      return unless @taxon
      @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
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
    private

    def accurate_title
      @taxon.try(:seo_title) || super
    end
  end
end
