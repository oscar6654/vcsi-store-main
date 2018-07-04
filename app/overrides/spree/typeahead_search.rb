Deface::Override.new(virtual_path: 'spree/shared/_main_nav_bar',
                     name: 'typeahead_search',
                     insert_after: 'div#search-bar',
                     partial: 'spree/shared/typeahead_search',
                     disabled: false)
