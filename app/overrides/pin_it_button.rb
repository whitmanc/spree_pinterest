Deface::Override.new(:virtual_path => "spree/shared/_products",
                     :insert_bottom => "[data-hook='products_list_item']",
                     :text => "<%= facebook_button(product) %><div style='height:50px;width:50px; float: left'><%= pin_it_button(product) %></div>",
                     :name => "index_pin_it")